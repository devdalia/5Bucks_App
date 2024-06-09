
import 'package:dio/dio.dart';
import 'package:bucks_app/utilities/const.dart';
import 'package:bucks_app/model/location_model.dart';

class AddNewAddressApi {
  final Dio  client;

  AddNewAddressApi({required this.client});

  Future<LocationModel> addAddress({Map<String, dynamic>? data}) async {
    Response? response;
    try {
       await client.post(
        location,
        data: data,
      );
     // print('get location: ${response.data}');

   //   print('client: ${client}');
     // print(' locationsss add header model: ${response.headers}');
      return LocationModel.fromJson(response!.data);

    } on DioError catch (e) {
     // log('error code add location: ${e.response?.statusCode}');
    //  log('error is add location: ${e.response?.data}');
      return e.error;
    }
  }
}
