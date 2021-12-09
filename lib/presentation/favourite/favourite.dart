import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:configuration/utility/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/detail_product.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/presentation/shop/widget/empty_widget.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../detail_product_local.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Favorurite',
            style: TextStyle(
                fontSize: 20.sp,
                fontFamily: FontConstant.gilroy_bold,
                color: ColorConstant.textColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 1.sw,
              height: 1,
              color: Color(0xffE2E2E2),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Stack(children: [
                controller.listItemFavorite.isEmpty?Center(child: EmptyWidget(),):ListView.builder(
                    itemCount: controller.listItemFavorite.length,
                    itemBuilder: (context, index) {
                      final data = controller.listItemFavorite[index];
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>DetailProductLocal(productData:data ));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                          CachedNetworkImage(imageUrl: '${StringConstant.link}${data.image}',
                            width: 0.17.sw,
                            height: 0.077.sh,),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: '${data.descriptions!.first.name}\n',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontFamily:
                                                  FontConstant.gilroy_bold,
                                                  color:
                                                  ColorConstant.textColor),
                                              children: [
                                                TextSpan(
                                                    text: '${data.sku}',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily: FontConstant
                                                            .gilroy_regular,
                                                        color: ColorConstant
                                                            .stroke1))
                                              ]),
                                        ),
                                        Spacer(),
                                        Text(
                                          'đ ${data.price}',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:
                                              FontConstant.gilroy_bold,
                                              color: ColorConstant.textColor),
                                        ),
                                        Expanded(
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 24.sp,
                                            color: Color(0xffB3B3B3),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: 1.sw,
                                height: 1,
                                color: Color(0xffE2E2E2),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

              ]),
            )
          ],
        ),
      );
    });
  }
}
