import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:bucks_app/model/categories_model.dart';

class CategoriesApi {

  Dio client = Dio(
    BaseOptions(
        baseUrl: 'https://5bucks.com/wp-json/wc/v3',
        contentType: 'application/json',
        queryParameters: {
          'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
          'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
          //  "per_page":"100"
        },
        headers: {
          "Accept": "*/*",
          "Authorization":
          "Basic Y2tfMjMxMjliNzQ1YTEwYzhhNDZhNzVjMTg2NTk2MTA0MzUxNTY2Y2I3ODpjc19kNjI0NDg4YTg1NWYxYTg5MWJlYTA4ZTliOWQ5NjNhODljYzUxZGZl",
          "Cookie":"wp-wpml_current_admin_language_d41d8cd98f00b204e9800998ecf8427e=ar; __cfduid=dd43fd44b574a5c1285320853a6bd0ca01619687479"
        }),
  );

  Future<ReceiveProductDetailsModel> categoriesApi() async {
    Response response;
    try {
      response = await client.get('/products/categories');
      print(response.data);
      //  log('category: ${response.data}');
      return ReceiveProductDetailsModel.fromJson(response.data);
    } on DioError catch (e) {
      log('error code: ${e.response!.statusCode}');
      //   log('error is: ${e.response.data}');
      return e.error;
    }
  }
}
