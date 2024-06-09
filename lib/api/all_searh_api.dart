

import 'package:dio/dio.dart';
import 'package:bucks_app/model/all_search_model.dart';
import 'package:bucks_app/utilities/const.dart';

class SearchForAllApi{

  final Dio client;

  SearchForAllApi({required this.client});

  Future<AllSearchModel> getProductsSearch({String? filter}) async {
if (filter !=null){
  client.options.queryParameters ={
    'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
    'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    "search": "${filter}"
  };
}

  //  print("queryParameters=>"+ client.options.queryParameters.toString());

    Response response;
    try {
      response = await client.get(searchProducts);

      AllSearchModel model =
      AllSearchModel.fromJson(response.data);
    //  log('responseList' + response.data.toString());
      return model;
    } on DioError catch (e) {
      print('e: $e');
      return e.error;
    }
  }
}