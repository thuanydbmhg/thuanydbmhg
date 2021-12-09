import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:configuration/utility/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/presentation/shop/widget/empty_widget.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'detail_product.dart';

class SearchScreen extends StatelessWidget {


  SearchScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.3;
    final double itemWidth = size.width / 2;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Search Product',
            style: TextStyle(
                fontFamily: FontConstant.gilroy_semibold,
                color: ColorConstant.textColor,
                fontSize: 18.sp),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: ColorConstant.textColor,
            ),
          ),
          elevation: 0,
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(children: [
                TextField(
                  decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: ColorConstant.text2,
                      ),
                      contentPadding: EdgeInsets.only(top: 8.h, left: 8.w),
                      fillColor: ColorConstant.card1,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 44.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: BorderSide(
                            color: ColorConstant.activeColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      ),
                      hintText: 'Search in store',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),onChanged: (value)
                  {
                    controller.searchProduct(value);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child:  controller.listItemSearch.isEmpty? Center(child: EmptyWidget(),):GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: controller.listItemSearch.map((value) {
                      return GestureDetector(
                        onTap: () =>
                            Get.to(() => DetailProduct(productData: value)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                          height: 0.29.sh,
                          width: 0.415.sw,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r)),
                              border: Border.all(
                                  color: ColorConstant.stroke1.withOpacity(0.5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 34.h,
                              ),
                              CachedNetworkImage(
                                width: 0.23.sw,
                                height: 0.1.sh,
                                imageUrl: "${StringConstant.link}${value.image}",
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              SizedBox(
                                height: 34.h,
                              ),
                              Text(
                                '${value.descriptions!.first.name ?? 'sss'}',
                                style: TextStyle(
                                    fontFamily: FontConstant.gilroy_bold,
                                    fontSize: 16.sp,
                                    color: ColorConstant.text3),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                '${value.sku ?? '0'}',
                                style: TextStyle(
                                    fontFamily: FontConstant.gilroy_medium,
                                    fontSize: 16.sp,
                                    color: ColorConstant.stroke1),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'đ ${value.price}',
                                    style: TextStyle(
                                        fontFamily: FontConstant.gilroy_bold,
                                        fontSize: 16.sp,
                                        color: ColorConstant.text3),
                                  ),
                                  Spacer(),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          elevation: 8,
                                          backgroundColor:
                                              ColorConstant.activeColor,
                                          maximumSize: Size(45.w, 45.h),
                                          minimumSize: Size(45.w, 45.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.r)))),
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ]),
            );

        }),
      ),
    );
  }
}
