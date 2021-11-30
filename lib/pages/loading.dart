import 'package:flutter/material.dart';
import 'package:word_time/services/getTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String time  = 'loading';
void SetupWorldTime () async{

  getTime instance = getTime(location: 'Baghdad', flag: 'iraq.png', url: 'Asia/Baghdad');
  await instance.getData();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location':instance.location ,
    'flag':instance.flag ,
    'time':instance.time ,
    'isDayTime':instance.isDayTime ,


  });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050350).withOpacity(0.5)
        ,
      body: Center(
          child:SpinKitRing(
            color: Colors.blue,
            size: 50.0,
          )
      )
    );
  }
}
