import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class DatetimeAPI{
  String time;
  String date;
  Future<void> getTime() async{
    Response response = await get('https://worldtimeapi.org/api/timezone/Africa/Algiers');
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
   String offset = data['utc_offset'].substring(1,3);
   String offsetMinutes = data['utc_offset'].substring(4);
    print(datetime);
    print(offset);
    print(data);
   // datetime object
    DateTime now = DateTime.parse(datetime);
    DateTime now2 = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offsetMinutes)));
    time = DateFormat.jm().format(now);
    date = DateFormat.yMMMMEEEEd().format(now2);


  }
}