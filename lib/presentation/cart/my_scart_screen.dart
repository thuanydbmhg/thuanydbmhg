import 'dart:math';

import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    final random = Random();
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Cart',
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
                                Column(
                                  children: [
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
                                          width: 0.35.sw,
                                        ),
                                        Icon(
                                          Icons.close,
                                          size: 24.sp,
                                          color: Color(0xffB3B3B3),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                minimumSize: Size(45.w, 45.h),
                                                maximumSize: Size(45.w, 45.h),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                18.r)),
                                                    side: BorderSide(
                                                        color: ColorConstant
                                                            .stroke1
                                                            .withOpacity(0.2),
                                                        width: 1))),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorConstant.activeColor,
                                            )),
                                        Text(
                                          '  1  ',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:
                                                  FontConstant.gilroy_bold,
                                              color: ColorConstant.textColor),
                                        ),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                minimumSize: Size(45.w, 45.h),
                                                maximumSize: Size(45.w, 45.h),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                18.r)),
                                                    side: BorderSide(
                                                        color: ColorConstant
                                                            .stroke1
                                                            .withOpacity(0.2),
                                                        width: 1))),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.add,
                                              color: ColorConstant.activeColor,
                                            )),
                                        SizedBox(
                                          width: 0.15.sw,
                                        ),
                                        Text(
                                          'đ 4.99',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily:
                                                  FontConstant.gilroy_bold,
                                              color: ColorConstant.textColor),
                                        ),
                                      ],
                                    )
                                  ],
                                )
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
                          'Go to check out',
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
