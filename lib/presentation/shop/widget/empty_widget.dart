
import 'package:configuration/utility/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/image.png',width: 0.4.sw,height: 0.24.sh,),
        SizedBox(height: 16.h,),
        Text('Opps Page Is Empty !',style: TextStyle(fontSize: 18.sp,color: ColorConstant.activeColor,
        fontFamily: FontConstant.gilroy_medium),)
      ],
    );
  }
}
