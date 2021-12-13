library brave.globals;

import 'dart:core';
import 'dart:io';

import 'package:brave/backend/api_requests/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';
import 'package:restart_app/restart_app.dart';

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

void restartApp(BuildContext context) {
  if (Platform.isAndroid) {
    Restart.restartApp();
  } else {
    Phoenix.rebirth(context);
  }
}
