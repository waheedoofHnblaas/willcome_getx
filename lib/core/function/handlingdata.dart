import 'package:willcome_getx/core/class/statusrequest.dart';

handlingData(res){
  if(res is StatusRequest){
    return res;
  }else{
    return StatusRequest.success;
  }
}