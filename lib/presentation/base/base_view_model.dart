abstract class BaseViewModel extends BaseViewModelInputs implements BaseViewModelOutputs {
  // SHARED VARIABLES AND FUNCTIONS THAT WILL BE SHARED THROUGHOUT THE VIEWMODEL
}

abstract class BaseViewModelInputs {
  void start(); // WILL BE CALLED WHILE INITIALIZATION (INIT) OF VIEW MODEL
  void dispose(); // WILL BE CALLED WHEN VIEWMODEL DIES
}

abstract class BaseViewModelOutputs {}
