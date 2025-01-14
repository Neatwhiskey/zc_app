import 'package:stacked/stacked.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
  bool isVisible = false;
  bool isExpanded = false;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void toggleVisibility(bool _isVisible) {
    if (!_isVisible) {
      isVisible = false;
    } else {
      isVisible = true;
    }
    notifyListeners();
  }
}
