import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/container/container.dart';

class GlassMorphism extends StatefulWidget {
  const GlassMorphism({Key? key}) : super(key: key);

  @override
  _GlassMorphismState createState() => _GlassMorphismState();
}

class _GlassMorphismState extends State<GlassMorphism> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("assets/images/wall.jpg").image,
              fit: BoxFit.cover),
        ),
        child: Opacity(
          opacity: 0.3,
          child: FxContainer(
            color: Colors.white,
            paddingAll: 16,
            marginAll: 16,
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
