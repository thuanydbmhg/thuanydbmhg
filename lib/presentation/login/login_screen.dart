import 'package:configuration/utility/color_const.dart';
import 'package:configuration/utility/icon_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Login',style: TextStyle(fontSize: 18.sp,
        color: ColorConstant.textColor,fontFamily: FontConstant.gilroy_medium),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,size: 24.sp,color: ColorConstant.textColor,),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(

              children: [
                SizedBox(
                  height: 12.h,
                ),
                Center(
                  child: SvgPicture.asset(
                    IconConstant.LOGO,
                    width: 54.w,
                    height: 54.h,
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                RichText(text: TextSpan(
                  text: 'Login\n \n',style: TextStyle(
                  fontFamily: FontConstant.gilroy_semibold,
                  fontSize: 26.sp,
                  color: ColorConstant.textColor
                ),children: [
                    TextSpan(
                    text: 'Enter your emails and password',style: TextStyle(
                    fontFamily: FontConstant.gilroy_medium,
                    fontSize: 16.sp,
                    color: ColorConstant.stroke1
                ))
                ]
                )), SizedBox(
                  height: 40.h,
                ),
                Text(
                    'Email',style: TextStyle(
                    fontFamily: FontConstant.gilroy_medium,
                    fontSize: 16.sp,
                    color: ColorConstant.stroke1
                )),
                TextField(
                  controller: controller.emailController,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                    'password',style: TextStyle(
                    fontFamily: FontConstant.gilroy_medium,
                    fontSize: 16.sp,
                    color: ColorConstant.stroke1
                )),
                TextField(
                  controller: controller.passController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 36.h,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: ColorConstant.activeColor,
                      maximumSize: Size(1.sw, 58.h),
                      minimumSize: Size(1.sw, 58.h),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(16.r)))),
                  onPressed: () async{
                    await controller.loginUser(context);


                   },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: FontConstant.gilroy_semibold),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  child: Center(
                    child: RichText(text: TextSpan(
                        text: 'Don\'t have account ',style: TextStyle(
                        fontFamily: FontConstant.gilroy_semibold,
                        fontSize: 14.sp,
                        color: ColorConstant.textColor
                    ),children: [
                      TextSpan(
                          text: 'Signup',style: TextStyle(
                          fontFamily: FontConstant.gilroy_semibold,
                          fontSize: 14.sp,
                          color: ColorConstant.activeColor
                      ))
                    ]
                    )),
                  ),
                ),

              ],
            ),
          );
        }
      ),
    );
  }
}
