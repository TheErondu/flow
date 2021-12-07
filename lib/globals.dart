library brave.globals;

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
var name = box.read("name");
