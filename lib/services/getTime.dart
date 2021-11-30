import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class getTime {

  String location ;
  String flag ;
  String url ;
  String time  = '';
  late bool isDayTime ;
  getTime({required this.location,required this.flag,required this.url});

  Future<void> getData() async{

    try{

      Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
// print(datetime);
      DateTime now  = DateTime.parse(datetime);
      now  = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour<20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = 'can not get the time data';
    }


  }
}