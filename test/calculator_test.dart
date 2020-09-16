import 'package:flutter_test/flutter_test.dart';
import 'package:weird_calculator/calculator.dart';

void main() {
  test("Calculator, Modulo", () {
    test_modulo([78, 9, 35, 10, 7],
    [50, 3, 6, 7, 4],
    [28, 0, 5, 3, 3]);
  });

  test("Calculator, Digital Root", () {
    test_digitalRoot([8, 92, 376, 441, 16],
        [8, 2, 7, 9, 7]);
  });

  test("Calculator, Lunar Addition", () {
    test_lunarAddition([87, 942, 3756, 592, 27],
        [586, 85, 3756, 303, 666],
        [587, 985, 3756, 593, 667]);
  });

  test("Calculator, Base Conversion", () {
    test_baseConversions(['1099', 'FF', '101001', '124', '33010', '876'],
        [10, 16, 2, 7, 4, 2],
        [16, 2, 5, 8, 9, 5],
        ['44B', '11111111', '131', '103', '1281', 'invalid input']);
  });

  test("Calculator, Legendre Symbol", () {
    test_legendreSymbol([7.5, -6, 26, 9, -4],
        [3, 2, 5, 3, 7],
        ['-1', 'invalid input', '1', '0', '-1']);
  });
}

void test_modulo(List<int> nums, List<int> mods, List<int> expected) {
  print("Modulo");
  for (var i = 0; i < nums.length; i++) {
    print("${nums[i]} mod ${mods[i]} = ${nums[i]%mods[i]}");
    expect(nums[i]%mods[i], expected[i]);
  }
}

void test_digitalRoot(List<int> nums, List<int> expected) {
  print("Digital Root");
  for (var i = 0; i < nums.length; i++) {
    print("${nums[i]} = ${digitalRoot(nums[i])}");
    expect(digitalRoot(nums[i]), expected[i]);
  }
}

void test_lunarAddition(List<int> fstNums, List<int> sndNums, List<int> expected) {
  print("Lunar Addition");
  for (var i = 0; i < fstNums.length; i++) {
    print("${fstNums[i]} + ${sndNums[i]} = ${lunarAddition(fstNums[i], sndNums[i])}");
    expect(lunarAddition(fstNums[i], sndNums[i]), expected[i]);
  }
}

void test_baseConversions(List<dynamic> nums, List<int> fromBases, List<int> toBases, List<String> expected) {
  print("Modulo");
  for (var i = 0; i < nums.length; i++) {
    print("${nums[i]} from Base ${fromBases[i]} to Base ${toBases[i]} = ${baseConversion(nums[i], fromBases[i], toBases[i])}");
    expect(baseConversion(nums[i], fromBases[i], toBases[i]), expected[i]);
  }
}
void test_legendreSymbol(List<double> numerators, List<int> denominators, List<String> expected) {
  print("Legendre Symbol");
  for (var i = 0; i < numerators.length; i++) {
    print("${numerators[i]} / ${denominators[i]} = ${legendreSymbol(numerators[i], denominators[i])}");
    expect(legendreSymbol(numerators[i], denominators[i]), expected[i]);
  }
}