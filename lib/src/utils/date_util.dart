class DateUtil {
  _DateUtil() {}

  static String formateToString(DateTime dateTime) {
    //dateTime = _fixDateTime(dateTime);

    final String day = _put0Left(dateTime.day);
    final String month = _put0Left(dateTime.month);
    final String year = '${dateTime.year}';
    final String hour = _put0Left(dateTime.hour);
    final String minute = _put0Left(dateTime.minute);

    return '$day/$month/$year $hour:$minute';
  }

  static String _put0Left(int number) => (number >= 10) ? '$number' : '0$number';

  //static DateTime _fixDateTime(DateTime dateTime) => dateTime.subtract(const Duration(hours: 3));
  
}
