import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:bucks_app/model/login_model.dart';
import 'package:bucks_app/utilities/const.dart';

class LoginApi {
  final Dio client;

  LoginApi({required this.client});

  Future<LoginModel> login({Map<String, dynamic>? data}) async {
    Response response;
    try {
      response = await client.post(
        loginUrl,
        data: data,
      );
      log('user: ${response.data.toString()}');
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      return LoginModel(
        status: false,
        message: e.response!.data['errors']['email'] != null
            ? e.response!.data['errors']['email'][0]
            : '',
      );
      // log('error code: ${e.response.statusCode}');
      // log('error is: ${e.response.data}');
      // return null;
    }
  }
}
