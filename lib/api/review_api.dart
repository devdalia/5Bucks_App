
import 'package:dio/dio.dart';
import 'package:bucks_app/utilities/const.dart';
class ReviewAddApi{
  final Dio client;

  ReviewAddApi({required this.client});
  Future<bool> ReviewData({Map<String,dynamic>? data}) async {
    client.options.queryParameters ={
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',
    };
 //   print("queryParametersadd=>"+ client.options.queryParameters.toString());

    Response response;
    try {
      response = await client.post(review, data: data);

    //  log('ReviewApis => ${response.data.toString()}');
      return true;
    } on DioError catch (e) {
      print("statuscode11:${e.response!.statusCode}");
      print("data22:${e.response!.data}");
      return false;
    }
  }
}