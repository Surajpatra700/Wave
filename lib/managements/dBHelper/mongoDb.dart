import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:wave_chat/managements/dBHelper/constant.dart';
import 'package:wave_chat/managements/entity/user.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    await dotenv.load(fileName: ".env");
    db = await Db.create(dotenv.env['MONGO_CONN_URL']!);
    await db.open();
    inspect(db);
    userCollection = db.collection(dotenv.env['USER_COLLECTION']);
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

  static Future<List<Map<String, dynamic>>> getData() async {
    //final data = UserLoginResponseEntity(accessToken: accessToken, displayName: displayName, email: email, photoUrl: photoUrl)
    final arrData = await userCollection.find(where.excludeFields([])).toList();

    return arrData;
  }
}
