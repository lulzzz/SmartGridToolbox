#include <Common.h>
#include <sstream>
#include <boost/spirit/include/qi.hpp>
#include <boost/spirit/include/phoenix_operator.hpp>
#include <boost/spirit/include/phoenix_function.hpp>
#include <boost/spirit/include/phoenix_statement.hpp>
#include <boost/spirit/include/phoenix_bind.hpp>
#include <boost/spirit/include/phoenix.hpp>

namespace Qi = boost::spirit::qi;
namespace Ascii = boost::spirit::ascii;
namespace Phoenix = boost::phoenix;

namespace SmartGridToolbox
{
   struct CGram : Qi::grammar<std::string::const_iterator, Complex(), Ascii::space_type>
   {
      CGram(): CGram::base_type(start_)
      {
         phaseRad_ = Qi::lit('R') >> Qi::double_[Phoenix::bind(&CGram::setAngRad, this, Qi::_1)];
         phaseDeg_ = Qi::lit('D') >> Qi::double_[Phoenix::bind(&CGram::setAngDeg, this, Qi::_1)];

         bracketedBoth_ = (Qi::lit('(') >> Qi::double_ >> Qi::lit(',') >> Qi::double_ >> Qi::lit(')'))
            [Phoenix::bind(&CGram::setResult, this, Qi::_1, Qi::_2)];
         bracketedIm_ = (Qi::lit('(') >> Qi::lit(',') >> Qi::double_ >> Qi::lit(')'))
            [Phoenix::bind(&CGram::setResult, this, 0.0, Qi::_1)];
         bracketedRe_ = (Qi::lit('(') >> Qi::double_ >> -Qi::lit(',') >> Qi::lit(')'))
            [Phoenix::bind(&CGram::setResult, this, Qi::_1, 0.0)];
         rePlusIm_ = (Qi::double_ >> Qi::lit('+') >> Qi::double_ >> Qi::char_("ij"))
            [Phoenix::bind(&CGram::setResult, this, Qi::_1, Qi::_2)];
         reMinusIm_ = (Qi::double_ >> Qi::lit('-') >> Qi::double_ >> Qi::char_("ij"))
            [Phoenix::bind(&CGram::setResult, this, Qi::_1, -Qi::_2)];
         im_ = (Qi::double_ >> Qi::char_("ij"))
            [Phoenix::bind(&CGram::setResult, this, 0.0, Qi::_2)];
         re_ = (Qi::double_) 
            [Phoenix::bind(&CGram::setResult, this, Qi::_1, 0.0)];

         start_ = Qi::eps[Phoenix::bind(&CGram::init, this)] >>
            ((bracketedBoth_ | bracketedIm_ | bracketedRe_ | rePlusIm_ | reMinusIm_ | im_ | re_) >>
             -(phaseRad_ | phaseDeg_))
            [Qi::_val = Phoenix::construct<Complex>(Phoenix::bind(&CGram::result, this))];
      }

      void init()
      {
         result_ = czero;
      }
      void setResult(double re, double im)
      {
         result_ = {re, im};
      }
      void setAngRad(double ang)
      {
         result_ *= polar(1.0, ang);
      }
      void setAngDeg(double ang)
      {
         result_ *= polar(1.0, ang * pi / 180.0);
      }
      Complex result()
      {
         return result_;
      }

      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> start_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> phaseRad_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> phaseDeg_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> bracketedBoth_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> bracketedIm_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> bracketedRe_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> rePlusIm_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> reMinusIm_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> im_;
      Qi::rule<std::string::const_iterator, Complex(), Ascii::space_type> re_;
      Complex result_;
   };

   std::ostream & operator<<(std::ostream & os, const Complex & c)
   {
      return os << complex2String(c);
      // Doing it this way avoids hassles with stream manipulators, since there is only one insertion operator.
   }

   Complex string2Complex(const std::string & s)
   {
      Complex c;
      std::string::const_iterator iter = s.begin();
      std::string::const_iterator end = s.end();
      bool ok = Qi::phrase_parse(iter, end, CGram(), Ascii::space, c);
      if (!ok)
      {
         error() << "Bad complex number string: " << c << std::endl;
         error() << "Came unstuck at substring: " << *iter << std::endl;
         abort();
      }
      return c;
   }

   std::string complex2String(const Complex & c)
   {
      std::ostringstream ss;
      float re = static_cast<float>(c.real());
      float im = static_cast<float>(c.imag());
      char reSgn = re >= 0.0 ? ' ' : '-';
      char imSgn = im >= 0.0 ? '+' : '-';
      if (im == 0.0)
      {
         ss << reSgn << std::abs(re); 
      }
      else
      {
         ss << reSgn << std::abs(re) << imSgn << std::abs(im) << "j";
      }
      return ss.str();
   }

   const ptime epoch(date(1970,1,1));

   ptime utcTimeFromLocalTime(ptime localTime, const time_zone_ptr localTz)
   {
      using namespace boost::local_time;
      if (localTime.is_not_a_date_time())
      {
         return localTime;
      }
      local_date_time ldt(localTime.date(), localTime.time_of_day(), localTz, local_date_time::NOT_DATE_TIME_ON_ERROR);
      return ldt.utc_time();
   }
}
