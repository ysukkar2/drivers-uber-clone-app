import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  //const ProgressDialog({Key? key}) : super(key: key);
  String? message;
  ProgressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(width: 6,),
              CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(width: 26,),
              Text(
                message!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
            
          ),
        ),
      ),

    );
    
  }
}