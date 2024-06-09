import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:bucks_app/model/review_model.dart';
import 'package:bucks_app/utilities/const.dart';

class AllReviewApi {
  final Dio client;

  AllReviewApi({required this.client});

  Future<ReviewModel> getReviewData(int id) async {
    client.options.queryParameters = {
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
      "product": "$id",
    };
    print(
        "queryParametersgetget=>" + client.options.queryParameters.toString());
    Response response;
    try {
      response = await client.get(review);
      log('ReviewApidata => ${response.data}');
      ReviewModel reviewModel = ReviewModel.fromJson(response.data);
      log('Review => ${reviewModel.review}');
      return reviewModel;
    } on DioError catch (e) {
      print("statuscode13:${e.response!.statusCode}");
      print("data33:${e.response!.data}");
      return e.error;
    }
  }
}
