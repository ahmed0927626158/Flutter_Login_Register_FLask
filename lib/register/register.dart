import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import '../Login/loginForm.dart';
import './sendUserData.dart';
class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {

  
  String status="";
  // FormScreenState(
      // {
      // required this.fname,
      // required this.lname,
      // required this.email,
      // required this.phone,
      // required this.driving_license_number,
      // }
      // );

  //create GlobalKey for the form
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  // input controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
   final fnameController = TextEditingController();
  final lnameController = TextEditingController();
   final licenseController = TextEditingController();
  
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register user")),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // First name texForm field
               _buildFname(),
                SizedBox(height: 10),

                // Last name
                _buildLname(),
                SizedBox(height: 10),
                // Email field
                _buildEmail(),
                SizedBox(height: 10),

                // phone
                _buildPhone(),
                SizedBox(
                  height: 10,
                ),
              _buildLicense(),
                SizedBox(height: 10),
                
                InkWell(
                  onTap: () async {
// if (_formKey.currentState!.validate()) {
//                       print("Success");
//                       fnameController.clear();
//                       lnameController.clear();
//                       emailController.clear();
//                       phoneController.clear();
//                       licenseController.clear();
                     
//                     }
                  print("Ahmed yimer from "+lnameController.text);
                  String fname=fnameController.text;
                  String lname=lnameController.text;
                  String driving_license_number=licenseController.text;
                  String email=emailController.text;
                  String phone=phoneController.text;
                  var data= await sendUserData(fname,lname,email,phone,driving_license_number);
                   var decode=jsonDecode(data);
                        setState((){
                         status = decode['output'];
                        });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.indigo),
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 3),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(
                          context
                          );
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            )),
      )),
    );
  }

  Widget _buildFname() {
    return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: fnameController,
                  decoration: InputDecoration(
                  labelText: "First name",
                  border: OutlineInputBorder(),
                    
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter first name";}},
                 
                );
  }


Widget _buildLname() {
    return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: "Last name",
                    border: OutlineInputBorder(),
                    
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter last name";
                    }
                  },
                 
                );
}



Widget _buildEmail() {
    return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    }
                  },
                  
                );
}

Widget _buildPhone() {
    return TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter phone";
                    }
                  },
                   
                );
}

Widget _buildLicense() {
    return TextFormField(
                  keyboardType: TextInputType.number,
                  controller: licenseController,
                  decoration: InputDecoration(
                    labelText: "Driving License number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter driving license number";
                    }
                  },
                   
                );
}

}
