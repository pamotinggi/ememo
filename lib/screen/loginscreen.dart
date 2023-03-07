import 'package:ememo/screen/adminlogin.dart';
import 'package:ememo/screen/hodlogin.dart';
import 'package:ememo/screen/homepage.dart';
import 'package:ememo/screen/registerscreen.dart';
import 'package:ememo/screen/staffhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 29, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffFFE9B1),
      child: MaterialButton(
        onPressed: () {
          signin(emailController.text, passwordController.text);
        },
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/memologo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    emailfield,
                    SizedBox(
                      height: 15,
                    ),
                    passwordField,
                    SizedBox(
                      height: 15,
                    ),
                    loginButton,
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegisterScreen()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("---->"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HodLogin()));
                          },
                          child: Text(
                            "Hod Login",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("------>"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AdminLogin()));
                          },
                          child: Text(
                            "Admin login",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signin(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StaffHome())),
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
