import 'package:bucks_app/api/category_api.dart';
import 'package:bucks_app/api/category_product_api.dart';
import 'package:bucks_app/api/discount_api.dart';
import 'package:bucks_app/helpers/internet_helper.dart';

import 'package:bucks_app/model/categories_model.dart';
import 'package:bucks_app/model/category_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../get_it.dart';

class HomeProvider with ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late ReceiveProductDetailsModel  _categoriesModel;

  ReceiveProductDetailsModel  get categoriesModel => _categoriesModel;

  CategoryProductModel? _discountCodeModel;

  CategoryProductModel? get categoryProductModel => _discountCodeModel;

  CategoryProductModel ?_productPopularityModel;

  CategoryProductModel? get productPopularityModel => _productPopularityModel;

  CategoryProductModel? _categoryProductModel;

  CategoryProductModel? get modelcategory => _categoryProductModel;

  CategoryProductModel? _allproductModel;

  CategoryProductModel? get allproduct => _allproductModel;

  bool loading = false;
  bool cityLoading = false;
  bool categoryLoading = false;
  bool discountLoading = false;
  bool popularLoading = false;
  bool poolTypeLoading = false;
  bool getproductLoading = false;
  bool error = false;
  bool noInternet = false;

  String ?categoryId;


  int selectCategoryId=0;

  void getProductsEstate(int id) async {
    getproductLoading = true;
    bool connectInternet = await isInternet;
    if (connectInternet) {
      print('start getProductsEstate');
      getIt<CategoryProductApi>().realEstateByIdApi(id).then((value) {
        if (value != null) {
          getproductLoading = false;
          error = false;
          noInternet = false;
          _categoryProductModel = value;
          notifyListeners();
        } else {
          getproductLoading = false;
          noInternet = false;
          error = true;
          notifyListeners();
        }
      });
    } else {
      getproductLoading = false;
      noInternet = true;
      notifyListeners();
    }
  }

  void getCategories() async {
    categoryLoading = true;
    bool connectInternet = await isInternet;
    if (connectInternet) {
      print('getCategories');
      getIt<CategoriesApi>().categoriesApi().then((value) {
        if (value != null) {
          categoryLoading = false;
          error = false;
          noInternet = false;
          notifyListeners();
          _categoriesModel = value;
          getProductsEstate(value.productsDetails![0].id!);
          getDiscount();
        } else {
          categoryLoading = false;
          noInternet = false;
          error = true;
          notifyListeners();
        }
      });
    } else {
      categoryLoading = false;
      noInternet = true;
      notifyListeners();
    }
  }

  void getDiscount() async {
    discountLoading = true;
    bool connectInternet = await isInternet;
    if (connectInternet) {
      print('start getDiscount');
      getIt<DiscountCodeApi>().discountCodeApi().then((value) {
        if (value != null) {
          discountLoading = false;
          _discountCodeModel = value;
          discountLoading = false;
          error = false;
          noInternet = false;
          notifyListeners();
        } else {
          discountLoading = false;
          noInternet = false;
          error = true;
          notifyListeners();
        }
      });
    } else {
      discountLoading = false;
      noInternet = true;
      notifyListeners();
    }
  }

  void increment(int id) {
    for (var item in modelcategory!.productsDetails!) {
      if (item.id == id) {
        item.quntity +1;
        print(item.quntity);
      }
    }
  }
}
