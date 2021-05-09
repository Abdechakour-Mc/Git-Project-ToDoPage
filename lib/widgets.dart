import 'package:flutter/material.dart';
import './models/itmeslist.dart';

class CategoriesScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: cateList,
        ),
      ),
    );
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
        return toDoList[index];
      },
    ));
  }
}

class Category extends StatelessWidget {
  final Color color;
  final title;
  Category({@required this.color, @required this.title});
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
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
              title,
              style: TextStyle(
                  color: Color(0xff26104A),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "_________",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: color),
            )
          ],
        ),
      ),
    );
  }
}

class ToDoWidget extends StatelessWidget {
  final Color color;
  final text;
  final bool isDone;
  ToDoWidget({this.text, @required this.color, @required this.isDone});
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
                border: isDone ? null : Border.all(
                  color: color,
                  width: 1.5
                ),
                borderRadius: BorderRadius.circular(15.0),
                color: isDone ? color : Colors.transparent,
              ),
              child: Image(
                image: AssetImage("assets/images/check_icon.png"),
              ),
            ),
            Text(
              text ??  ("Unnamed ToDO"),
              style: TextStyle(
                color: isDone ? Color(0xffC4BCD5) : Color(0xff26104A) ,
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
