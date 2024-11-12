import 'package:flutter/material.dart';

import 'main_layers/app_layer/app_layer.dart';
import 'main_layers/data_layer/dio_network.dart';

void main() {
  DioNetwork.defineDio();
  runApp(const MyApp());
}


