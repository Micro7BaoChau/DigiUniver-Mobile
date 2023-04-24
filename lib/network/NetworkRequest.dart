import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:dgu/Models/Career_Manage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest{
  static const String url="https://digiuniver.pockethost.io/api/collections/careers/records";

  static Future<CareerManage>fetchCareerManage() async{
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      // return compute(parseCareerManage,response.body) ;
      return CareerManage.fromJson(jsonDecode(response.body));
    }else if(response.statusCode==404){
      throw Exception('Not Found');
    }
    else{
      throw Exception('Failed to load List Career');
    }
  }
}