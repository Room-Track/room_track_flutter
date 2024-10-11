class AppFonts {
  static double small = 12.0;
  static double medium = 16.0;
  static double large = 20.0;
  static double extraLage = 24.0;

  static Map<String, double> smallScheme = <String, double>{
    'label': small,
    'text': medium,
    'title': large,
    'display': extraLage,
  };
  static Map<String, double> mediumScheme = <String, double>{
    'label': small,
    'text': medium,
    'title': large,
    'display': extraLage,
  };
  static Map<String, double> largeScheme = <String, double>{
    'label': small,
    'text': medium,
    'title': large,
    'display': extraLage,
  };
  static Map<String, double> extraLargeScheme = <String, double>{
    'label': small,
    'text': medium,
    'title': large,
    'display': extraLage,
  };
  static Map<String, Map<String, double>> schemes =
      <String, Map<String, double>>{
    'Small': smallScheme,
    'Medium': mediumScheme,
    'Large': largeScheme,
    'Extra Large': extraLargeScheme,
  };
}
