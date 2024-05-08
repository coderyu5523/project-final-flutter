import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// mac : ipconfig getifaddr en0
final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.12:8080", // IPConfig 로 ip 확인하기⁷
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 200 이 아니어도 예외 발생안하게 설정
  ),
);

const secureStorage = FlutterSecureStorage();
