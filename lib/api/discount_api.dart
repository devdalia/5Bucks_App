
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:bucks_app/model/category_products_model.dart';
import 'package:bucks_app/utilities/const.dart';

class DiscountCodeApi {
   final Dio client;

  DiscountCodeApi({required this.client});

  Future<CategoryProductModel> discountCodeApi() async {

    client.options.queryParameters ={
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
      "on_sale":"true"
    };
   // print("queryParameters=>"+ client.options.queryParameters.toString());
    Response response;

    try {

      response = await client.get(showProductsUrl);
     // log('disssssss: ${response.data}');
      return CategoryProductModel.fromJson(response.data);

    } on DioError catch (e) {
      log('error code: ${e.response!.statusCode}');
      log('error is: ${e.response!.data}');
      return e.error;
    }
  }
}
