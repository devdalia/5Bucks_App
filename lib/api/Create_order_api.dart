


import 'dart:developer';

import 'package:bucks_app/model/create_order_model.dart';
import 'package:dio/dio.dart';
import 'package:bucks_app/utilities/const.dart';
class CreateOrderApi {
  final Dio client;

  CreateOrderApi({required this.client});

  Future<CreateOrderModel> creataOrderApi({Map<String,dynamic>? data}) async {

    print("dataa:$data");
    client.options.queryParameters ={
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    };
  //  print("queryParametersgetget3532=>"+ client.options.queryParameters.toString());
    try {
      var res = await client.post(order, data: data);
    //  log('res create order=>${res.data}');
      CreateOrderModel creataModel = CreateOrderModel.fromJson(res.data);
      log('Review => ${creataModel}');
      return creataModel;
    } on DioError catch (e) {
      print("statuscode order:${e.response!.statusCode}");
      print("data order:${e.response!.data}");
      return e.error;
    }
  }
}
