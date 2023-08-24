import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_exchange/Widgets/show_progress.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class ApiService {
  static Future<String> getMethod({required String url, Map<String, String>? bodyFields}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    try {
      http.Request request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);
      if (bodyFields != null) request.bodyFields = bodyFields;
      var response = await request.send();
      stopProgress();
      if (response.statusCode == 200) {
        final res = await response.stream.bytesToString();

        logger.wtf(res);

        return res;
      } else {
        throw Exception("Status Code is not 200");
      }
    } on Exception catch (e) {
      stopProgress();
      logger.e(e);
      return "";
    }
  }

  static Future<http.Response?> postMethod(
      {required String url, Map? body, bool bypassStatusCode = false}) async {
    return await http.post(
      Uri.parse(url),
      body: body != null ? json.encode(body) : null,
      headers: <String, String>{
        "Accept": "application/json",
        "Content-type": "application/json",
        //TODO: ADD TOKEN
        // "Authorization": "Bearer ${authController.getUser()?.token}",
      },
    ).then((res) {
      logger
          .i('URL => $url\nResponse StatusCode => ${res.statusCode}\nResponse Body => ${res.body}');
      // AppConst.stopProgress();
      if (res.statusCode != 200 && res.statusCode != 201 && !bypassStatusCode) {
        exceptionAlert(res.body /*, isNeedResponse: isNeedResponse*/);
        // if (isNeedResponse) return _res;
        return null;
      }
      return res;
    }).onError((error, stackTrace) {
      debugPrint('Error in api call => $error\nUrl => $url');
      logger.e('stackTrace => $stackTrace');
      return null;
    });
  }

  static Future<String?> postMultiPartQuery(String url,
      {Map<String, String>? fields, Map<String, String>? files}) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-type": "application/json",
        // TODO:ADD TOKEN
        // "Authorization": "Bearer ${authController.getUser()?.token}",
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
        exceptionAlert(resBody);
        return null;
      }
    } catch (error) {
      logger.e('Error: ApiService -> postMultiPartQuery -> url = $url => $error');
      return null;
    }
  }

  static void exceptionAlert(String? resBody /*, {bool isNeedResponse = false}*/) {
    String alertDesc;
    try {
      alertDesc = json.decode('$resBody')['message'] +
          (json.decode('$resBody')['errors'] != null
              ? '\n${json.decode('$resBody')['errors']}'
              : null);
    } catch (e) {
      try {
        alertDesc =
            json.decode('$resBody')['message'] ?? json.decode('$resBody')['errors'].toString();
      } catch (e) {
        try {
          alertDesc = json.decode('$resBody').toString();
        } catch (err) {
          alertDesc = resBody.toString();
        }
      }
    }
  }
}
