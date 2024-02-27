import 'dart:convert';

import 'package:doctorapp/files/startup.dart';
import 'package:http/http.dart' as http;
class DoctorApiService{
  Future<List<Doctors>> getDoc() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://35.170.103.9:3008/doctors");
    var response=await client.get(apiUrl);
    if (response.statusCode==200){
      return doctorsFromJson(response.body);

    }else{
      return[];
    }
  }
 //add api
Future<dynamic> SendDoctorData(String docName,
    String docIdProofNumber,
    String docQualification,
    String docSpecialisation,
    String docYearOfExp) async{
    
    var client=http.Client();
    var apiUrl=Uri.parse("http://35.170.103.9:3008/addDoctors");
    final response=await client.post(apiUrl,
    headers: <String,String>{
      'Content-Type':'application/json;charset=utf-8'
    },
      body: jsonEncode(<String,String>{
        "docName": docName,
        "docQualification":docQualification,
        "docIdProofNumber":docIdProofNumber ,
        "docSpecialisation": docSpecialisation,
        "docYearOfExp":docYearOfExp
      })
    );
    if (response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw Exception("Failed to load data");
    }

}

}