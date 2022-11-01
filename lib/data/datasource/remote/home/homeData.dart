import 'package:willcome_getx/core/class/crud.dart';
import 'package:willcome_getx/links.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  homeData(String id) async {
    var response = await crud.postData(ApiLinks.home, {
      'userId':id
    });
    return response.fold((l) => l, (r) => r);
  }
}
