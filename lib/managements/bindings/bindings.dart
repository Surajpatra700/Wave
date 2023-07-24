import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wave_chat/managements/storage/storage.dart';
import 'package:wave_chat/managements/storage/users.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}