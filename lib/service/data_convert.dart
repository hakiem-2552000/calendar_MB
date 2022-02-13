class DataConvert {
  static String getNameOfMonth(DateTime date) {
    final List months = [
      'Jan',
      'Feb',
      'Mar',
      'April',
      'May',
      'Jun',
      'July',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = date.month;
    print(month);
    return months[month - 1];
  }
}
