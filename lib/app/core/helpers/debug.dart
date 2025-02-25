// debug print
import 'package:flutter/foundation.dart';

void customDebugPrint(String message) {
  if (kDebugMode) {
    print(
        "==================================================================================================");
    print("DEBUG MODE ON");
    print(message);
    print(
        "==================================================================================================");
  }
}
