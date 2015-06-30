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

#ifndef COMMON_DOT_H
#define COMMON_DOT_H

#include <boost/date_time/posix_time/posix_time.hpp>
#include <boost/date_time/gregorian/gregorian.hpp>
#include <boost/date_time/local_time/local_time.hpp>

#include <armadillo>

#include <complex>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <stdexcept>

namespace Sgt
{
    /// @name Reporting and errors.
    /// @{

    class StreamIndent : public std::streambuf
    {
        public:

            explicit StreamIndent(std::ostream& strm);

            virtual ~StreamIndent();

            void reset(const std::string& ind1, const std::string& ind2);

        protected:

            virtual int overflow(int ch) override;

        private:

            std::ostream* strm_;
            std::streambuf* destBuf_;
            bool isFirst_;
            bool isNewline_;
            std::string ind1_;
            std::string ind2_;
    };

    enum class LogLevel
    {
        NONE,
        NORMAL,
        VERBOSE
    };

    /// @brief Logging object.
    ///
    /// Use e.g. Log().message() << "this is a message" << std::endl;
    /// @ingroup Utilities
    class Log
    {
        friend class LogIndent;

        public:
            
            static LogLevel messageLogLevel;
            static LogLevel warningLogLevel;
            static LogLevel debugLogLevel;
        
        public:

            std::ostream& message(LogLevel level = LogLevel::NORMAL);

            std::ostream& warning(LogLevel level = LogLevel::NORMAL);

            std::ostream& error();
            
            std::ostream& debug(LogLevel level = LogLevel::NONE);

        private:

            static std::ostream& nullStream()
            {
                class NullBuf : public std::streambuf
                {
                    protected:

                        virtual int overflow(int ch) override
                        {
                            return ch;
                        }
                };
                static NullBuf nullBuf_;
                static std::ostream nullStream_(&nullBuf_);
                return nullStream_;
            }
        
        private:

            static unsigned int indentLevel_;

            StreamIndent coutBuf_{std::cout};
            StreamIndent cerrBuf_{std::cerr};
    };

    /// @brief Create a LogIndent on the stack to indent all logs.
    ///
    /// Indentation will persist while object is in scope.
    /// @ingroup Utilities
    class LogIndent
    {
        public:
            LogIndent()
            {
                Log::indentLevel_ += 4;
            }

            ~LogIndent()
            {
                Log::indentLevel_ -= 4;
            }
    };

    /// @ingroup Utilities
#define sgtError(msg) {std::ostringstream ss; ss << "SmartGridToolbox: " << __PRETTY_FUNCTION__ << ": " << msg; throw std::runtime_error(ss.str());}

    /// @ingroup Utilities
#define sgtAssert(cond, msg) if (!(cond)) sgtError(msg);

    /// @ingroup Utilities
#ifdef DEBUG
#define SGT_DEBUG(x) x
#else
#define SGT_DEBUG(x)
#endif

    /// @}

    /// @name String conversion.
    /// @{

    /// @brief Create a value from a string.
    /// @ingroup Utilities
    template<typename T> T from_string(const std::string& s);

    /// @}

    /// @name Constant dimension 1D array type.
    /// @{

    /// @ingroup Utilities
    template <class T, size_t N> using Array = std::array<T, N>; // Just std::array but rename for nice consistency.

    /// @}

    /// @name Constant dimension 2D array type.
    /// @{

    // Note transposition of NR and NC to obey standard matrix index order.
    /// @ingroup Utilities
    template <class T, size_t NR, size_t NC> using Array2D = std::array<std::array<T, NC>, NR>;

    /// @}

    /// @name Complex numbers
    /// @{

    /// @addtogroup Utilities
    /// @{
    
    typedef std::complex<double> Complex;

    inline Complex polar(double m, double theta) // theta is radians.
    {
        // Note the following will use RVO in C++11, no unneeded temporaries.
        return Complex(m * cos(theta), m * sin(theta));
    }

    inline Complex operator*(int i, const Complex& c)
    {
        return Complex(i * c.real(), i * c.imag());
    }

    inline Complex operator*(const Complex& c, int i)
    {
        return Complex(i * c.real(), i * c.imag());
    }

    std::ostream& operator<<(std::ostream& os, const Complex& c);

    template<> Complex from_string<Complex>(const std::string& s);

    std::string to_string(const Complex& c);

    /// @}
    
    /// @}

    /// @name Linear algebra
    /// @{

    /// @ingroup Utilities
    template<typename T> std::ostream& operator<<(std::ostream& os, const arma::Col<T>& v)
    {
        auto w = static_cast<int>(os.width());
        std::ostringstream ss;
        ss.flags(os.flags());
        ss.imbue(os.getloc());
        ss.precision(os.precision());
        ss << "[";
        if (v.size() > 0)
        {
            ss << std::setw(w) << std::left << v(0);
            for (arma::uword i = 1; i < v.size(); ++i) ss << ", " << std::setw(w) << std::left << v(i);
        }
        ss << "]";
        return os << ss.str();
    }
    extern template std::ostream& operator<< <double>(std::ostream& os, const arma::Col<double>& v);
    extern template std::ostream& operator<< <float>(std::ostream& os, const arma::Col<float>& v);
    extern template std::ostream& operator<< <int>(std::ostream& os, const arma::Col<int>& v);
    extern template std::ostream& operator<< <Complex>(std::ostream& os, const arma::Col<Complex>& v);

