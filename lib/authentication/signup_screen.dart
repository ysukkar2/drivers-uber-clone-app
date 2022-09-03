import 'package:drivers_app/authentication/car_info_screen.dart';
import 'package:drivers_app/authentication/login_screen.dart';
import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm(){
    if(nameTextEditingController.text.length < 3){
      Fluttertoast.showToast(msg: "name must be atleast 3 characters");
    }

  

    else if(!emailTextEditingController.text.contains("@")){

      Fluttertoast.showToast(msg: "Email address is not Valid");


    }


    
    else if(phoneTextEditingController.text.isEmpty){

      Fluttertoast.showToast(msg: "Phone number is required");


    }



    else if(passwordTextEditingController.text.length < 6){

      Fluttertoast.showToast(msg: "Password must be atleast 6 characters");


    }

    else{

      saveDriverInfoNow();
      
    }

    
    
  }

  saveDriverInfoNow() async{

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c){
          return ProgressDialog(message: 'Processing, Please Wait....',);

        }
      );
  final User? firebaseUser = (
    await fAuth.createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    ).catchError((mgs){
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error:" + mgs.toString());

    })
  ).user;

  if(firebaseUser != null){
    Map driverMap = {
        
        "id":firebaseUser.uid,
        "name":nameTextEditingController.text.trim(),
        "email":emailTextEditingController.text.trim(),
        "phone":phoneTextEditingController.text.trim(),
    
    };



    Fluttertoast.showToast(msg: "Account has been Created."
    
    
    );

    Navigator.push(context, MaterialPageRoute(builder: (c)=>CarInfoScreen()));
  
   DatabaseReference driversRef =  FirebaseDatabase.instance.ref().child("drivers");

   driversRef.child(firebaseUser.uid).set(driverMap);
   currentFirebaseUser = firebaseUser;

    // Fluttertoast.showToast(msg: "Account has been Created."
    
    
    // );
   //Navigator.push(context, MaterialPageRoute(builder: (c)=>CarInfoScreen()));
  }

  
    else{
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been Created");
    }  
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

             const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/logo1.png'),
              ),

              const SizedBox(
                height: 10,
              ),
             const Text('Register as a Driver'
              ,style: TextStyle(
                fontSize: 26,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              ),

              TextField(
                controller: nameTextEditingController,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
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
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
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
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Phone',
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
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
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

              SizedBox(height: 20,),

              ElevatedButton(

               onPressed: (){
                validateForm();

                
               },
               style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
               ),
               child: Text('Create Account',
               

               style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
               ) ,
               ),
              ),



              TextButton(
                child: Text(
                  "Do not have an account? register here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),


                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));

                },
              ),

            
            


            ],
          ),
        ),
      ),
    );
    
  }
}