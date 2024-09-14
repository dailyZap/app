double map(
    double fromMin, double fromMax, double toMin, double toMax, double value) {
  return toMin + (toMax - toMin) * ((value - fromMin) / (fromMax - fromMin));
}
