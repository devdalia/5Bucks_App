import 'package:bucks_app/api/attributes_values_api.dart';
import 'package:bucks_app/api/category_product_api.dart';

import 'package:bucks_app/helpers/internet_helper.dart';
import 'package:bucks_app/model/attributes_values_model.dart';
import 'package:bucks_app/model/category_products_model.dart';
import 'package:bucks_app/model/variation_model.dart';
import 'package:bucks_app/utilities/custom_dialog.dart';

import 'package:flutter/material.dart';

import '../get_it.dart';

class DetailsProductsProvider with ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CategoryProductModel? _categoryProductModel;

  CategoryProduct? _categoryProduct;

  List<VariationModel> listVariation = [];

  CategoryProductModel? get categoryProductModel => _categoryProductModel;

  CategoryProduct? get categoryProduct => _categoryProduct;

  late AttributesValuesModel _attributesValuesModel;

  AttributesValuesModel get attributesValuesModel => _attributesValuesModel;

  Map <String, dynamic> attributes ={};

  bool loading = false;
  bool loadingAttributes = false;
  bool getproductLoading = false;
  bool error = false;
  bool noInternet = false;

  void getProductsEstate(int id) async {
    getproductLoading = true;
    bool connectInternet = await isInternet;
    if (connectInternet) {
      print('start getProductsEstate');
    } else {
      getproductLoading = false;
      noInternet = true;
      notifyListeners();
    }
  }

  void getDatailsProducts(int id) async {
    listVariation.clear();
    loading = true;
    bool connectInternet = await isInternet;
    if (connectInternet) {
      print('start getProductsEstate');
      getIt<DetailsProductApi>().detailsProductApi(id).then((value) {
        if (value != null) {
          _categoryProduct = value;
          if (value.attributes != null) {
            for (int i = 0; i < value.attributes!.length; i++) {
              listVariation.add(VariationModel(
                  id: value.attributes![i].id!,
                  name: value.attributes![i].name!,
                  position: value.attributes![i].position!,
                  selected: value.attributes![i].position! == 0 ? true : false,
                  options: value.attributes![i].options!));
            }
          }

          loading = false;
          error = false;
          noInternet = false;
          notifyListeners();
        } else {
          loading = false;
          noInternet = false;
          error = true;
          notifyListeners();
        }
      });
    } else {
      loading = false;
      noInternet = true;
      notifyListeners();
    }
  }
  getAttributes(Map<String, dynamic> data)async{
    loadingAttributes = true;
      print('start add getAttributes');
      notifyListeners();
      getIt<AttributesValuesApi>().attributesValuesApi(data:data).then((value) async {
        if (value != null) {
          loadingAttributes = false;
          _attributesValuesModel = value;
          notifyListeners();
          // Navigator.pop(scaffoldKey.currentContext);
          print('finish getAttributes');
          notifyListeners();
        }
      });
  }
}
