enum AppFlavor { DEV, PROD }

class FlavorConfig {
  static late AppFlavor appFlavor;

  static void setEnvironment(String flavor) {
    switch (flavor) {
      case 'DEV':
        appFlavor = AppFlavor.DEV;
        break;
      case 'PROD':
        appFlavor = AppFlavor.PROD;
        break;
      default:
        throw Exception("Unknown flavor: $flavor");
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case AppFlavor.DEV:
        // return "http://localhost:8080";
        return "https://g18-api-dev.chotbatdongsan.com/api/v1";
      case AppFlavor.PROD:
        return "https://g18-api-dev.chotbatdongsan.com/api/v1";
      // return "https://restaurant-yz31.onrender.com";
    }
  }

  static String get captchaSiteKey {
    switch (appFlavor) {
      case AppFlavor.DEV:
        return "6Lf2NKYrAAAAAAIOn5T0JJl9FPtIs1I6pED5GhwE"; // Key cho DEV
      case AppFlavor.PROD:
        return "6Lf2NKYrAAAAAAIOn5T0JJl9FPtIs1I6pED5GhwE"; // Key cho PROD
    }
  }

  static bool get isDev => appFlavor == AppFlavor.DEV;
}
