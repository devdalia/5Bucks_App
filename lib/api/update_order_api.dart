import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:bucks_app/model/update_order_model.dart';
import 'package:bucks_app/utilities/const.dart';

class UpdateOrderApi {

  final Dio client;
  UpdateOrderApi({required this.client});

  Future<UpdateOrderModel> updateOrderApi({Map? data}) async {
    Response response;
    try {
        response=  await client.post(
          updateorder,
          data:data
        );

  //    log('update order: ${response.data}');
      return UpdateOrderModel.fromJson(response.data);
    } on DioError catch (e) {
      log('error code update order: ${e.response!.statusCode}');
      log('error is updateorder: ${e.response!.data}');

      return e.error;
    }
  }
}
