

import 'package:willcome_getx/core/class/crud.dart';
import 'package:willcome_getx/links.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  signUpUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    var response = await crud.postData(ApiLinks.register, {
      'username': username,
      'password': password,
      'phone': phone,
      'email': email
    });
    return response.fold((l) => l, (r) => r);
  }
}
