library brave.globals;

import 'dart:core';

import 'package:brave/backend/api_requests/api_calls.dart';
import 'package:intl/intl.dart';




var name = box.read("name");
var role = box.read("role");
var department = box.read("department");
var userId = box.read("userId");
var isAuthenticated = box.read("isAuthenticated");



getFormatedDate(_date) {
  var inputDate = DateTime.parse(_date);
  var outputFormat = DateFormat('dd/MM/yyyy H:mm:ss');
  return outputFormat.format(inputDate);
}