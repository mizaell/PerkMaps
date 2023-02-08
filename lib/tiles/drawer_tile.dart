import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 25),
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 30.0,
                color: controller.page.round() == page
                    ? Colors.white
                    : Color.fromARGB(255, 7, 61, 34),
              ),
              SizedBox(width: 30.0),
              Text(
                text,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Arial',
                  color: controller.page.round() == page
                      ? Colors.white
                      : Color.fromARGB(255, 7, 61, 34),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
