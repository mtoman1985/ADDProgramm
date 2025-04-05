import 'package:add_programme/Model/Beams.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../Model/Bar.dart';
import '../../VM/VMHomePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VMHomePage vmHomePage=VMHomePage();
  Beams beams =Beams.Impty();
  Bar bar=Bar.Impty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bar.b=90;
    bar.h=45;

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        drawer: vmHomePage.drawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Padding(
            padding: EdgeInsets.only(right: 17.0),
            child: Text(' برنامج التحليل والتصيميم الهندسي',style:TextStyle(fontSize:20)),
          ),
          flexibleSpace:SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Row(
                  mainAxisAlignment : MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '   ${beams.I_zz}    ton/m',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '   ${bar.shape}  Bar   ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '   ${beams.shape}    beam   ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '   ${bar.b}    bar   ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '   ${bar.I_zz}    bar   ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
