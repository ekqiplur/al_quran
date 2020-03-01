import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_quran/view/quran_list.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (_) {
          _navigateToQuranList();
        });
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToQuranList(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => QuranList()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lime,
        alignment: Alignment.center,
        child: Stack(
          
          children: <Widget>[
            Opacity(opacity: 1, child: Image(image: AssetImage('assets/images/alquran.png'),)
            
            ),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 360, 20, 18),
                child: Text("Al Qur'an Nur Karim", style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'BerkshireSwash',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12)
                      )
                    ]
                  ),
                  ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
