import "package:flutter/material.dart";
import "search.dart";
import "menu.dart";
import "home.dart";
import "package:firebase_database/firebase_database.dart";
import "../../elements/data.dart";


class Articles extends StatefulWidget {
  Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}


class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(55, 106, 237, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset('assets/images/good.png')
            ),
            Container(
              child: Text("2.1K", style: TextStyle(fontFamily: "Avenir", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500))
            )

          ]
        )
      ),
      
      appBar: AppBar(leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            child: Image.asset("assets/images/3dots.png", color: Colors.black)
          )
        ]
        ),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        
        
        
       
          child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 303,
              height: 66,
              child: Text("Four Things Every Woman Needs To Know", style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900, ))
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset("assets/images/profile.png")

                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text("Richard Gervin", style: TextStyle(fontFamily: "Avenir", fontSize: 14, color: Color.fromRGBO(45, 67, 121, 1), fontWeight: FontWeight.w500))
                        ),
                        Container(
                          child: Text("2m ago", style: TextStyle(fontFamily: "Avenir", fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(123, 139, 178, 1)))
                        )
                      ]
                    )
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('assets/images/share.png'),
                        ),
                        
                        Container(
                          child: Image.asset('assets/images/pin.png')
                        )
                      ]
                    )
                  )
                ]
              )
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.3),
                    
                  )
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Container(
                    child:  Image.asset('assets/images/articleprofile.png')
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Text("A man’s sexuality is never your mind responsibility.", style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.black, fontWeight:FontWeight.w900))
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only( left: 10),
                    width: 295,
                    height: 280,
                    child: Text("This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.", style: TextStyle(fontFamily: "Avenir", fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400))
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