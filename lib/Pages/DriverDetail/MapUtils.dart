// ignore_for_file: file_names
import 'package:url_launcher/url_launcher.dart';
class MapUtils{
  MapUtils._();
   static Future<void>openMap(
       double Latitude,
       double Longitude,
       ) async {
     String googleMapUrl ="http://www.google.com/maps/search/?api=1&query=$Latitude,$Longitude";
     if (await canLaunch(googleMapUrl)){
        await launch(googleMapUrl);
        print("launch");
     }else{
       print ('Could not open the Map');
     }
   }
}
