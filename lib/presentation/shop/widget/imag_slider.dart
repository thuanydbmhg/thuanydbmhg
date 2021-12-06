import 'dart:async';

import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentPage = 0;
  final controller = PageController(
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
      if (_currentPage <= 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (controller.hasClients) {
        controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        3,
        (index) => Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/${index + 1}.jpg'))),
            ));
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 115.h,
          child: PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        Positioned(
          bottom: 8,
          left: 1.sw / 2.5,
          child: Container(
            // color: Colors.red.withOpacity(.4),
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
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
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2),
                  //     topRight: Radius.circular(16),
                  //     bottomLeft: Radius.circular(16),
                  //     bottomRight: Radius.circular(2)),
                  borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
