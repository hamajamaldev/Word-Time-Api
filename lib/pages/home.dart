import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override

  Map data = {};
  Widget build(BuildContext context) {
       data = ModalRoute.of(context)!.settings.arguments as Map;
     String bgImage  = data['isDayTime'] ? 'day.png':'night.png';
     Color textColor  = data['isDayTime'] ? Colors.white:Colors.lightBlueAccent;

     return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: SafeArea(

              child: Column(
            children: [
              FlatButton.icon(onPressed: ()async{

                Navigator.pushReplacementNamed(context, '/location');

              },icon: Icon(Icons.edit_location,color: textColor,),label: Text("choose Location",style: TextStyle(color: textColor),),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],style: TextStyle(fontSize: 20,color: textColor),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(data['time'],style: TextStyle(fontSize: 50,color: textColor),),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
