enum LottiePath { loading }

extension LottiePathExtension on LottiePath {
  String toPath() {
    return 'assets/Lottie/lottie_$name.json';
  }
}
