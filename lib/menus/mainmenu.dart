import 'package:doctorapp/menus/addui.dart';
import 'package:doctorapp/menus/viewui.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.lightBlue,
        appBar: AppBar(backgroundColor:Colors.black,
          title: Center(
            child: Text("DOCTORS",style: TextStyle(
              color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
          ),

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(

                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        fixedSize: MaterialStateProperty.all(Size(250, 200)),
                        foregroundColor: MaterialStateProperty.all(Colors.blue),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.purple
                        ))
                      ),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUi()));
                        },
                        child: Text("View Doctors")),
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(

                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(double.infinity),
                        shape: MaterialStateProperty.all(CircleBorder()),
                        fixedSize: MaterialStateProperty.all(Size(250,200)),
                        foregroundColor: MaterialStateProperty.all(Colors.blue),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.purple
                        ))
                      ),
                        onPressed: (

                            ){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDoc()));
                        },
                        child: Text("Add Doctors")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
