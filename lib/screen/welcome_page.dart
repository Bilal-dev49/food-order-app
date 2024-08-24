import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{

  Widget button({
    @required String ? name,
    Color? color,
    Color? textColor
  }){
    return Container(
      height: 55,
      width: 300,
      child: RaisedButton(
        child: Text(name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: textColor,
          ) ,
        ),
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
            borderRadius: BorderRadius.circular(30)
        ),
        onPressed: (){},
      ),
    );
  }
  @override
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Center(
                  child: Image.asset("images/logo.png"),

                ),
              ),
          ),
          Expanded(
            child: Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Welcome to Tastee ",
                  style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  ),
                  Column(
                    children: [
                      Text("Order your food by Tastee",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text("Make reservation in real-time",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                  button(
                    name: "Login to App",
                    textColor: Colors.white,
                    color: Colors.orange,
                  ),
                  button(
                      name: "SignUp",
                      textColor: Colors.orange,
                      color: Colors.white
                  ), //button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}