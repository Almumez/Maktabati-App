import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:lottie/lottie.dart';
import 'package:maktabati2/const/ErrornInternt.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);




  @override
  State<Loading> createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:


        Dialog(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Lottie.asset("assets/Loding.json",width: 150,),
              SizedBox(height: 50,),
              Text(" ..........  يرجئ الانتظار " ,style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ],
          ),
        ) ,

      ),
    );
  }

  Widget loading (){

    return Center(
      child:


      Dialog(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Lottie.asset("assets/Loding.json",width: 150,),
            SizedBox(height: 50,),
            Text(" ..........  يرجئ الانتظار " ,style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
          ],
        ),
      ) ,

    );
  }
}



