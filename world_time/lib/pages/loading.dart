import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Malaysia", flag: "malaysia.png", url: "Asia/Kuala_Lumpur");
    await instance.getTime();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A3D50),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitRipple(
              color: Colors.white,
              size: 86,
            ),
            SizedBox(height: 28.0),
            Text("Loading data",
                style: TextStyle(
                    fontSize: 20, color: Colors.white.withOpacity(0.7))),
            SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
