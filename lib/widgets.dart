import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/itmeslist.dart';
import 'databas_helper.dart';

class CategoriesScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Category(
              colorType: 1,
            ),
            Category(
              colorType: 2,
            ),
            Category(
              colorType: 1,
            ),
            Category(
              colorType: 2,
            ),
          ], //catess lisssssssst
        ),
      ),
    );
    // FutureBuilder(
    //   initialData: [],
    //   future: DatabaseHelper.instance.getCategories(),
    //   builder: (context, snapshot) {
    //     return ListView.builder(
    //         shrinkWrap: true,
    //         physics: BouncingScrollPhysics(),
    //         scrollDirection: Axis.horizontal,
    //         itemCount: snapshot.data.length,
    //         itemBuilder: (context, index) {
    //           return snapshot.data[index];
    //         });
    //   });
    //**********************************
    //   SingleChildScrollView(
    //   physics: BouncingScrollPhysics(),
    //   scrollDirection: Axis.horizontal,
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Row(
    //       children: snapshot.data, //cates lisssssssst
    //     ),
    //   ),
    // );
    //----------------********---------
  }
}

class ToDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: toDoList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return toDoList[index]; //toDo liiiiiiiiiiiiiiiiist in homepage
      },
    ));
  }
}

class Category extends StatelessWidget {
  final int colorType;
  final title;
  Category({this.colorType, this.title});
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 + 50;
    return Container(
      margin: EdgeInsets.only(
        right: 20,
      ),
      height: categoryHeight / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "20 tasks",
              style: TextStyle(color: Color(0xff8589AC), fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title ?? "Unnamed",
              style: TextStyle(
                  color: Color(0xff26104A),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "_________",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color:
                    colorType % 2 == 0 ? Color(0xff6600FF) : Color(0xffFF0066),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToDoWidget extends StatelessWidget {
  final int colorType;
  final text;
  final bool isDone;
  ToDoWidget({this.text, @required this.colorType, @required this.isDone});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 7.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0.2,
              spreadRadius: -2,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              margin: EdgeInsets.only(right: 22.0),
              decoration: BoxDecoration(
                border: isDone
                    ? null
                    : Border.all(
                        color: colorType % 2 == 0
                            ? Color(0xff6600FF)
                            : Color(0xffFF0066),
                        width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
                color: isDone
                    ? colorType % 2 == 0
                        ? Color(0xff6600FF)
                        : Color(0xffFF0066)
                    : Colors.transparent,
              ),
              child: Image(
                image: AssetImage("assets/images/check_icon.png"),
              ),
            ),
            Text(
              text ?? ("Unnamed ToDO"),
              style: TextStyle(
                color: isDone ? Color(0xffC4BCD5) : Color(0xff26104A),
                fontWeight: isDone ? FontWeight.w300 : FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
