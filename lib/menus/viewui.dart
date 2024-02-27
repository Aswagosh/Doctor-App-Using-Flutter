import 'package:doctorapp/files/startup.dart';
import 'package:doctorapp/service/postservice.dart';
import 'package:flutter/material.dart';

class ViewUi extends StatefulWidget {
  const ViewUi({super.key});

  @override
  State<ViewUi> createState() => _ViewUiState();
}

class _ViewUiState extends State<ViewUi> {
  Future<List<Doctors>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=DoctorApiService().getDoc();
  }
  Widget build(BuildContext context) {
    return Scaffold(

        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData  && snapshot.data!.isNotEmpty){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index){
                      return Card(
                        child:  Column(
                          children: [
                            ListTile(
                              title: Center(
                                child: Text(" Doctor Name   : "+snapshot.data![index].docName,style: TextStyle(
                                  fontSize: 30
                                ),),
                              ),
                              subtitle: Text(" Id proof   : "+snapshot.data![index].docIdProofNumber+
                                  "\n"+" Qualification    : "+snapshot.data![index].docQualification+
                                  "\n"+" Specialization   : "+snapshot.data![index].docSpecialisation+
                                  "\n"+" Year of Experience   : "+snapshot.data![index].docYearOfExp),


                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                            )
                          ],
                        ) ,
                      );
                    });

              }
              else{
                return Text("Loading....");
              }
            })
    );
  }
}



