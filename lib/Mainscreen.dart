import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
import "screens/login.dart";



class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(217, 223, 235, 1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Image.asset("assets/images/blogwelcome.png")
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 25),
                    alignment: Alignment.centerLeft,
                    width: 275,
                    height: 64,
                    child: Text("Read the article you want instantly", style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900))
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10, left: 30),
                    width: 295,
                    height: 66,
                    child: Text("You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1)))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Image.asset('assets/images/dots.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login()
                              )
                            );

                          },
                          child: Container(
                          margin: EdgeInsets.only(right: 25),
                          width: 88,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromRGBO(55, 106, 237, 1),
                          ),
                          child: Center(
                            child: Image.asset('assets/images/arrowright.png')
                          )
                        ))
                      ]
                    )
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