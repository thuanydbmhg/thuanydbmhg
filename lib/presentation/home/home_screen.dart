import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/account/account_screen.dart';
import 'package:flutter_architecture/presentation/cart/my_scart_screen.dart';
import 'package:flutter_architecture/presentation/explore/explore_screen.dart';
import 'package:flutter_architecture/presentation/favourite/favourite.dart';
import 'package:flutter_architecture/presentation/shop/shop_screen.dart';
import 'package:flutter_architecture/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:configuration/utility/icon_const.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30,fontFamily: 'Gilroy_Regular' );
  static const List<Widget> _widgetOptions = <Widget>[
    ShopScreen(),
    ExploreScreen(),
    MyCartScreen(),
    Favourite(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r), topLeft: Radius.circular(16.r)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconConstant.HOME),
                label: 'Shop',
                activeIcon: SvgPicture.asset(
                  IconConstant.HOME,
                  color: ColorConstant.activeColor,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconConstant.EXPLORE),
                label: 'Explore',
                activeIcon: SvgPicture.asset(
                  IconConstant.EXPLORE,
                  color: ColorConstant.activeColor,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconConstant.CART),
                label: 'Cart',
                activeIcon: SvgPicture.asset(
                  IconConstant.CART,
                  color: ColorConstant.activeColor,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconConstant.FAVOURITE),
                label: 'Favourite',
                activeIcon: SvgPicture.asset(
                  IconConstant.FAVOURITE,
                  color: ColorConstant.activeColor,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconConstant.ACCOUNT),
                label: 'Account',
                activeIcon: SvgPicture.asset(
                  IconConstant.ACCOUNT,
                  color: ColorConstant.activeColor,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: ColorConstant.activeColor,
            elevation: 8,
            selectedLabelStyle: GoogleFonts.lato(
                textStyle: TextStyle(
              color: ColorConstant.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            )),
            unselectedItemColor: ColorConstant.textColor,
            showUnselectedLabels: true,
            unselectedLabelStyle: GoogleFonts.lato(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstant.textColor,
              fontSize: 12.sp,
            )),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
