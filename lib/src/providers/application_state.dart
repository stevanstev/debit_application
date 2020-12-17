import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/widgets.dart';

class ApplicationState extends ChangeNotifier {
  Color _color = debitBlue900;

  Color get color => _color;
  set color(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}
