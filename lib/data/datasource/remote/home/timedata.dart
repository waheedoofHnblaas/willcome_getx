import 'package:willcome_getx/core/class/crud.dart';
import 'package:willcome_getx/links.dart';

class TimeData {
  Crud crud;

  TimeData(this.crud);

  timeData(String timeId) async {
    var response = await crud.postData(ApiLinks.getTimeUsers, {
      'timeId':timeId
    });
    return response.fold((l) => l, (r) => r);
  }
}