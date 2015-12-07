// Copyright 2015 National ICT Australia Limited (NICTA)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "PowerFlow.h"

#include <iostream>
#include <sstream>

using namespace arma;

namespace Sgt
{
    namespace
    {
        const int nPhases = 9;

        Phase allPhases[nPhases + 1] =
        {
            Phase::BAL,
            Phase::A,
            Phase::B,
            Phase::C,
            Phase::G,
            Phase::N,
            Phase::SP,
            Phase::SM,
            Phase::SN,
            Phase::BAD
        };
    }

    std::size_t Phases::phaseIndex(Phase p) const 
    {
        if (!hasPhase(p))
        {
            throw std::out_of_range("Requested phase does not exist.");
        }
        return static_cast<std::size_t>(idxMap_.at(p));
    }

    std::string to_string(BusType type)
    {
        switch (type)
        {
            case BusType::SL:
                return "SL";
            case BusType::PQ:
                return "PQ";
            case BusType::PV:
                return "PV";
            case BusType::NA:
                return "NA";
            case BusType::BAD:
                return "BAD";
        }
        return "ERROR";
    }

    template<> BusType from_string<BusType>(const std::string& str)
    {
        static BusType busTypes[] = {BusType::SL, BusType::PQ, BusType::PV, BusType::BAD};
        BusType result = BusType::BAD;
        for (BusType* test = &busTypes[0]; *test != BusType::BAD; ++test)
        {
            if (str == to_string(*test))
            {
                result = *test;
            }
        }
        return result;
    }

    std::string to_string(Phase phase)
    {
        switch (phase)
        {
            case Phase::BAL:
                return "BAL";
            case Phase::A:
                return "A";
            case Phase::B:
                return "B";
            case Phase::C:
                return "C";
            case Phase::G:
                return "G";
            case Phase::N:
                return "N";
            case Phase::SP:
                return "SP";
            case Phase::SM:
                return "SM";
            case Phase::SN:
                return "SN";
            case Phase::BAD:
                return "BAD";
        }
        return "ERROR";
    }

    template<> Phase from_string<Phase>(const std::string& str)
    {
        static Phase phases[] = {Phase::BAL, Phase::A, Phase::B, Phase::C, Phase::G, Phase::N, Phase::SP,
                                 Phase::SM, Phase:: SN, Phase::BAD
                                };
        Phase result = Phase::BAD;
        for (Phase* test = &phases[0]; *test != Phase::BAD; ++test)
        {
            if (str == to_string(*test))
            {
                result = *test;
            }
        }
        return result;
    }

    const char* phaseDescr(Phase phase)
    {
        switch (phase)
        {
            case Phase::BAL:
                return "balanced/1-phase";
            case Phase::A:
                return "3-phase A";
            case Phase::B:
                return "3-phase B";
            case Phase::C:
                return "3-phase C";
            case Phase::G:
                return "ground";
            case Phase::N:
                return "neutral";
            case Phase::SP:
                return "split-phase +ve";
            case Phase::SM:
                return "split-phase -ve";
            case Phase::SN:
                return "split-phase neutral";
            case Phase::BAD:
                return "UNDEFINED";
        }
        return "ERROR";
    }

    Phases& Phases::operator&=(const Phases& other)
    {
        mask_ &= other;
        rebuild();
        return *this;
    }

    Phases& Phases::operator|=(const Phases& other)
    {
        mask_ |= other;
        rebuild();
        return *this;
    }

    std::string Phases::to_string() const
    {
        std::ostringstream ss;
        ss << phaseVec_[0];
        for (std::size_t i = 1; i < phaseVec_.size(); ++i)
        {
            ss << "|" << phaseVec_[i];
        }
        return ss.str();
    }

    void Phases::rebuild()
    {
        phaseVec_ = PhaseVec();
        phaseVec_.reserve(nPhases);
        idxMap_ = IdxMap();
        for (unsigned int i = 0, j = 0; allPhases[i] != Phase::BAD; ++i)
        {
            if (hasPhase(allPhases[i]))
            {
                phaseVec_.push_back(allPhases[i]);
                idxMap_[allPhases[i]] = j++;
            }
        }
        phaseVec_.shrink_to_fit();
    }

    Mat<Complex> carson(uword nWire, const Mat<double>& Dij, const Col<double> resPerL,
                              double L, double freq, double rhoEarth)
    {
        // Calculate the primative Z matrix (i.e. before Kron)
        Mat<Complex> Z(nWire, nWire, fill::zeros);
        double freqCoeffReal = 9.869611e-7 * freq;
        double freqCoeffImag = 1.256642e-6 * freq;
        double freqAdditiveTerm = 0.5 * log(rhoEarth / freq) + 6.490501;
        for (uword i = 0; i < nWire; ++i)
        {
            Z(i, i) = {resPerL(i) + freqCoeffReal, freqCoeffImag * (log(1 / Dij(i, i)) + freqAdditiveTerm)};
            for (uword k = i + 1; k < nWire; ++k)
            {
                Z(i, k) = {freqCoeffReal, freqCoeffImag * (log(1 / Dij(i, k)) + freqAdditiveTerm)};
                Z(k, i) = Z(i, k);
            }
        }
        Z *= L; // Z has been checked against example in Kersting and found to be OK.

        return Z;
    }

