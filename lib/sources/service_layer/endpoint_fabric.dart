class EndPointFabric {
  String getNewsURL() {
    final String protocol = "https://";
    final String baseUrl = "app.ferfit.club/api/";
    final String params =
        "feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994";
    final String url = protocol + baseUrl + params;
    return url;
  }

  String getTokenURL() {
    final String protocol = "https://";
    final String baseUrl = "app.ferfit.club/api/auth/refresh-tokens";
    final String params = "";
    final String url = protocol + baseUrl + params;
    return url;
  }
}
