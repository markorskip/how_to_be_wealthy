import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0", "en_US");

/*
TODO add annual raise, add savings interest rate, add compounding daily
 */
class WealthCalculator {

  double salary;
  double investmentReturn;
  int numberOfYears;
  int annualRaise;
  double _annualRaiseMultiplier = 1.0;

  static const double PERCENT_OF_INCOME_SAVED = .1;
  static const double PERCENT_OF_INCOME_INVESTED = .1;
  static const double PERCENT_OF_INCOME_GIVEN_TO_CHARITY = .1;

  WealthCalculator(this.salary, this.investmentReturn, this.numberOfYears, this.annualRaise) {
    this._annualRaiseMultiplier = 1 + (annualRaise / 100);
  }

  double calculateSavingsTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += calculateSalaryForYear(i) * PERCENT_OF_INCOME_SAVED;
    }
    return result;
  }

  calculateSalaryForYear(int year) {
    double result = salary;
    for (var i = 0; i < year; i++) {
      result *= _annualRaiseMultiplier;
    }
    return result;
  }

  double calculateInvestmentTotals() {
    double totalInvestments = 0;
    for (var i = 0; i< numberOfYears; i++) {
      totalInvestments += calculateSalaryForYear(i) * PERCENT_OF_INCOME_INVESTED;
      totalInvestments += totalInvestments * calculateInvestmentRate();
    }
    return totalInvestments;
  }

  double calculateCharityTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += calculateSalaryForYear(i) * .1;
    }
    return result;
  }

  double calculateInvestmentRate() {
    if (this.investmentReturn > 1) return this.investmentReturn/ 100;
    return this.investmentReturn;
  }

  double calculateLivingTotals() {
    double result = 0;
    for (var i = 0; i< numberOfYears; i++) {
      result += salary * .7;
    }
    return result;
  }

  String getInvestments() {
    return formatCurrency(calculateInvestmentTotals());
  }

  String getSavings() {
    return formatCurrency(calculateSavingsTotals());
  }

  String getCharity() {
    return formatCurrency(calculateCharityTotals());
  }

  String getLiving() {
    return formatCurrency(calculateLivingTotals());
  }

  String getAccumulatedWealth() {
    return formatCurrency(calculateInvestmentTotals()+calculateSavingsTotals());
  }

  static String formatCurrency(double result) {
    return "\$" + oCcy.format(result).toString();
  }
}
