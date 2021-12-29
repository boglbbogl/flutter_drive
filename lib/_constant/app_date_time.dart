String appDateTime({
  required DateTime dateTime,
}) {
  final _differenctDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second)
      .difference(DateTime(dateTime.year, dateTime.month, dateTime.day,
          dateTime.hour, dateTime.minute, dateTime.second));
  final _diffSeconds = _differenctDateTime.inSeconds;
  final _diffMinutes = _differenctDateTime.inMinutes;
  final _diffHours = _differenctDateTime.inHours;
  final _diffDays = _differenctDateTime.inDays;

  if (_diffSeconds < 60) {
    return "$_diffSeconds초 전";
  } else if (_diffMinutes < 60) {
    return "$_diffMinutes분 전";
  } else if (_diffHours < 24) {
    return "$_diffHours시간 전";
  } else if (_diffDays < 7) {
    return "$_diffDays일 전";
  } else if (_diffDays > 7 &&
      DateTime.now().year.toString() == dateTime.year.toString()) {
    return dateTime.toString().substring(4, 10);
  } else {
    return dateTime.toString().substring(0, 10);
  }
}
