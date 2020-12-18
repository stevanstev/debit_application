String minuteStringFormat(String minute) =>
    minute.length < 2 ? '0' + minute.toString() : minute;

/// Add hour + 1 if minute more than 60 minute
List<int> minuteNumberFormat(int hour, int minute) =>
    (minute >= 60) ? [1, 60 - minute] : [0, minute];

String hourStringFormat(int hour) {
  String _stringHour;

  if (hour <= 10 || hour > 24) {
    _stringHour = 'AM';
  } else if (hour > 10 || hour <= 24) {
    _stringHour = 'PM';
  }

  return _stringHour;
}

String monthFormat(int month) {
  String _stringMonth;

  switch (month) {
    case DateTime.january:
      _stringMonth = 'Jan';
      break;
    case DateTime.february:
      _stringMonth = 'Feb';
      break;
    case DateTime.march:
      _stringMonth = 'Mar';
      break;
    case DateTime.april:
      _stringMonth = 'Apr';
      break;
    case DateTime.may:
      _stringMonth = 'May';
      break;
    case DateTime.june:
      _stringMonth = 'Jun';
      break;
    case DateTime.july:
      _stringMonth = 'Jul';
      break;
    case DateTime.august:
      _stringMonth = 'Aug';
      break;
    case DateTime.september:
      _stringMonth = 'Sep';
      break;
    case DateTime.october:
      _stringMonth = 'Oct';
      break;
    case DateTime.november:
      _stringMonth = 'Nov';
      break;
    case DateTime.december:
      _stringMonth = 'Dec';
      break;
    default:
      _stringMonth = '';
      break;
  }

  return _stringMonth;
}
