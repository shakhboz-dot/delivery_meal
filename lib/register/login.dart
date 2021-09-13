import 'package:exam/home/home.dart';
import 'package:exam/service/allservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TabController? _controller;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKeySignIn = GlobalKey<FormState>();
  GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  TextEditingController _emailSignUpController = TextEditingController();
  TextEditingController _phoneSignUpController = TextEditingController();
  TextEditingController _passwordSignUpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 250.0,
        flexibleSpace: Center(
          child: Container(
            child: Image.asset(
              "assets/login/login.png",
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: TabBar(
                controller: _controller,
                indicatorPadding: EdgeInsets.only(left: 30.0, right: 30.0),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Sign-up",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, right: 35.0, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKeySignIn,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "You have to fill the email adress";
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Email adress",
                                    labelStyle: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "You have to fill the password";
                                    }
                                  },
                                  controller: _passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: false,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot passcode?"),
                            style: TextButton.styleFrom(primary: Colors.red),
                          ),
                          SizedBox(height: 80.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKeySignIn.currentState!.validate()) {
                                await AllService().signInWithEmail(
                                    _emailController.text,
                                    _passwordController.text);
                                await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false);
                              }
                            },
                            child: Text("Login"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 60.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, right: 35.0, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKeySignUp,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "You have to fill the email adress";
                                    }
                                  },
                                  controller: _emailSignUpController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Email adress",
                                    labelStyle: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                TextFormField(
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "You have to write your phone number";
                                    }
                                  },
                                  controller: _phoneSignUpController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                TextFormField(
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "You have to fill th password";
                                    }
                                  },
                                  controller: _passwordSignUpController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: false,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot passcode?"),
                            style: TextButton.styleFrom(primary: Colors.red),
                          ),
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKeySignUp.currentState!.validate()) {
                                await AllService().signUpWithEmail(
                                    _emailSignUpController.text,
                                    _passwordSignUpController.text,
                                    _phoneSignUpController.text);
                                await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => true);
                              }
                            },
                            child: Text("Register"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 60.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
