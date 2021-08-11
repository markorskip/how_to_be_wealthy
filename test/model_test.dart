import 'package:test/test.dart';
import 'package:first_flutter_app/model/model.dart';

void main() {
  group('Model', () {

    const double salary = 100;
    const double investmentROI = .1;
    const int annualRaisePercentage = 3;

    WealthCalculator getTestWealthCalculator(int years) {
      return new WealthCalculator(salary, investmentROI, years, annualRaisePercentage);
    }

    test('Savings should be 10 percent after one year', () {
      expect(getTestWealthCalculator(1).calculateSavingsTotals(), 10.00);
    });

    test('Savings should be more then 30 percent after three year with 3 percent raise', () {
      int numberOfYears = 3;
      expect(getTestWealthCalculator(numberOfYears).calculateSavingsTotals(), 30.909000000000002);
    });

    test('Investments should be 10 percent * investment rate after one year', () {
       expect(getTestWealthCalculator(1).calculateInvestmentTotals(), 11.00);
    });

    test('Investments after two year at 10 percent with 3 percent raise', () {
      int numberOfYears = 2;
      expect(getTestWealthCalculator(numberOfYears).calculateInvestmentTotals(), 23.43);
    });

    test('Investments after 10 year at 10 percent with 3 percent raise', () {
      int numberOfYears = 10;
      expect(getTestWealthCalculator(numberOfYears).calculateInvestmentTotals(), 196.40124126163798);
    });


    test('Charity should be 10 percent after one year', () {
      expect(getTestWealthCalculator(1).calculateCharityTotals(), 10.00);
    });

    test('Charity should be more then 30 percent after 3 year with 3 percent raise', () {
      expect(getTestWealthCalculator(3).calculateCharityTotals(), 30.909000000000002);
    });

    test('Living Expenses after ten years', () {
      WealthCalculator wealthCalculator = getTestWealthCalculator(10);
      expect(wealthCalculator.calculateLivingTotals(), 700.00);
    });

    test('Salary after one year with 3 percent raise', () {
      expect(getTestWealthCalculator(1).calculateSalaryForYear(1), 103);
    });

    test('Salary after two years with 3 percent raise', () {
      expect(getTestWealthCalculator(1).calculateSalaryForYear(2), 106.09);
    });

    test('Salary after 0 years with 3 percent raise', () {
      expect(getTestWealthCalculator(1).calculateSalaryForYear(0), 100);
    });

  });
}
