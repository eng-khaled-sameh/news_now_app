import 'package:flutter/material.dart';

class NewsCardCategory extends StatelessWidget {
  const NewsCardCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadiusGeometry.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/test_container.jpg'),
          ),
        ),
        width: 165,
        height: 90,
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
