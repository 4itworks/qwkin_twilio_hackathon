import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> checkInUseCase() async {
  final response = await Dio().get('https://viacep.com.br/ws/01001000/json/');
  //return Cep();
}
