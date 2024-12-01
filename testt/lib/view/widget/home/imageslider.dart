import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.imagePaths});
  final List<String> imagePaths ;

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

   @override
  void initState() {
    super.initState();
    _startAutoSlide();
    _pageController.addListener(() {
    final page = _pageController.page?.toInt() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
        });
      }
    }); // بدء التبديل التلقائي عند بدء التطبيق
  }

  @override
  void dispose() {
    _timer?.cancel(); // إيقاف المؤقت عند إغلاق التطبيق
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page!.toInt() + 1) % widget.imagePaths.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            height: 240,
          child:  Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.imagePaths.length,
                itemBuilder: (context, index) {
                  return  Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(vertical:  20,horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                      child:SizedBox(
                        width: double.infinity,
                        height: 200,
                     child: Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.fill,
                    )),
                     ) ]
                  ));
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.imagePaths.length,
                    (index) => _buildDot(index),
                  ))),
            ],
          ),
              ),
              SizedBox(height: 20,)
        ],
      );
  }

 Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 12.0 : 8.0,
      height: _currentPage == index ? 12.0 : 8.0,
      decoration: BoxDecoration(
         boxShadow:[ BoxShadow(
                      color: ColorApp.logo,
                      spreadRadius: 3,
                      blurRadius: 20,
                      offset: Offset(0, 7 ),
                    ),],
        color: _currentPage == index ? ColorApp.logo : ColorApp.gray,
        shape: BoxShape.circle,
      ),
    );
  }
}