    /// @ingroup Utilities
    template<typename T> std::ostream& operator<<(std::ostream& os, const arma::Mat<T>& m)
    {
        auto w = static_cast<int>(os.width());
        std::ostringstream ss;
        ss.flags(os.flags());
        ss.imbue(os.getloc());
        ss.precision(os.precision());
        ss << std::endl << "[" << std::endl;
        ss << "    [" << std::setw(w) << std::left << m(0, 0);
        for (arma::uword j = 1; j < m.n_cols; ++j)
        {
            ss << ", " << std::setw(w) << std::left << m(0, j);
        }
        ss << "]";
        for (arma::uword i = 1; i < m.n_rows; ++i)
        {
            ss << "," << std::endl << "    [" << std::setw(w) << std::left << m(i, 0);
            for (arma::uword j = 1; j < m.n_cols; ++j)
            {
                ss << ", " << std::setw(w) << std::left << m(i, j);
            }
            ss << "]";
        }
        ss << std::endl << "]" << std::endl;
        return os << ss.str();
    }
    extern template std::ostream& operator<< <double>(std::ostream& os, const arma::Mat<double>& v);
    extern template std::ostream& operator<< <float>(std::ostream& os, const arma::Mat<float>& v);
    extern template std::ostream& operator<< <int>(std::ostream& os, const arma::Mat<int>& v);
    extern template std::ostream& operator<< <Complex>(std::ostream& os, const arma::Mat<Complex>& v);

    /// @}

    /// @name Time
    /// @{

    namespace posix_time = boost::posix_time;
    namespace gregorian = boost::gregorian;
    namespace local_time = boost::local_time;

    using Time = posix_time::time_duration;

    extern const posix_time::ptime epoch;

    /// @ingroup Utilities
    inline double dSeconds(const Time& d)
    {
        return double(d.ticks()) / Time::ticks_per_second();
    }
    
    /// @ingroup Utilities
    Time timeFromDSeconds(double dSeconds);

    /// @ingroup Utilities
    inline Time timeFromUtcTime(posix_time::ptime utcTime)
    {
        return (utcTime - epoch);
    }

    /// @ingroup Utilities
    inline posix_time::ptime utcTime(Time t)
    {
        return (epoch + t);
    }

    /// @ingroup Utilities
    posix_time::ptime utcTimeFromLocalTime(posix_time::ptime localTime, const local_time::time_zone_ptr localTz);

    /// @ingroup Utilities
    inline posix_time::ptime localTime(const Time& t, const local_time::time_zone_ptr localTz)
    {
        return boost::local_time::local_date_time(epoch + t, localTz).local_time();
    }

    /// @ingroup Utilities
    inline Time timeFromLocalTime(posix_time::ptime localTime, const local_time::time_zone_ptr localTz)
    {
        return (utcTimeFromLocalTime(localTime, localTz) - epoch);
    }

    /// @}

    /// @name LatLongs
    /// @{

    /// @ingroup Utilities
    /// @brief Simple struct storing a latitude and longitude.
    class LatLong
    {
        public:
            double lat_;
            double long_;
    };

    /// @}

    /// @addtogroup Utilities
    /// @{

    /// @name Constants
    /// @{

    extern const double pi;
    extern const double negInfinity;
    extern const double infinity;
    extern const double second;
    extern const double minute;
    extern const double hour;
    extern const double day;
    extern const double week;
    extern const double joule;
    extern const double kjoule;
    extern const double watt;
    extern const double kwatt;
    extern const double kwattHour;
    extern const double amp;
    extern const double coulomb;
    extern const double kelvin;
    extern const LatLong greenwich;

    /// @}

    /// @}

    /// @addtogroup Utilities
    /// @{

    /// @name Basic vector algebra in n dimensions.
    /// @{

    template<typename T, std::size_t d> double dot(const Array<T, d>& v1, const Array<T, d>& v2)
    {
        T result(0.0);
        for (std::size_t i = 0; i < d; ++i) result += v1[i] * v2[i];
        return result;
    }

    template<typename T, std::size_t d, typename S> Array<T, d> operator*(const Array<T, d>& v, const S& s)
    {
        Array<T, d> result = v;
        for (std::size_t i = 0; i < d; ++i) result[i] *= s;
        return result;
    }

    template<typename T, std::size_t d, typename S> Array<T, d> operator*(const S& s, const Array<T, d>& v)
    {
        return operator*(v, s);
    }

    template<typename T, std::size_t d> Array<T, d> operator+(const Array<T, d>& lhs, const Array<T, d>& rhs)
    {
        Array<T, d> result = lhs;
        for (std::size_t i = 0; i < d; ++i) result[i] += rhs[i];
        return result;
    }

    template<typename T, std::size_t d> Array<T, d> operator-(const Array<T, d>& lhs, const Array<T, d>& rhs)
    {
        Array<T, d> result = lhs;
        for (std::size_t i = 0; i < d; ++i) result[i] -= rhs[i];
        return result;
    }

    /// @}

    /// @}
}

#endif // COMMON_DOT_H
