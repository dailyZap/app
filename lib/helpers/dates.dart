String formatTime(DateTime time) {
  return "${time.hour}:${time.minute}:${time.second}";
}

String formatLate(int milliseconds) {
  int seconds = milliseconds ~/ 1000;
  if (seconds < 60) {
    return "${seconds}s late";
  }
  int minutes = seconds ~/ 60;
  if (minutes < 60) {
    return "${minutes}m late";
  }
  int hours = minutes ~/ 60;
  if (hours < 24) {
    return "${hours}h late";
  }
  int days = hours ~/ 24;
  return "${days}d late";
}
