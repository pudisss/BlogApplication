import 'package:blogapp/screens/home/home.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
import '../elements/Authentication.dart';
import 'home/homeNavigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool press = true;
  bool press2 = false;
  int loginpage = 0;

  List<Widget> loginpages = [
    Loginpage(),
    Signuppage(),

  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        color: Color.fromRGBO(217, 223, 235, 1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),

              child: Image.asset('assets/images/logosmall.png')
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Color.fromRGBO(55, 106, 237, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              press = !press;
                              press2 = !press;
                              loginpage = 0;
                            
                            });
                          },
                          child: Opacity(
                            opacity: press ? 1: 0.3,
                            child: Text("Login", style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900))

                          )
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              press2 = !press2;
                              press = !press2;
                              loginpage = 1;
                              
                              
                            });
                          },
                          child: Opacity(
                            opacity: press2 ? 1: 0.3,
                            child: Text("Sing up", style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900))
                          )
                        )
                      ]
                    )
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    ),
                    child: loginpages[loginpage],
                  )
                ]
              )

            )
          ]
        )
      )
    );
  }

  
}

// Optional login page
class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  Future<void> signin() async {
    await Authentification.singInWithGoogle();
    HomeNavigation();


  }

  // Login textfield controller

  final loginemail = TextEditingController();
  final loginpassword = TextEditingController();

  int loginerror = 0;
  bool errorlogin = false;
  List<String> texterror = [
    "Please the information at the top",
    "Your password must be 8 characters of length up",
  ];
  // Login function
 
 
  Future<void> Checklogin() async{
    if (loginemail.text.isNotEmpty && loginpassword.text.isNotEmpty) {
      // Check password and email
      if (loginpassword.text.length >= 8) {

        await Database.login(email: loginemail.text, password: loginpassword.text);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home()
          )
        );
         
      } else {
        setState(() {
          errorlogin = true;
          loginerror = 1;
        });
      }


    } else {
      setState(() {
        errorlogin = true;
        loginerror = 0;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25, top: 40),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome Back", style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900))
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Sign in to your account', style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1)))
                )
              ]
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 50),
                  child: Text("Username", style: TextStyle(fontFamily: "Avenir", fontSize: 14, color: Color.fromRGBO(45, 67, 121, 1), fontWeight: FontWeight.w400)
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 295,
                    child: TextField(
                      controller: loginemail,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                        border: UnderlineInputBorder(),

                      )
                    )
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30),
                  child: Text("Password", style: TextStyle(fontFamily: "Avenir", fontSize: 14, color: Color.fromRGBO(45, 67, 121, 1), fontWeight: FontWeight.w400))
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 295,


                    child: TextField(
                      controller: loginpassword,
                      decoration: InputDecoration(
                        suffixText: "Show",
                        suffixStyle: TextStyle(fontFamily: "Avenir", fontSize: 14, color: Color.fromRGBO(55, 106, 237, 1), fontWeight: FontWeight.w500),
            
                        hintText: "Enter your password",
                        hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                        border: UnderlineInputBorder()
                      )
                    )
                  )
                )

              ]
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10, left: 25),
            child: Visibility(
            visible: errorlogin,
            child: Text(texterror[loginerror], style: TextStyle(fontFamily: "Avenir", fontSize: 16, color: Colors.red, fontWeight: FontWeight.w500))
          )),
          
          GestureDetector(
            onTap: Checklogin,
            child: GestureDetector (
              
               child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 295,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(55, 106, 237, 1),
            ),
            child: Center(child: Text("LOGIN", style: TextStyle(fontFamily: "Avenir", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w900)))
          ))),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Forgot your password? ",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1))
                  ),
                  TextSpan(
                    text: "Reset here",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w500, color: Color.fromRGBO(55, 106, 237, 1))
                  )
                ]
              )
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image.asset('assets/images/orsigninwith.png')
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: signin,
                  child: Image.asset('assets/images/Googleicon.png')
                ),
                GestureDetector(
                  child: Image.asset('assets/images/Facebook.png')
                ),
                GestureDetector(
                  child: Image.asset('assets/images/twitter.png')
                )
              ]
            )
          )
        ]
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginemail.dispose();
    loginpassword.dispose();
  }
}

// Optional signup page

class Signuppage extends StatefulWidget {
  Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  List<String> signinoption = [
    "assets/images/Googleicon.png",
    "assets/images/Facebook.png",
    "assets/images/twitter.png"
  ];

  // Textfield controller
  final signupuser = TextEditingController();
  final signupemail = TextEditingController();
  final signuppassword = TextEditingController();

  int errorindex = 0;
  bool error = false;
  List<String> typeserror = [
    "Please enter the information at the top",
    "The password or the email is too short",

  ];

  Future<void> CheckSignup() async{
    if (signupuser.text.isNotEmpty && signupemail.text.isNotEmpty) {
      if (signupuser.text.length >= 8 && signuppassword.text.length >= 8) {
        await Database.signup(username: signupuser.text, email: signupemail.text, password: signuppassword.text);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home()
          )
        );

      } else {
        setState(() {
        errorindex = 1;
        error = true;
        });

      }

    } else {
      setState(() {
        errorindex = 0;
        error = true;

        
      });

    }
  }
  Future<void> signin() async {
    await Authentification.singInWithGoogle();

    HomeNavigation();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 40, left: 25),
            child: Text("Get started", style: TextStyle(fontFamily: "Avenir", fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black))
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10, left: 25),
            child: Text('Create your account to get started', style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1)
))
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 40, left: 25),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Username", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1)))
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 285,
                    child: TextField(
                      controller: signupuser,
                      decoration: InputDecoration(
                        hintText: "Enter your Username",
                        hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),

                        border: UnderlineInputBorder()
                      )
                    )
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: Text("Email", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1)))
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 285,
                    child: TextField(
                      controller: signupemail,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                        border: UnderlineInputBorder()
                      )
                    )
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Text("Password", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w500, color: Color.fromRGBO(45, 67, 121, 1)))  
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 285,
                    child: TextField(
                      controller: signuppassword,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)
                      )

                    )
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    child: Text("Already have an account", style: TextStyle(fontFamily: "Avenir", fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.3)))
                  )
                ),
                GestureDetector(
                  onTap: CheckSignup,
                  child: Container(
                  margin: EdgeInsets.only(top: 30, right: 20),
                  width: 295,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(55, 106, 237, 1),

                  ),
                  child: Center(child: Text("SIGNUP", style: TextStyle(fontFamily: "Avenir", fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500)))
                )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(signinoption.length, (index) {
                      return Container(
                        child: GestureDetector(
                          child: Image.asset(signinoption[index])
                        )
                      );
                    })
                  )
                )
              ]
            )
          )

        ]
      )
    );
  }
}
