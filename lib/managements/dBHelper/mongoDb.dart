import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:wave_chat/managements/dBHelper/constant.dart';
import 'package:wave_chat/managements/entity/user.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    print("Mongo Db connected");
  }

  static Future<String> insert(UserLoginResponseEntity data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "data inserted";
      } else {
        return "Something went wrong while inserting";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
