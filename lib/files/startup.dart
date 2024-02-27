// To parse this JSON data, do
//
//     final doctors = doctorsFromJson(jsonString);

import 'dart:convert';

List<Doctors> doctorsFromJson(String str) => List<Doctors>.from(json.decode(str).map((x) => Doctors.fromJson(x)));

String doctorsToJson(List<Doctors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctors {
  String docName;
  String docQualification;
  String docIdProofNumber;
  String docSpecialisation;
  String docYearOfExp;

  Doctors({
    required this.docName,
    required this.docQualification,
    required this.docIdProofNumber,
    required this.docSpecialisation,
    required this.docYearOfExp,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
    docName: json["docName"],
    docQualification: json["docQualification"],
    docIdProofNumber: json["docIdProofNumber"],
    docSpecialisation: json["docSpecialisation"],
    docYearOfExp: json["docYearOfExp"],
  );

  Map<String, dynamic> toJson() => {
    "docName": docName,
    "docQualification": docQualification,
    "docIdProofNumber": docIdProofNumber,
    "docSpecialisation": docSpecialisation,
    "docYearOfExp": docYearOfExp,
  };
}
