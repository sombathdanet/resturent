extension StringEx on String {
  String toMyFeature() {
    return toUpperCase() + this;
  }

  String toMyLove() {
    return "${this}Love";
  }
}

extension IntEx on int {
  String toMyString() {
    return "$this....";
  }
}
