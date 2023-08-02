import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int activeIndex = 0;
  late final CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: AppPadding.p16.sp,
          left: AppPadding.p16.sp,
          right: AppPadding.p16.sp,
        ),
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: Constants.clubImages.length,
              itemBuilder: (context, index, realIndex) =>
                  _buildImage(Constants.clubImages[index], index),
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
            ),
            SizedBox(height: AppSize.s2.h),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: Constants.clubImages.length,
              effect: JumpingDotEffect(
                activeDotColor: ColorManager.darkPrimary,
                dotColor: ColorManager.grey,
                spacing: AppSize.s10,
                radius: AppSize.s12,
                dotHeight: AppSize.s12,
                dotWidth: AppSize.s12,
              ),
              onDotClicked: (index) => _carouselController.animateToPage(index),
            ),
          ],
        ),
      );

  Widget _buildImage(String image, int index) => Image.asset(
        image,
        fit: BoxFit.cover,
      );
}
