import 'dart:async';

import 'package:configuration/data/data_source/local/sessions_pref.dart';
import 'package:configuration/di/di_module.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/item_grocery_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/product_data_source.dart';
import 'package:flutter_architecture/data/grocery/model/response/category_response/category_reponse_model.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/item_grocery.dart';
import 'package:flutter_architecture/data/grocery/repositories/user_repo.dart';
import 'package:flutter_architecture/domain/login/use_cases/get_data_product_use_case.dart';
import 'package:flutter_architecture/domain/login/use_cases/get_list_category.dart';
import 'package:flutter_architecture/domain/login/use_cases/login_grocery_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _getDataProduct = GetDataProductUseCase(getIt<UserRepoImpl>());
  final _loginGrocery = LoginGrocery(getIt<UserRepoImpl>());
  final _getListCategory = GetListCategory(getIt<UserRepoImpl>());
  final _getCartAndFavorite = getIt<ProductDataSource>();
  String token = '';
  bool isLoading = false;
  List<ItemGrocery> listItem = [];
  List<ItemGroceryLocal> listItemCart = [];
  List<ItemGroceryLocal> listItemFavorite = [];
  List<CategoryReponseModel> listCategory = [];


  @override
  void onInit() async {
    loading(true);
    getListCart();
    super.onInit();
    await getToken();
    await getProduct();
    await getListCategory();
    loading(false);

  }
  void loading(bool value)
  {
    isLoading = value;
    update();
  }
  Future<void> getListCart() async
  {
    final data = await _getCartAndFavorite.getData();
    if(data.toString().compareTo('null')==0)
      {
        listItemCart =[];
        update();
      }
    else
      {
        listItemCart = data!;
        update();
      }
    final data1 = await _getCartAndFavorite.getData();
    if(data1.toString().compareTo('null')==0)
    {
      listItemFavorite =[];
      update();
    }
    else
    {
      listItemFavorite = data1!;
      update();
    }


  }
  Future<void> addToCart(ItemGroceryLocal itemGrocery)async
  {
    listItemCart.add(itemGrocery);
    update();
    await _getCartAndFavorite.saveDataCart(listItemCart);
  }
  Future<void> addToFavorite(ItemGroceryLocal itemGroceryLocal) async
  {
    listItemFavorite.add(itemGroceryLocal);
    update();
    await _getCartAndFavorite.saveDataFavorite(listItemFavorite);
  }
  Future<void> removeCart(int index)async
  {
    listItemCart.removeAt(index);
    update();
    await _getCartAndFavorite.saveDataCart(listItemCart);
  }
  Future<void> getToken() async {
    final data = await _loginGrocery.loginGrocery('admin', 'admin123');
    token = data!.accessToken!;
    update();
    SessionPref.saveSession(accessToken: token, refreshToken: token);
  }

  Future<void> getProduct() async {
    final data = await _getDataProduct.getDataProduct();
    listItem = data!.listItem!;
    update();
  }
  Future<void> getListCategory() async
  {
    final data = await _getListCategory.getListCategory();
    listCategory = data!.listItemCategory!;
    update();
  }
  Color getColorExplore(int index)
  {
    switch(index){
      case 0:
         return Color(0xff53B175);
      case 1:
        return Color(0xffF8A44C);
      case 2:
        return Color(0xffF7A593);
      case 3:
        return Color(0xffD3B0E0);
      case 4:
        return Color(0xffFDE598);
      case 5:
        return Color(0xffB7DFF5);
      case 6:
        return Color(0xff53B175);
      case 7:
        return Color(0xff53B175);
      case 8:
        return Color(0xffF8A44C);
      case 9:
        return Color(0xffF7A593);
      case 10:
        return Color(0xffD3B0E0);
      case 11:
        return Color(0xffFDE598);
      case 12:
        return Color(0xffB7DFF5);
      default:
        return Color(0xffB7DFF5);
    }
  }
  Icon getIcon(int index)
  {
    switch(index)
    {
      case 0:
        return  Icon(Icons.add_shopping_cart,color: ColorConstant.textColor,);
      case 1:
        return Icon(Icons.contact_phone_outlined,color: ColorConstant.textColor,);
      case 2:
        return Icon(Icons.location_on_rounded,color: ColorConstant.textColor,);
      case 3:
        return Icon(Icons.payment,color: ColorConstant.textColor,);
      case 4:
        return Icon(Icons.help_outline,color: ColorConstant.textColor,);
      case 5:
        return Icon(Icons.info_outline,color: ColorConstant.textColor,);
      case 6:
        return Icon(Icons.add_shopping_cart,color: ColorConstant.textColor,);
      case 7:
        return Icon(Icons.add_shopping_cart);

      default:
        return Icon(Icons.add_shopping_cart);
    }
  }
  String getText(int index)
  {

    switch(index)
    {
      case 0:
        return  'Orders';
      case 1:
        return 'My Detail';
      case 2:
        return 'DeliveryAddress';
      case 3:
        return 'Payment Methods';
      case 4:
        return 'Help';
      case 5:
        return 'About';

      default:
        return '';
    }
  }
}
