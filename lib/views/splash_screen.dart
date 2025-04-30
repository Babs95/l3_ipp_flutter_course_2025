import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_assets.dart';

import '../common/size_config.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    var duration = Duration(seconds: 5);
    
    return Timer(duration, navigate);
  }
  
  navigate(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
  
  @override
  void initState() {
    //startTime();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // Réinitialiser SizeConfig à chaque build pour récupérer les changements d'orientation
    SizeConfig.init(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: SizeConfig.getProportionateScreenHeight(
              SizeConfig.orientation == Orientation.portrait
                  ? 100
                  : 200
          ),
          width: SizeConfig.getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.portrait
                  ? 200
                  : 100
          ),
          child: Image.asset(
              kAppLogo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}