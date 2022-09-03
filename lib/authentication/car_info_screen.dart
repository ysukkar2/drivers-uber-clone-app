import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List<String> carTypesList = ["uber-x","uber-go","bike"];
  String? selectedCarType;
  

  saveCarInfo(){


    Map driverCarInfoMap = {
        
        "car_color": carColorTextEditingController.text.trim(),
        "car_number":carNumberTextEditingController.text.trim(),
        "car_model":carModelTextEditingController.text.trim(),
        "type": selectedCarType,




        




        
    };
    
    Fluttertoast.showToast(msg: "Car Details has been saved .. Congrulations");
    Navigator.push(context, MaterialPageRoute(builder: (c)=>MySplashScreen()));


    DatabaseReference driversRef =  FirebaseDatabase.instance.ref().child("drivers");

   driversRef.child(currentFirebaseUser!.uid).child("car_details") .set(driverCarInfoMap);

   
    //Fluttertoast.showToast(msg: "Car Details has been saved .. Congrulations");
    //Navigator.push(context, MaterialPageRoute(builder: (c)=>MySplashScreen()));

    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 24,),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/logo1.png'),
                ),

                const SizedBox(
                  height: 10,
                ),
               const Text('Write Car Details'
                ,style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                ),






                TextField(
                  controller: carModelTextEditingController,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Car Model',
                    hintText: 'Car Model',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,

                      ),
                    ),


                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        
                      ),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: 

                    TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),


                  ),


                ),



                TextField(
                  controller: carNumberTextEditingController,
                  
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Car Number',
                    hintText: 'Car Number',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,

                      ),
                    ),


                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        
                      ),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: 

                    TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),


                  ),


                ),
              


              TextField(
                  controller: carColorTextEditingController,
                  
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Car Color',
                    hintText: 'Car Color',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,

                      ),
                    ),


                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        
                      ),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: 

                    TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),


                  ),


                ),
                SizedBox(height: 10),

                DropdownButton(
                  iconSize: 20,
                  
                  dropdownColor: Colors.black,
                   hint: Text(
                    'Please choose car type',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,

                    ),
                   ),

                   value: selectedCarType,
                   onChanged: (newValue){
                    setState(() {
                      selectedCarType = newValue.toString();
                    });
                   },
                   items: carTypesList.map((car){
                    return DropdownMenuItem(
                      child: Text(
                        car,
                        style: TextStyle(
                          color: Colors.grey,
                        ),


                      ),
                      value: car,

                    );

                   }).toList(),
                ),


                SizedBox(height: 20,),

              ElevatedButton(
                

              onPressed: (){
                

                if(carColorTextEditingController.text.isNotEmpty&& 
                carNumberTextEditingController.text.isNotEmpty
                 &&carModelTextEditingController.text.isNotEmpty
                &&selectedCarType!=null
                );
                 
                {
                  saveCarInfo();

                }
                 

                
               },
               style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
               ),
               
               child: Text('Save Now',

               style: TextStyle(
                color:Colors.black54,
                fontSize: 18,
               ) ,
               ),
              ),
            

            ],
          ),
        ),
      ),
    );
    
  }
}