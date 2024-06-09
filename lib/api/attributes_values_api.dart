
import 'package:bucks_app/model/attributes_values_model.dart';
import 'package:dio/dio.dart';
import 'package:bucks_app/utilities/const.dart';
import 'package:bucks_app/model/location_model.dart';

class AttributesValuesApi {
  final Dio  client;

  AttributesValuesApi({required this.client});

  Future<AttributesValuesModel> attributesValuesApi({Map<String, dynamic>? data}) async {
    Response? response;
    try {
      await client.post(
        attributesValuesUrl,
        data: data,
      );

      return AttributesValuesModel.fromJson(response!.data);

    } on DioError catch (e) {
      // log('error code add location: ${e.response?.statusCode}');
      //  log('error is add location: ${e.response?.data}');
      return e.error;
    }
  }
}
