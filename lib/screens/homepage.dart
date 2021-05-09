import 'package:flutter/material.dart';

import '../widgets.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF0F1F7),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Center(
            child: Text(
              "TO DO TASKS",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff26104A),
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CATEGORIES",
                          style: TextStyle(
                              color: Color(0xffAD98CE),
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(icon: Icon(Icons.add), onPressed: () {})
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CategoriesScroller(),
                  const SizedBox(
                    height: 50,
                  ),
                  ToDos(),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff6600FF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                          spreadRadius:-1.0,
                          offset: Offset(2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(100.0)),
                  child: IconButton( onPressed: (){},
                    icon: Icon(Icons.add,color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
