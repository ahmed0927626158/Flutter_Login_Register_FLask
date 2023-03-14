import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "./fetchAuth.dart";
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _phone = "";
  String status = "";
  // FormScreenState(
  //     {
  //     required this.name,
  //     required this.email,
  //     required this.phone,
  //     required this.password});

  //create GlobalKey for the form
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return   TextFormField(
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
      onSaved: (newValue) {
        _email = newValue.toString();
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                  },
                );
  }

  // Widget _buildPassword() {
  //   return Tab();
  // }

  Widget _buildPhone() {
    return Tab();
  }

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/login.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text(status)),
               _buildEmail(),
                SizedBox(height: 20),
                _buildPassword(),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      print("Success");
                      emailController.clear();
                      passController.clear();
                    }

                  var data= await fetchUser("ahmed@gmail.com", "12345");

                   var decode=jsonDecode(data);
                        setState((){
                         status = decode['output'];

                        });
                   
                    // try {
                    //   http.Response response = await http
                    //       .get(Uri.parse("http://127.0.0.1:5000/members"));
                    //   print(response);
                    //   print(response.body);
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.indigo),
                    child: Center(
                        child: Text(
                      "Log In",
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
                      "Already have an account?",
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,MaterialPageRoute(builder: (context)=>RegisterScreen()
                          ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            )),
      )),
    );
  }
}
