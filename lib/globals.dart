library brave.globals;

import 'dart:core';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';



final box = GetStorage();

var name = box.read("name");
var userToken = box.read("token");
var role = box.read("role");
var department = box.read("department");
var userId = box.read("userId");
var isAuthenticated = box.read("isAuthenticated");

String summary =
    "Here's  Your Information: name:$name, token: $userToken, UserID: $userId, Your Role: $role, and Department:$department";

getFormatedDate(_date) {
  var inputDate = DateTime.parse(_date);
  var outputFormat = DateFormat('dd/MM/yyyy H:mm:ss');
  return outputFormat.format(inputDate);
}