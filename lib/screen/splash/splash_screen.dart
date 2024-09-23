
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3,),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/736x/15/c2/f0/15c2f0641ffd584bf859649c6120ce33.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
          ),
        ],
      ),
    );
  }
}
