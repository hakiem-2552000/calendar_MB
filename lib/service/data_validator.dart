class DataValidator {
  static bool isSameDay(DateTime first, DateTime second) {
    if (first.year == second.year &&
        first.month == second.month &&
        first.day == second.day) {
      return true;
    }
    return false;
  }
}
