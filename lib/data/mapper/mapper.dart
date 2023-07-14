// TO CONVERT THE API RESPONSE TO NUN-NULLABLE OBJECT (MODEL)
import 'package:advanced_flutter_course/app/constants.dart';
import 'package:advanced_flutter_course/app/extensions.dart';
import 'package:advanced_flutter_course/data/responses/responses.dart';
import '../../domain/model/model.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.isStringEmpty() ?? Constant.emptyString,
      this?.name.isStringEmpty() ?? Constant.emptyString,
      this?.noOfNotifications.isIntegerEmpty() ?? Constant.zeroInteger
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
      this?.phone.isStringEmpty() ?? Constant.emptyString,
      this?.link.isStringEmpty() ?? Constant.emptyString,
      this?.email.isStringEmpty() ?? Constant.emptyString
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contact.toDomain());
  }
}
