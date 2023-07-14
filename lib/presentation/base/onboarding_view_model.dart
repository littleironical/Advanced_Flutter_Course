import 'dart:async';
import 'package:advanced_flutter_course/domain/model/model.dart';
import 'package:advanced_flutter_course/presentation/base/base_view_model.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // STREAM CONTROLLERS
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderList;
  int _currentIndex = 0;

  // INPUTS
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderList();
    _sendDataToView();
  }

  @override
  int goNextPage() {
    _currentIndex++;
    if(_currentIndex >= _sliderList.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPreviousPage() {
    _currentIndex--;
    if(_currentIndex == -1) {
      _currentIndex = _sliderList.length - 1;
    }
    return _currentIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _sendDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // OUTPUTS
  @override
  Stream<SliderViewObject> get outSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // PRIVATE FUNCTIONS
  List<SliderObject> _getSliderList() => [
    SliderObject(StringManager.onBoardingTitle1, StringManager.onBoardingSubTitle1, ImageAssetManager.onboardingImage1),
    SliderObject(StringManager.onBoardingTitle2, StringManager.onBoardingSubTitle2, ImageAssetManager.onboardingImage2),
    SliderObject(StringManager.onBoardingTitle3, StringManager.onBoardingSubTitle3, ImageAssetManager.onboardingImage3),
    SliderObject(StringManager.onBoardingTitle4, StringManager.onBoardingSubTitle4, ImageAssetManager.onboardingImage4),
  ];

  _sendDataToView() {
    inputSliderViewObject.add(SliderViewObject(_sliderList[_currentIndex], _sliderList, _sliderList.length, _currentIndex));
  }
}

// INPUTS - THE ORDERS THAT OUR VIEW MODEL WILL RECEIVE FROM VIEW
abstract class OnBoardingViewModelInputs {
  void goNextPage(); // WHEN USER GOTO NEXT PAGE OR SWIPE RIGHT
  void goPreviousPage(); // WHEN USER GOTO PREVIOUS PAGE OR SWIPE LEFT
  void onPageChange(int index); // TO SHOW CURRENT PAGE INDEX

  Sink get inputSliderViewObject; // WAY TO ADD DATA TO STREAM .. STREAM INPUT .. SINK
}

// OUTPUTS - THE ORDERS THAT OUR VIEW MODEL WILL RECEIVE FROM VIEW
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  List<SliderObject> sliderList;
  int numOfSliders;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.sliderList, this.numOfSliders, this.currentIndex);
}
