import 'dart:convert';

import 'package:custom_cubit_application/Model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    //data response check

    try{
      if(response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}
