

import 'package:dio/dio.dart';
import 'package:bucks_app/model/payment_model.dart';
import 'package:bucks_app/utilities/const.dart';

class GetPaymentApi {
  final Dio client;

  GetPaymentApi({required this.client});

  Future<PaymentModelList> getPaymentApi() async {
    print("welcome");
    client.options.queryParameters = {
      'consumer_key': 'ck_aa7116bd306daab431803e335f4cd7b074576dc2',
      'consumer_secret': 'cs_3c0be07301bbbe8c76c1aef89498278dceab8239',

    };
 //   print("queryParametersgetpayment=>" +
     //   client.options.queryParameters.toString());
    try {
      var res = await client.get(payment);
      //log('res get payment=>${res.data}');
      PaymentModelList getpaymentModel = PaymentModelList.fromJson(res.data);
   //   log('payment => ${getpaymentModel}');
      return getpaymentModel;
    } on DioError catch (e) {
      print("statuscode payment:${e.response!.statusCode}");
      print("data payment:${e.response!.data}");
      return e.error;
    }
  }
}
