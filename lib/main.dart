import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quran/models/quran_ayat_model.dart';
import 'package:simple_quran/models/quran_model.dart';
import 'package:simple_quran/view/quran_detail.dart';
import 'package:simple_quran/view/quran_list.dart';
import 'package:simple_quran/view/splash_screen.dart';  

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: QuranData(),),
        ChangeNotifierProvider.value(value: QuranAyat(),)
      ],
      child: MaterialApp(
        title: "Quran",
        theme: ThemeData(
          primarySwatch: Colors.lime
        ),
        home: SplashScreen(),
        routes: {
          '/detail' : (ctx) => QuranDetail(),
        },
      ),
    );
  }
}
