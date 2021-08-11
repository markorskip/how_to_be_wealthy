import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0", "en_US");

/*
TODO add annual raise, add savings interest rate, add compounding daily
 */
class WealthCalculator {

  double salary;
  double investmentReturn;
  int numberOfYears;

  WealthCalculator(this.salary, this.investmentReturn, this.numberOfYears);

  String getSavingsTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += (salary * .1);
    }
    return "\$" + oCcy.format(result).toString();
  }

  String getInvestmentTotals() {
    double result = 0;
    double compound = 0;
    for (var i = 0; i< numberOfYears; i++) {
      var thisYearsInvestmentGain = (salary * .10) * getInvestmentRate();
      var thisYearInvestmentPrinciple = (salary * .10);
      result += compound + thisYearsInvestmentGain + thisYearInvestmentPrinciple;
      compound = result * getInvestmentRate();
    }
    return "\$" + oCcy.format(result).toString();
  }

  String getCharityTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += salary * .1;
    }
    return "\$" + oCcy.format(result).toString();
  }

  double getInvestmentRate() {
    if (this.investmentReturn > 1) return this.investmentReturn/ 100;
    return this.investmentReturn;
  }

  getLivingTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += salary * .7;
    }
    return "\$" + oCcy.format(result).toString();
  }
}
