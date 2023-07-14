// EXTENSION ON STRING
import 'package:advanced_flutter_course/app/constants.dart';

extension NonNullString on String? {
  String? isStringEmpty() {
    if(this == null) {
      return Constant.emptyString;
    }
    else {
      return this;
    }
  }
}

// EXTENSION ON INT
extension NonNullInteger on int? {
  int? isIntegerEmpty() {
    if(this == null) {
      return Constant.zeroInteger;
    }
    else {
      return this;
    }
  }
}
