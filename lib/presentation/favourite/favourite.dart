import 'dart:math';

import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/apple.png'),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'Apple\n',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily:
                                              FontConstant.gilroy_bold,
                                              color:
                                              ColorConstant.textColor),
                                          children: [
                                            TextSpan(
                                                text: '1kg, price',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: FontConstant
                                                        .gilroy_regular,
                                                    color: ColorConstant
                                                        .stroke1))
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 0.27.sw,
                                    ),
                                    Text(
                                      'đ 4.99',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily:
                                          FontConstant.gilroy_bold,
                                          color: ColorConstant.textColor),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 24.sp,
                                      color: Color(0xffB3B3B3),
                                    )
                                  ],
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
                      );
                    }),
                Positioned(
                    bottom: 16,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: ColorConstant.activeColor,
                            maximumSize: Size(1.sw, 58.h),
                            minimumSize: Size(1.sw, 58.h),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(16.r)))),
                        onPressed: () {},
                        child: Text(
                          'Add All To Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: FontConstant.gilroy_semibold),
                        ),
                      ),
                    ))
              ]),
            )
          ],
        ),
      );
    });
  }
}
