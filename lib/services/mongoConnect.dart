import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';

void mongoConnect() async {
  var db = Db('mongodb://$host:$port/twitter_clone');
  await db.open();
  print('Connected to database');
  await db.close();
}