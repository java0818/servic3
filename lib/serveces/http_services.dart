
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:servic3/model/emp_model.dart';

import '../model/emplist_model.dart';
import '../model/user_model.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";
  static Map<String,String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String API_LIST = '/api/v1/employees';
  static String API_ONE  = '/api/v1/employees/'; //{id}
  static String API_CREATE = '/api/v1/employees';
  static String API_UPDATE = '/api/v1/employees/'; //{id}
  static String API_DELETE = '/api/v1/employees/'; //{id}

static Future<String? > GET(String api, Map<String,String> params) async{
  print(api);
  var uri = Uri.http(BASE,api,params);
  var response = await get(uri, headers:headers);
  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

  static Future<String? > POST(String api, Map<String,String> params) async{
    print(api);
    var uri = Uri.http(BASE,api,params);
    var response = await post(uri, headers:headers,body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  static Future<String? > PUT(String api, Map<String,String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await put(uri, headers:headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String? > DELETE(String api, Map<String,String> params) async{
    var uri = Uri.http(BASE,api,params);
    var response = await delete(uri, headers:headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String,String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String,String> params = {};
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  /* Http PARSING */
  static EmpList parseEmpList(String response){
    dynamic json = jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }
}

