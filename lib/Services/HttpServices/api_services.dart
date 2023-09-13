import 'package:http/http.dart' as http;

import '/utils.dart';

class ApiService {
  static Future<String> getMethod({required String url, Map<String, String>? bodyFields}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',

      /// TODO:ADD TOKEN
    };
    try {
      http.Request request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);
      if (bodyFields != null) request.bodyFields = bodyFields;
      var response = await request.send();
      if (response.statusCode == 200) {
        final res = await response.stream.bytesToString();

        logger.i(res);

        return res;
      } else {
        assert(true, "Status Code is not 200");

        throw Exception("Status Code is not 200");
      }
    } on Exception catch (e) {
      assert(false, "Status Code is not 200 $e");
      // logger.e(e);
      return "";
    }
  }

  static Future<String> postMethod({required String url, Map<String, String>? bodyFields}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',

      /// TODO:ADD TOKEN
    };
    try {
      http.Request request = http.Request('POST', Uri.parse(url));
      request.headers.addAll(headers);
      if (bodyFields != null) request.bodyFields = bodyFields;
      var response = await request.send();

      final res = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return res;
      } else {
        throw Exception("Status Code is not 200");
      }
    } on Exception catch (e) {
      logger.e(e);
      return "";
    }
  }

  static Future<String?> postMultiPartQuery(String url,
      {Map<String, String>? fields, Map<String, String>? files}) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-type": "application/json",

        /// TODO:ADD TOKEN
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));
      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value));
        });
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String resBody = await response.stream.bytesToString();

      logger.d(response.statusCode);
      if (response.statusCode == 200) {
        logger.i(resBody);
        return resBody;
      } else {
        logger.e(resBody);
        return null;
      }
    } catch (error) {
      logger.e('Error: ApiService -> postMultiPartQuery -> url = $url => $error');
      return null;
    }
  }
}
