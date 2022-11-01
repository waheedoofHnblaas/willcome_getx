
import 'package:willcome_getx/core/class/crud.dart';
import 'package:willcome_getx/links.dart';
class VerifiySignUpData {
  Crud crud;

  VerifiySignUpData(this.crud);

  verifiySignUpData({
    required String verifiyCode,
    required String email,
  }) async {
    var response = await crud.postData(ApiLinks.verfiyCodeSignUp, {
      'email': email,
      'verifycode': verifiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
