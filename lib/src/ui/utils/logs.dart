import 'package:flutter/widgets.dart';

void writeLog({
  @required String message,
  @required String logContext,
}) {
  DateTime dt = DateTime.now();
  print('[$dt] $logContext: $message');
}
