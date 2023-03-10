import 'package:flutter/material.dart';
void main() {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
home:SafeArea (child:MyForm(),
),
debugShowCheckedModeBanner: false,
);
}
}
class MyForm extends StatelessWidget {
final _key = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
title: Text('Login Form'),
),
body: Container(
padding: EdgeInsets.all(32),
child: Form(
key: _key,
child: Column(mainAxisAlignment:MainAxisAlignment.center,
children: [
TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',icon: Icon(Icons.verified_user)),
validator: (text) {
 if (text!.isEmpty) {
 return 'Enter the email.';
}
 final regex = RegExp('[^@]+@[^\.]+\..+');
 if (!regex.hasMatch(text)) {
 return 'Enter a valid email';
}
 return null;
},
),
TextFormField(
  style: TextStyle(),
                            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',icon: Icon(Icons.enhanced_encryption)),
validator:(value){
               if (value!.isEmpty) {
return "Password cannot be empty";
} 
final regex=RegExp('[!@#&*(),.?":{}|<>]');
if(!regex.hasMatch(value)){
  return 'Should contain a Special Character';
}
 if (value.length <= 8) {
return "Password should be greater than 8";
} 
else {
return null;
}
}
),
ElevatedButton(
  style:ElevatedButton.styleFrom( shadowColor: Colors.blueAccent, elevation: 30) ,
onPressed: () {
if (_key.currentState!.validate()) {
  print("Your data is submitted");
}
},
child:Text("Login")
),
],
),
),
),
);
}
} 