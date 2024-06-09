
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:bucks_app/model/category_products_model.dart';
import 'package:bucks_app/utilities/const.dart';


class CategoryProductApi {
  final Dio client;
  CategoryProductApi({required this.client});
  Future<CategoryProductModel> realEstateByIdApi(int id) async {

    client.options.queryParameters ={
      "category":"$id",
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    };
   print("queryParameters details=>"+ client.options.queryParameters.toString());
    Response response;
    try {
      response = await client.get('$showProductsUrl');
    // log('RealEstateApi12 => ${response.data}');
      CategoryProductModel model =CategoryProductModel.fromJson(response.data);
     // log('details pro: ${model.productsDetails}');
      print(model.productsDetails);

      return model;
    } on DioError catch (e) {
      log('error code: ${e.response!.statusCode}');
      log('error is: ${e.response!.data}');
      return e.error;
    }
  }
}

class DetailsProductApi {
  final Dio client;
  DetailsProductApi({required this.client});
  Future<CategoryProduct> detailsProductApi(int id) async {

    client.options.queryParameters ={

      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    };
   print("queryParameters ddd=>"+ client.options.queryParameters.toString());
    Response response;
    try {
      response = await client.get('$showProductsUrl' + '/$id');
       log('RealEstateApi222 => ${response.data}');
      CategoryProduct model =CategoryProduct.fromJson(response.data);
      log('RealEstateApi414 => ${model}');
      print(model);

      return model;
    } on DioError catch (e) {
      log('error code: ${e.response!.statusCode}');
      log('error is: ${e.response!.data}');
      return e.error;
    }
  }
}



class AllProductApi {
  final Dio client;
  AllProductApi({required this.client});
  Future<CategoryProductModel> allProductApi( ) async {

    client.options.queryParameters ={

      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    };
    print("queryParametersas=>"+ client.options.queryParameters.toString());
    Response response;
    try {
      response = await client.get('$showProductsUrl');
      //log('RealEstateApi => ${response.data}');
      CategoryProductModel model =CategoryProductModel.fromJson(response.data);
      print(model.productsDetails);

      return model;
    } on DioError catch (e) {
      log('error code: ${e.response!.statusCode}');
      log('error is: ${e.response!.data}');
      return e.error;
    }
  }
}