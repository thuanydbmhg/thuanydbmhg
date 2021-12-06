import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width:72.w,
                        height: 72.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.2)
                        ),
                        child: Image.asset('assets/images/apple.png',width: 126.w,height: 166.w,),
                      ),
                      SizedBox(width: 16.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Thanh Xinh Gai',style: TextStyle(fontFamily: FontConstant.gilroy_bold,fontSize: 18.sp,color: ColorConstant.textColor),),
                          Text('thanh982411@gmail.com',style: TextStyle(fontFamily: FontConstant.gilroy_regular,fontSize: 16.sp,color: ColorConstant.stroke1.withOpacity(0.6)),),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  Container(
                    height: 0.45.sh,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context,index){
                          return InkWell(
                            child: Column(
                              children: [
                                Container(width: 1.sw,
                                  height: 0.5,color: Color(0xff7C7C7C).withOpacity(0.5),),
                                SizedBox(height: 16.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(children: [
                                    controller.getIcon(index),
                                    SizedBox(width: 12.w,),
                                    Text(controller.getText(index),style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontSize: 16.sp,
                                      fontFamily: FontConstant.gilroy_semibold
                                    ),),Spacer(),
                                    Icon(Icons.arrow_forward_ios_rounded,size: 18.sp,)
                                  ],),
                                ),
                                SizedBox(height: 16.h,),
                              ],
                            ),
                          ) ;
                        }),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextButton(style: TextButton.styleFrom(
                      maximumSize: Size(1.sw,52.h),
                      minimumSize: Size(1.sw,52.h),
                      backgroundColor: Color(0xffE5E5E5),
                      shape: RoundedRectangleBorder (
                        borderRadius: BorderRadius.all(Radius.circular(16.r))
                      )
                    ),
                    onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.logout,color: ColorConstant.activeColor,size: 20.sp,),
                        Spacer(),
                        Text('Log Out',style: TextStyle(color: ColorConstant.activeColor,fontFamily: FontConstant.gilroy_medium,fontSize: 16.sp),),
                        Spacer(),
                        Icon(Icons.logout,color: Colors.transparent,size: 20.sp,),
                      ],
                    )),
                  ),SizedBox(height: 32.h,)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
