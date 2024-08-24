import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/screen/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  bool loading = false;
  UserCredential ? userCredential;
  RegExp regExp = RegExp( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential?.user?.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential?.user?.uid,
        "password": password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("The account already exists for that email"),
          ),
        );
      }
    } catch (e) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(e as String),
        ),
      );
      setState(() {
         loading=false;
      });
    }
    setState(() {
        loading=false;
    });
  }

  void validation(){
    if(firstName.text.trim().isEmpty||firstName.text.trim() == null){
      globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("First Name is empty",
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
      );
      return;
    }
    if(lastName.text.trim().isEmpty||lastName.text.trim() == null){
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Last Name is empty",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      return;
    }
    if(email.text.trim().isEmpty||email.text.trim() == null){
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Email is empty",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)){
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Please enter a valid email",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      return;
    }
    if(password.text.trim().isEmpty||password.text.trim() == null){
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Password is empty",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      return;
    }
    else {
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  Widget button({@required String ? buttonName,
    @required Color ? color,
    @required Color ? textColor,
    @required  VoidCallback ? ontap}){

    return Container(
      height: 45,
      width: 140,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          buttonName!,
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
        ),
        onPressed:  ontap,
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: firstName,
                      obscureText: false,
                      icon: Icons.person_outline,
                      iconColor: Colors.grey,
                      hintText:"First Name",
                    ),
                    MyTextField(
                        controller: lastName,
                        obscureText: false,
                        icon: Icons.person_outline,
                        iconColor: Colors.grey,
                        hintText:"Last Name",
                    ),
                    MyTextField(
                        controller: email,
                        obscureText: false,
                        icon: Icons.mail_outlined,
                        iconColor: Colors.grey,
                        hintText:"Email",
                    ),
                    MyTextField(
                        controller: password,
                        obscureText: true,
                        icon: Icons.lock_outline,
                        iconColor: Colors.grey,
                        hintText:"Password",

                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ) :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    buttonName: "Cencel",
                    color: Colors.grey,
                    textColor: Colors.black,
                    ontap: (){},
                  ),
                  SizedBox(width: 15,),
                  button(
                    buttonName: "Register",
                    color: Colors.orange,
                    textColor: Colors.white,
                    ontap: (){
                      validation();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}