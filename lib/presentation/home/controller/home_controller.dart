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
import 'package:flutter_architecture/data/grocery/repositories/grocery_repo.dart';
import 'package:flutter_architecture/data/grocery/repositories/user_repo.dart';
import 'package:flutter_architecture/domain/grocery/use_cases/login_user_grocery_usecase.dart';
import 'package:flutter_architecture/domain/login/use_cases/get_data_product_use_case.dart';
import 'package:flutter_architecture/domain/login/use_cases/get_list_category.dart';
import 'package:flutter_architecture/domain/login/use_cases/login_grocery_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _getDataProduct = GetDataProductUseCase(getIt<UserRepoImpl>());
  final _loginGrocery = LoginGrocery(getIt<UserRepoImpl>());
  final _getListCategory = GetListCategory(getIt<UserRepoImpl>());
  final _getCartAndFavorite = getIt<ProductDataSource>();
  final _loginUser = LoginUserGroceryUseCase(getIt<GroceryRepoImpl>());
  String token = '';
  String tokenUser ='';
  bool isLoading = false;
  List<ItemGrocery> listItem = [];
  List<ItemGrocery> listItemSearch = [];
  List<ItemGroceryLocal> listItemCart = [];
  List<ItemGroceryLocal> listItemFavorite = [];
  List<CategoryReponseModel> listCategory = [];
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void onInit() async {
    loading(true);
    getListCart();
    super.onInit();
    await getToken();
    await getTokenUser();
    await getProduct();
    await getListCategory();
    loading(false);
  }

  void selectListProductByCategory(int idCategoryID) {
    listItemSearch = listItem
        .where((element) =>
            element.brandId.toString().contains(idCategoryID.toString()))
        .toList();
    update();
  }
  void searchProduct(String name) {
    listItemSearch = listItem
        .where((element) =>
        element.descriptions!.first.name.toString().contains(name))
        .toList();
    update();
  }

  void loading(bool value) {
    isLoading = value;
    update();
  }
 Future<void> getTokenUser() async{
   tokenUser = SessionPref.getAccessTokenUser()??'';
   print('88888888888888888$tokenUser');
   update();

 }
  Future<void> getListCart() async {
    final data = await _getCartAndFavorite.getData();
    if (data.toString().compareTo('null') == 0) {
      listItemCart = [];
      update();
    } else {
      listItemCart = data!;
      update();
    }
    final data1 = await _getCartAndFavorite.getData();
    if (data1.toString().compareTo('null') == 0) {
      listItemFavorite = [];
      update();
      print('length of listxxxx ${listItemFavorite.length}');
    } else {
      listItemFavorite = data1!;
      update();
      print('length of list ${listItemFavorite.length}');
    }
  }

  Future<void> addToCart(ItemGroceryLocal itemGrocery) async {
    listItemCart.add(itemGrocery);
    update();
    await _getCartAndFavorite.saveDataCart(listItemCart);
  }

  Future<void> addToFavorite(ItemGroceryLocal itemGroceryLocal) async {
    if(listItemFavorite.where((element) => element.id.toString().contains(itemGroceryLocal.id.toString())).toList().isEmpty)
      {
        listItemFavorite.add(itemGroceryLocal);
        update();
        await _getCartAndFavorite.saveDataFavorite(listItemFavorite);
      }
  }
  Future<void> removeFavorite(int id)async
  {
    for(int i=0;i<listItemFavorite.length;i++)
      {
        if(listItemFavorite[i].id.toString().compareTo(id.toString())==0)
          {
            listItemFavorite.removeAt(i);
            update();
          }
      }
    await _getCartAndFavorite.saveDataFavorite(listItemFavorite);
  }

  Future<void> removeCart(int index) async {
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
  Future<void> loginUser(BuildContext context) async{

    final data = await _loginUser.loginGroceryUser(emailController.text, passController.text);
    tokenUser = data!.accessToken??'';
    update();
    if(tokenUser.isNotEmpty)
      {
        Get.back();
        SessionPref.saveSessionTokenUser(accessToken: tokenUser, refreshToken: tokenUser);
      }

  }
  void logOut()
  {
    tokenUser = '';
    update();
    SessionPref.saveSessionTokenUser(accessToken: tokenUser, refreshToken: tokenUser);
  }

  Future<void> getProduct() async {
    final data = await _getDataProduct.getDataProduct();
    listItem = data!.listItem!;
    update();
  }

  Future<void> getListCategory() async {
    final data = await _getListCategory.getListCategory();
    listCategory = data!.listItemCategory!;
    update();
  }

  Color getColorExplore(int index) {
    switch (index) {
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

  Icon getIcon(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.add_shopping_cart,
          color: ColorConstant.textColor,
        );
      case 1:
        return Icon(
          Icons.contact_phone_outlined,
          color: ColorConstant.textColor,
        );
      case 2:
        return Icon(
          Icons.location_on_rounded,
          color: ColorConstant.textColor,
        );
      case 3:
        return Icon(
          Icons.payment,
          color: ColorConstant.textColor,
        );
      case 4:
        return Icon(
          Icons.help_outline,
          color: ColorConstant.textColor,
        );
      case 5:
        return Icon(
          Icons.info_outline,
          color: ColorConstant.textColor,
        );
      case 6:
        return Icon(
          Icons.add_shopping_cart,
          color: ColorConstant.textColor,
        );
      case 7:
        return Icon(Icons.add_shopping_cart);

      default:
        return Icon(Icons.add_shopping_cart);
    }
  }

  String getText(int index) {
    switch (index) {
      case 0:
        return 'Orders';
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
