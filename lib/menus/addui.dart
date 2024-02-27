import 'package:doctorapp/service/postservice.dart';
import 'package:flutter/material.dart';
class AddDoc extends StatefulWidget {
  const AddDoc({super.key});

  @override
  State<AddDoc> createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  TextEditingController doctorname=TextEditingController();
  TextEditingController doctorqualification=TextEditingController();
  TextEditingController doctorid=TextEditingController();
  TextEditingController doctorspecialisation=TextEditingController();
  TextEditingController doctoryearofexp=TextEditingController();
  var getDoctorName="",getDoctorQualification="",getDoctorId="",getDoctorSpecialisation="",getDoctorYearOfExperience="";
  void submitdoctordata() async{
    try{
      getDoctorName=doctorname.text;
      getDoctorQualification=doctorqualification.text;
      getDoctorId=doctorid.text;
      getDoctorSpecialisation=doctorspecialisation.text;
      getDoctorYearOfExperience=doctoryearofexp.text;
      print(getDoctorName);
      print(getDoctorQualification);
      print(getDoctorId);
      print(getDoctorSpecialisation);
      print(getDoctorYearOfExperience);
      final result=await DoctorApiService().SendDoctorData(getDoctorName,getDoctorId,getDoctorQualification,getDoctorSpecialisation,getDoctorYearOfExperience);
    if(result["status"]=="success"){
      print("Successfully added");
    }else{
      print("Error occured");
    }
    }
    catch(error){
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(backgroundColor: Colors.white,
       body: Padding(
         padding: const EdgeInsets.all(100.0),
         child: Container(
           child: Column(
             children: [
               Text("DOCTORS DETAILS",style: TextStyle(fontSize: 40,color: Colors.lightBlue,fontWeight: FontWeight.w900),),
               SizedBox(height: 50,),
               TextField(
                 controller: doctorname,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Doctor_Name"
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 controller: doctorqualification,
                 decoration: InputDecoration(
                   border:OutlineInputBorder(),
                   labelText:"Doctor_Qualification"
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 controller: doctorid,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Doctor_Id"
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 controller: doctorspecialisation,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Doctor_Specialisation"
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 controller: doctoryearofexp,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.black
                     )

                   ),
                   labelText: "Doctor_Yearofexp"
                 ),
               ),
               SizedBox(height: 30,),
               ElevatedButton(onPressed: submitdoctordata,
                   child: Text("Submit",style: TextStyle(color: Colors.lightBlue),)),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){
                 Navigator.pop(context);
               }, child: Text("Back <-",style: TextStyle(color: Colors.lightBlue),))
             ],
           ),
         ),
       ),

     ),
    );
  }
}
