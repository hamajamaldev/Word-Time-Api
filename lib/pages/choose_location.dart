import 'package:flutter/material.dart';
import 'package:word_time/services/getTime.dart';
class choose_location extends StatefulWidget {
  const choose_location({Key? key}) : super(key: key);

  @override
  _choose_locationState createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  List<getTime> locations = [
    getTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    getTime(location: 'Baghdad', flag: 'iraq.png', url: 'Asia/Baghdad'),
    getTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'iran.png'),
    getTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'uk.png'),
    getTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'uk.png'),
    getTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'uk.png'),

    getTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    getTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    getTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    getTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    getTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    getTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    getTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{

    getTime instance = locations[index];
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location':instance.location ,
      'flag':instance.flag ,
      'time':instance.time ,
      'isDayTime':instance.isDayTime ,


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(itemCount: locations.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4 ),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
                backgroundColor: Colors.white,

              ),
            ),
          ),
        );
      },),
    );
  }
}
