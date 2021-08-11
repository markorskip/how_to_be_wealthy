import 'package:test/test.dart';
import 'package:first_flutter_app/model/model.dart';

void main() {
  group('Model', () {

    test('Savings should be 10 percent after one year', () {
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, 1);
      expect(wealthCalculator.getSavingsTotals(), '\$10.00');
    });

    test('Savings should be 30 percent after three year', () {
      int numberOfYears = 3;
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, numberOfYears);
      expect(wealthCalculator.getSavingsTotals(), '\$30.00');
    });

    test('Investments should be 10 percent * investment rate after one year', () {
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, 1);
      expect(wealthCalculator.getInvestmentTotals(), '\$11.00');
    });

    test('Investments after two year', () {
      int numberOfYears = 2;
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, numberOfYears);
      expect(wealthCalculator.getInvestmentTotals(), '\$23.10');
    });


    test('Charity should be 10 percent after one year', () {
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, 1);
      expect(wealthCalculator.getCharityTotals(), '\$10.00');
    });

    test('Charity should be 30 percent after 3 year', () {
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, 3);
      expect(wealthCalculator.getCharityTotals(), '\$30.00');
    });

    test('Living Expenses after ten years', () {
      int numberOfYears = 10;
      WealthCalculator wealthCalculator = new WealthCalculator(100, .1, numberOfYears);
      expect(wealthCalculator.getLivingTotals(), '\$700.00');
    });

  });
}
