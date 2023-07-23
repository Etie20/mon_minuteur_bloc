class SecondsTicker {
  const SecondsTicker();
  static const second = Duration(seconds: 1);

  Stream<int> tick({required int ticks}) => Stream
      .periodic(second, (i) => ticks - i - 1)
      .take(ticks);

}