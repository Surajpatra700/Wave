import 'package:get/get.dart';
import 'package:wave_chat/managements/entity/user.dart';

class ContactState {
  var count = 0.obs;
  RxList<UserLoginResponseEntity> contactList = <UserLoginResponseEntity>[].obs;
}