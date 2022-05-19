import 'dart:convert';

import "package:flutter/material.dart";


import "articles.dart";
import 'search.dart';
import "menu.dart";
import "package:http/http.dart" as http;
import "../../elements/data.dart";


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Listview variable
   List<String> names = [];
   List<String> dobs = [];
   List<String> pictures = [];

   List<String> listviewfilepath = [
     "assets/images/Technology.png",
     "assets/images/listview2.png"
   ];
    List<String> listviewtitle = [
      "Technology",
      "Adventure"
    ];

    // animations variable

  // Read Api variable
  Future<void> readApi() async {
    var response = await http.get(Uri.parse("https://randomuser.me/api/"));
    var jsondata = jsonDecode(response.body);

    var data = jsondata["results"];

    for (var i=0; i<data.length; ++i) {
      if (names.length != 20) {
        names.add(data[i]["name"]["first"] +" " +  data[i]["name"]["last"]);
        dobs.add(data[i]["dob"]["age"].toString());
        pictures.add(data[i]["picture"]["medium"].toString());
      } else {
        break;
      }

      
    }


    
  }

  double _listviewwidth = 68;
  double _listviewheight = 68;
  @override
  Widget build(BuildContext context) {
    print(names.length);
    print(dobs.length);
    print(pictures.length);
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Articles())
          );
        },
        child: Image.asset('assets/images/plus.png'),
        backgroundColor: Color.fromRGBO(55, 106, 237, 1)
,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
      color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Image.asset('assets/images/home.png'), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home())
              );
            }),
            IconButton(icon: Image.asset('assets/images/articles.png'), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Articles())
              );
            }),
            IconButton(icon: Image.asset('assets/images/search.png'), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search())
              );
            }),
            IconButton(icon: Image.asset('assets/images/menu.png'), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu())
              );
            })
          ]
        )

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        
          
          
          
          
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            
                            child: Text("Hi, Jonathan",textAlign: TextAlign.center, style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1))
                          )),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Explore today’s", style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900))
                          )
                        ]
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),

                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/notification.png')
                      )
                    )
                  ]
                )
              ),
              Container(
                height:100,
                margin: EdgeInsets.only(top: 40),
                child: FutureBuilder(
                  future: readApi(),
                  builder: (context,  snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: names.length,
                        
                        itemBuilder: (context, i) {
                          return Container(child: Column(
                            children: [
                              Container(
                            width: 68,
                            height: 68,
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(55, 106, 237, 1),
                                  Color.fromRGBO(73, 176, 226, 1),
                                  Color.fromRGBO(156, 236, 251, 1),

                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            ),
                            child: Image.network(pictures[i], width: 54, height: 54)
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            
                            child: Center(child: Text(names[i], style: TextStyle(fontFamily: "Avenir", fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(45, 67, 121, 1))))
                          )]));}

                      


                      );

                    } else   {
                      return CircularProgressIndicator();
                    }
                  }
                  
  
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 244,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, i) {
                    return Container(
                      height: 244,
                      width: 273,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 200,
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(40, 40)
                          ),
                          
                          
                        ],
                        image: DecorationImage(
                          image: AssetImage(
                            listviewfilepath[i]
                          )
                        )
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(bottom: 20, left: 40, ),
                        child: Text(listviewtitle[i], style: TextStyle(fontFamily: "Avenir", fontSize: 19, fontWeight: FontWeight.w900, color: Colors.white))
                      )
                    );
                  }
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Lastest News", style: TextStyle(fontFamily: "Avenir", fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black))
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text("More", style: TextStyle(fontFamily: "Avenir",fontSize: 14, color: Color.fromRGBO(55, 106, 237, 1), fontWeight:FontWeight.w500))
                    )
                  ]
                )
              ),
              SizedBox(
                
                
                child: Column(
                  children: List.generate(2, (index) {
                    return Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 30),
                      width: 295,
                      height: 141,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(20, 20)
                          ),
                          BoxShadow(
                            blurRadius: 40,
                            color: Colors.white,
                            offset: Offset(-20, -20)
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 92,
                            height: 141,
                            

                            
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bigdata.png')
                              )
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25, top: 40),
                            child: Column(
                              
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("BIG DATA", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w900, color: Color.fromRGBO(55, 106, 237, 1)))
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 163,
                                  height: 40,
                                  child: Text("Why Big Data Needs Thick Data?", style: TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black))
                                ),
                              ]
                            )
                          )
                        ]
                      )
            
                    );
                  })
                )
              )
              
              
            ]
          )
        ))
      
    ;
  }
}