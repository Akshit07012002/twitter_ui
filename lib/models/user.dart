import 'package:mongo_dart/mongo_dart.dart';

class Users {
  ObjectId? userID;
  String? fname;
  String? lname;
  String? username;
  String? password;

  Users({this.userID, this.fname, this.lname, this.username, this.password});

  Users.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['fname'] = fname;
    data['lname'] = lname;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}