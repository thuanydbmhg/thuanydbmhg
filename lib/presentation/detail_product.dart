import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/grocery/model/response/product_reponse/item_grocery.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:configuration/utility/string_const.dart';

class DetailProduct extends StatefulWidget {
 final ItemGrocery productData;
   DetailProduct({Key? key,required this.productData}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int _currentPage = 0;
  final controllerPageView = PageController(
    keepPage: false,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    nextView();
  }

  Future<void> nextView() async {
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < widget.productData.images!.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (controllerPageView.hasClients) {
        controllerPageView.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0
        ,
        backgroundColor: Color(0xffF2F3F2),
        title: Text(''),
        leading:       IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConstant.textColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [ListView(
          children: [
            Container(
              width: 1.sw,
              height: 0.46.sh,
              decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r))),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 28.h,
                    ),
                    Container(
                      height: 0.24.sh,
                      child: PageView.builder(
                          controller: controllerPageView,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                child: CachedNetworkImage(
                                  imageUrl:'${StringConstant.link}${widget.productData.images![index].image}',
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      // color: Colors.red.withOpacity(.4),
                      child: SmoothPageIndicator(
                        controller: controllerPageView,
                        count: 3,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            width: 16,
                            height: 8,
                            color: ColorConstant.activeColor,
                            rotationAngle: 0,
                            verticalOffset: 0,
                            borderRadius: BorderRadius.circular(24),
                            // dotBorder: DotBorder(
                            //   padding: 2,
                            //   width: 2,
                            //   color: Colors.indigo,
                            // ),
                          ),
                          dotDecoration: DotDecoration(
                            width: 8,
                            height: 8,
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16),
                            verticalOffset: 0,
                          ),
                          spacing: 6.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    '${'${widget.productData.descriptions!.first.name}'}',
                    style: TextStyle(
                        color: ColorConstant.textColor,
                        fontSize: 24.sp,
                        fontFamily: FontConstant.gilroy_bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Color(0xff7C7C7C),
                    size: 24.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text('1kg, price',
                  style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontFamily: FontConstant.gilroy_semibold,
                      fontSize: 16.sp)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(45.w, 45.h),
                          maximumSize: Size(45.w, 45.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.r)),
                              side: BorderSide(
                                  color: ColorConstant.stroke1.withOpacity(0.2),
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
                        fontFamily: FontConstant.gilroy_bold,
                        color: ColorConstant.textColor),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(45.w, 45.h),
                          maximumSize: Size(45.w, 45.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.r)),
                              side: BorderSide(
                                  color: ColorConstant.stroke1.withOpacity(0.2),
                                  width: 1))),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: ColorConstant.activeColor,
                      )),
                  Spacer(),
                  Text(
                    'đ 4.99',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontConstant.gilroy_bold,
                        color: ColorConstant.textColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Divider(
                  height: 4,
                  color: Color(0xffE2E2E2).withOpacity(0.8),
                  thickness: 1,
                  indent: 1,
                )),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Product Detail',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontConstant.gilroy_semibold,
                    color: ColorConstant.textColor),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '${widget.productData.descriptions!.first.content}',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontConstant.gilroy_medium,
                    color: ColorConstant.stroke1),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Divider(
                  height: 4,
                  color: Color(0xffE2E2E2).withOpacity(0.8),
                  thickness: 1,
                  indent: 1,
                )),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(children: [
                Text(
                  'Nutrion',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontConstant.gilroy_semibold,
                      color: ColorConstant.textColor),
                ),
                Spacer(),
                Text(
                  '100gr',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontConstant.gilroy_semibold,
                      color: ColorConstant.stroke1),
                )
              ]),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(children: [
                Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontConstant.gilroy_semibold,
                      color: ColorConstant.textColor),
                ),
                Spacer(),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 24.sp,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ]),
            ),
          ],
        ),Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextButton(
              style: TextButton.styleFrom(
                maximumSize: Size(1.sw, 50.h),
                minimumSize: Size(1.sw,50.h),
                backgroundColor: ColorConstant.activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                )
              ),
                onPressed: (){}, child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontFamily: FontConstant.gilroy_semibold,
            fontSize: 18.sp,),)),
          ),
        )]
      ),
    );
  }
}
