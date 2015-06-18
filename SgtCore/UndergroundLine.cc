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

#include "UndergroundLine.h"

#include "PowerFlow.h"

namespace Sgt
{
    UndergroundLine::UndergroundLine(
        const std::string& id, double L, bool hasNeutral, const arma::Mat<double>& phaseDist,
        double gmrPhase, double resPerLPhase, double freq, double rhoEarth) :
        BranchAbc(id, Phase::A|Phase::B|Phase::C, Phase::A|Phase::B|Phase::C),
        L_(L),
        hasNeutral_(hasNeutral),
        phaseDist_(phaseDist),
        gmrPhase_(gmrPhase),
        resPerLPhase_(resPerLPhase),
        freq_(freq),
        rhoEarth_(rhoEarth)
    {
        arma::uword nPhase = hasNeutral ? 4 : 3; // Not including shielding layers.
        sgtAssert(phaseDist.n_rows == nPhase && phaseDist.n_cols == nPhase,
                "UndergroundLine : distance matrix must be size " << std::to_string(nPhase)
                << " x " << std::to_string(nPhase) << ".");
    }

    UndergroundLineStrandedShield::UndergroundLineStrandedShield(
            const std::string& id, double L, bool hasNeutral, const arma::Mat<double>& phaseDist,
            double gmrPhase, double resPerLPhase, double freq, double rhoEarth,
            double gmrConcStrand, double resPerLConcStrand, int nConcStrands, double rConc) :
        UndergroundLine(id, L, hasNeutral, phaseDist, gmrPhase, resPerLPhase, freq, rhoEarth),
        gmrConcStrand_(gmrConcStrand),
        resPerLConcStrand_(resPerLConcStrand),
        nConcStrands_(nConcStrands),
        rConc_(rConc)
    {
        // Empty.
    }

    void UndergroundLineStrandedShield::validate()
    {
        auto nPhase = phases0().size();
        unsigned int nCond = hasNeutral_ ? 7 : 6;

        // Calculate the distance / GMR matrix Dij.
        arma::Mat<double> Dij(nCond, nCond, arma::fill::zeros);
        double nConcStrInv = 1.0 / nConcStrands_;
        double gmrConc = std::pow(gmrConcStrand_ * nConcStrands_ * std::pow(rConc_, nConcStrands_ - 1), nConcStrInv);
        for (arma::uword i = 0; i < 3; ++i)
        {
            Dij(i, i) = gmrPhase_; // phase_i - phase_i
            Dij(i + 3, i + 3) = gmrConc; // conc_i - conc_i
            Dij(i, i + 3) = Dij(i + 3, i) = rConc_; // phase_i - conc_i
            if (hasNeutral_)
            {
                Dij(7, i) = Dij(i, 7) = phaseDist_(4, i); // phase_i - neutral
                Dij(7, i + 3) = Dij(i + 3, 7) =
                    pow(pow(Dij(4, i), nConcStrands_) - pow(rConc_, nConcStrands_), nConcStrInv); // conc_i - neutral
            }
            for (arma::uword j = 0; j < i; ++j)
            {
                Dij(i, j) = Dij(j, i) = phaseDist_(i, j); // phase_i - phase_j
                Dij(i + 3, j + 3) = Dij(j + 3, i + 3) = phaseDist_(i, j); // conc_i - conc_j
                Dij(i, j + 3) = Dij(j, i + 3) = Dij(i + 3, j) = Dij(j + 3, i) =
                    pow(pow(Dij(i, j), nConcStrands_) - pow(rConc_, nConcStrands_), nConcStrInv); // phase_i - conc_j
            }
        }
        if (hasNeutral_)
        {
            Dij(7, 7) = gmrPhase_; // neutral - neutral
        }

        // Calculate the resistance per unit length.
        arma::Col<double> resPerL(nCond);
        double resPerLConc = resPerLConcStrand_ / nConcStrands_;
        for (arma::uword i = 0; i < 3; ++i)
        {
            resPerL(i) = resPerLPhase_;
            resPerL(i + 3) = resPerLConc;
        }
        if (hasNeutral_)
        {
            resPerL(7) = resPerLPhase_;
        }

        // Calculate the primative impedance matrix, using Carson's equations.
        ZPrim_ = carson(nCond, Dij, resPerL, L_, freq_, rhoEarth_);

        // Calculate the external Z matrix (i.e. after Kron).
        ZPhase_ = kron(ZPrim_, nPhase);

        // And the nodal admittance matrix
        YNode_ = ZLine2YNode(ZPhase_);
    }
}
