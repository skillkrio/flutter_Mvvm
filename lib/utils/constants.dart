class Constants {
  static const String topHeadLineUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=86acb07a43db4b51a693551e0cce0d18";

  static String headlineFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=86acb07a43db4b51a693551e0cce0d18";
  }
}
