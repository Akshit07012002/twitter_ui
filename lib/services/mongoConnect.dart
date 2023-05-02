import 'dart:developer';
import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:random_password_generator/random_password_generator.dart';

import 'package:twitter_ui/services/constants.dart';

class MongoDatabase {
  // String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
  // String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';
  static var postCollection, userCollection;
  

  static connect() async {
    var db = await  Db.create(MONGO_CONN_URL);
    await db.open();
    postCollection = db.collection(POST_COLLECTION);
    userCollection = db.collection(USER_COLLECTION);
    inspect(db); 
    print('Connected to database');
    // await db.close();
  }


  static signup(String fname, String lname, String username, String password, String confirmPassword) async {
    try {
      // var userId = RandomPasswordGenerator();
      var newUserID = ObjectId();
      // var newUserID = userId.randomPassword(letters: true, numbers: true);
      print(newUserID);
      print(fname);
      print(lname);
      print(username);
      print(password);
      print(confirmPassword);
      if(password != confirmPassword) {
        print('Passwords do not match');
        return;
      }
      var result = await userCollection.insertOne({
        'userID': newUserID, 
        'fname': fname,
        'lname': lname,
        'username': username,
        'password': password,
      });
      if(result.isSuccess) {
        print('User added');
      } else {
        print('Some error uploading');
      }
    } catch (e) {
      print(e);
      print('Some error');
    }
  }


  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final posts = await postCollection.find().toList();
      return posts;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}
