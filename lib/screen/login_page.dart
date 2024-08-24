import 'package:flutter/material.dart';
import 'package:food_order/screen/widget/my_text_field.dart';

class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Tastee",
          style:TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal
          ),
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.white,
          ),
          onPressed: (){},
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(right: 210),
                child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),

           Container(
             child:  Column(
               children: [
                 MyTextField(
                   controller: null,
                   hintText:"Username",
                   obscureText: false,
                   icon: Icons.person_outline,
                   iconColor: Colors.grey,
                 ),
                 SizedBox(height: 20,),
                 MyTextField(
                   controller: null,
                   hintText: "Password",
                   obscureText: true,
                   icon: Icons.lock_outline,
                   iconColor: Colors.grey,
                 ),
               ],
             ),
           ),

            Container(
              height: 50,
              width: 210,
              child: RaisedButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: (){},
                child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New User? ",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                  ),
                ),
                Text("Register Now",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}