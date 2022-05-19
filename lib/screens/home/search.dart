import "package:flutter/material.dart";
import 'home.dart';
import 'articles.dart';
import "menu.dart";



class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _ArticlesState();
}

class _ArticlesState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            child: Image.asset('assets/images/3dots.png')
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: GestureDetector(
          child: Image.asset('assets/images/plus.png')
        )
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,),
              width: 303,
              height: 66,
              child: Text("Four Things Every Woman Needs To Know",style: TextStyle(fontFamily: "Avenir", fontSize: 24,)))])));
  }}