import 'dart:convert';

class NetworkFunctions {
  static String encodeUrl(dynamic data) {
    var str = [];
    var altStr = [];
    data.forEach((key, value) {
      str.add(
          '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(jsonEncode(value))}');
      altStr.add(
          '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value)}');
    });

    var altUrlData = altStr.join("&");
    return (altUrlData);
  }

  static String urlEncodeMap(Map<String, dynamic> map) {
    List<String> encodedPairs = [];
    map.forEach((key, value) {
      if (value != null) {
        if (value is String) {
          encodedPairs
              .add('${Uri.encodeComponent(key)}=${Uri.encodeFull(value)}');
        } else {
          encodedPairs.add(
              '${Uri.encodeComponent(key)}=${Uri.encodeFull(value.toString())}');
        }
      }
    });
    return encodedPairs.join('&');
  }
}
