import 'package:advanced_flutter_course/presentation/base/onboarding_view_model.dart';
import 'package:advanced_flutter_course/presentation/resources/colors_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/icons_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/model/model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    }
    else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSizeManager.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSliders,
          onPageChanged: (index) {
            _viewModel.onPageChange(index);
          },
          itemBuilder: (context, index) => OnBoardingPage(sliderViewObject.sliderList[index]),
          // itemBuilder: (context, index) => OnBoardingPage(sliderViewObject.sliderObject), // NEXT PAGE CHANGES WITH LAG
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSizeManager.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    StringManager.skipText,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              _bottomPageControls(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _bottomPageControls(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //LEFT ARROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p8),
            //* FOR ICON SVG
            // child: GestureDetector(
            //   child: SizedBox(
            //     height: AppSizeManager.s20,
            //     width: AppSizeManager.s20,
            //     child: SvgPicture.asset(ImageAssetManager.splashLogo),
            //   ),
            // ),
            child: IconButton(
              icon: const Icon(IconManager.leftArrow),
              iconSize: AppSizeManager.s20,
              onPressed: () {
                // GOTO PREVIOUS PAGE
                _pageController.animateToPage(
                    _viewModel.goPreviousPage(),
                    duration: const Duration(milliseconds: AppDurationManager.d300),
                    curve: Curves.linear,
                );
              },
            ),
          ),

          // PAGE INDICATORS
          Row(
            children: [
              for(int index=0; index<sliderViewObject.numOfSliders; index++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p4),
                  child: Icon(
                    _pageIndicators(index, sliderViewObject.currentIndex),
                    size: AppSizeManager.s14,
                  ),
                ),
            ],
          ),

          // RIGHT ARROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p8),
            child: IconButton(
              icon: const Icon(IconManager.rightArrow),
              iconSize: AppSizeManager.s20,
              onPressed: () {
                // GOTO PREVIOUS PAGE
                _pageController.animateToPage(
                  _viewModel.goNextPage(),
                  duration: const Duration(milliseconds: AppDurationManager.d300),
                  curve: Curves.linear,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _pageIndicators(int index, int currentIndex) {
    if(index == currentIndex) {
      return IconManager.filledDot;
    }
    else {
      return IconManager.outlinedDot;
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizeManager.s40),
        Padding(
          padding: const EdgeInsets.all(AppPaddingManager.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPaddingManager.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSizeManager.s60),
        SvgPicture.asset(_sliderObject.image),
        // SvgPicture.network('https://upload.wikimedia.org/wikipedia/commons/4/4f/SVG_Logo.svg'),
      ],
    );
  }
}
