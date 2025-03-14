class TimeHelpers {
  /// returns a [String] of more readable [duration]
  static String formatTime(Duration duration) {
    String formattedTime = '';

    if (duration.inHours > 0) {
      formattedTime += '${duration.inHours}hr ';
    }
    if (duration.inMinutes.remainder(60) > 0) {
      formattedTime += '${duration.inMinutes.remainder(60)}min ';
    }
    if (duration.inSeconds.remainder(60) > 0) {
      formattedTime += '${duration.inSeconds.remainder(60)}sec';
    }

    return formattedTime.trim();
  }
}
