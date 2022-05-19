import "package:flutter/material.dart";
import "articles.dart";
import 'search.dart';
import "menu.dart";
import "home.dart";


class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  List<Widget> pages = [
    Home(),
    Articles(),
    Search(),
    Menu(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(55, 106, 237, 1),
        child: Image.asset('assets/images/plus.png')
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
    );
  }
}