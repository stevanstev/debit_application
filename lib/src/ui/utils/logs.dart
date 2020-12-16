void writeLog({String message, String logContext}) {
  DateTime dt = DateTime.now();
  print('[$dt] $logContext: $message');
}