    Mat<Complex> kron(const Mat<Complex>& Z, uword nPhase)
    {
        auto n = Z.n_rows;
        if (n == nPhase)
        {
            return Z;
        }
        else
        {
            sgtAssert(nPhase < n, "Kron reduction: nPhase must be <= the impedance matrix size.");
            auto Zpp = Z.submat(0, 0, nPhase - 1, nPhase - 1);
            auto Zpn = Z.submat(0, nPhase, nPhase - 1, n - 1);
            auto Znp = Z.submat(nPhase, 0, n - 1, nPhase - 1);
            auto Znn = Z.submat(nPhase, nPhase, n - 1, n - 1);
            auto ZnnInv = inv(Znn);

            return (Zpp - Zpn * ZnnInv * Znp);
        }
    }

    Mat<Complex> ZLine2YNode(const Mat<Complex>& ZLine)
    {
        auto n = ZLine.n_rows;

        // The line admittance matrix
        Mat<Complex> YLine = inv(ZLine);

        Mat<Complex>YNode(2 * n, 2 * n, fill::zeros);
        for (uword i = 0; i < n; ++i)
        {
            for (uword j = 0; j < n; ++j)
            {
                YNode(i, j) = YLine(i, j);
                YNode(i, j + n) = -YLine(i, j);
                YNode(i + n, j) = -YLine(i, j);
                YNode(i + n, j + n) = YLine(i, j);
            }
        }

        return YNode;
    }

    double bundleGmr(unsigned int n, double gmr1, double d)
    {
        double result;
        if (n == 1)
        {
            return gmr1;
        }
        else
        {
            double rConc = d / (2 * std::sin(pi / n));
            result = std::pow(gmr1 * n * std::pow(rConc, n - 1), 1.0 / n);
        }
        return result;
    }

    namespace
    {
        const Complex alpha{-0.5, 0.866025403784439};
        const Complex alpha2{-0.5, -0.866025403784439};
        const double oneThird = 1.0 / 3.0;
        const double sqrt3Inv = 1.0 / std::sqrt(3.0);

        const Mat<Complex>::fixed<3, 3> A{{1, 1, 1}, {1, alpha2, alpha}, {1, alpha, alpha2}};
        const Mat<Complex>::fixed<3, 3> AInv(oneThird * 
                Mat<Complex>::fixed<3, 3>{{1, alpha, alpha2}, {1, alpha2, alpha}});

        const Mat<Complex>::fixed<3, 3> B(sqrt3Inv *
                Mat<Complex>::fixed<3, 3>{{1, 1, 1}, {1, alpha2, alpha}, {1, alpha, alpha2}});
        const Mat<Complex>::fixed<3, 3> BInv(sqrt3Inv *
                Mat<Complex>::fixed<3, 3>{{1, 1, 1}, {1, alpha, alpha2}, {1, alpha2, alpha}});
    }

    Col<Complex> toSequence(const Col<Complex>& v)
    {
        return AInv * v;
    }

    Mat<Complex> toSequence(const Mat<Complex>& M)
    {
        return AInv * M * A;
    }

    Col<Complex> fromSequence(const Col<Complex>& v)
    {
        return A * v;
    }

    Mat<Complex> fromSequence(const Mat<Complex>& M)
    {
        return A * M * AInv;
    }
 
    Col<Complex> toScaledSequence(const Col<Complex>& v)
    {
        return BInv * v;
    }

    Mat<Complex> toScaledSequence(const Mat<Complex>& M)
    {
        return BInv * M * B;
    }

    Col<Complex> fromScaledSequence(const Col<Complex>& v)
    {
        return B * v;
    }

    Mat<Complex> fromScaledSequence(const Mat<Complex>& M)
    {
        return B * M * BInv;
    }
      
    Mat<Complex> approxPhaseImpedanceMatrix(Complex ZPlus, Complex Z0)
    {
        return oneThird * Mat<Complex>{{2 * ZPlus + Z0, Z0 - ZPlus,    Z0 - ZPlus}, 
                                       {Z0 - ZPlus,     2 *ZPlus + Z0, Z0 - ZPlus},
                                       {Z0 - ZPlus,     Z0 - ZPlus,    2 *ZPlus + Z0}};
    }
}
