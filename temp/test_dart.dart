import 'package:flutter/foundation.dart';

// <<<<====================== DATE FORMATTER ================>>>>>>
// void main() {
//   // 1988-10-12T00:00:00
//   print("sjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjd");
//   DateTime date = DateTime.parse("1988-10-12T00:00:00");
//   print("date time ${AppFormatter.formatDate(date)}");
// }



// <<<<====================== USING RECURSION FUNCTION ================>>>>>>
// void main() {
//   int n = 5;
//   print("Fact of 10 is :- ${getFact(n)}");
// }
//
// int getFact(int number) {
//   print("count is $number");
//   return number == 0 ? 1 : number * getFact(number - 1);
// }


// <<<<====================== USING FOR LOOP FUNCTION ================>>>>>>

void main() {
  int number = 5;
  int fact = 1;


  // for (int i = number; i >= 0; i--) {
  //   print("n is $number");
  //   if (i == 0) return;
  //   fact *= i;
  // }

  int result = 1;
  for (int i = 1; i <= number; i++) {
    result *= i;
  }

  if (kDebugMode) {
    print(result);
  }

  // for (int i = number; i >= 1; i--) {
  //   print(i);
  //   fact *= i;
  // }
  // print("fact is $fact");
}
