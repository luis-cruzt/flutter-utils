import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

showAlertDialog({BuildContext context,String message, String text, String messageText, String type, GlobalKey scaffolKey}){

    Color typeColor;

    if (type == 'success') {
      typeColor = Color.fromRGBO(168, 227, 138, 1);
    } else if (type == 'error'){
      typeColor = Color.fromRGBO(243, 129, 129, 1);
    } else if (type == 'warning'){
      typeColor = Color.fromRGBO(252, 227, 138, 1);
    } else {
      typeColor = Color.fromRGBO(252, 227, 138, 1);
    }

    return Flushbar(
      backgroundColor: typeColor,
      message: message,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 5),
      borderRadius: 20,
      margin: EdgeInsets.all(20),
      titleText: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: Color.fromRGBO(32, 69, 117, 1),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      messageText: Container(
        alignment: Alignment.center,
        child: Text(
          messageText,
          style: TextStyle(
              color: Color.fromRGBO(32, 69, 117, 1),
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ),
    )..show(scaffolKey.currentContext)
    .catchError((err){
      print('Flushbar error: $err');
    });    
  }
