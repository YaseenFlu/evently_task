
import 'package:evently_task/utils/app_assets.dart';
import 'package:evently_task/utils/app_colors.dart';
import 'package:evently_task/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Event Details',style: TextStyle(color:AppColors.blue)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color: AppColors.blue),
            onPressed: () {
            Navigator.push(context, AppRoutes.editDetails);
              //  Navigator.pushNamed(context, 'editEvent');
            },
          ),
          IconButton(
            icon: Image.asset(AppAssets.iconDelete),// icon:Icon(Icons.delete, color: Colors.red),//
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
             // height: 200,
             width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                 borderRadius: BorderRadius.circular(16),
             ),
             child: Image.asset(AppAssets.eventSport,height: 200,width: double.infinity),

            ),
            Center(
              child: Text(
                'We Are Going To Play Football',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color:Theme.of(context).textTheme.headlineSmall?.color,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      border:Border.all(color: AppColors.blue),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.iconCalendar),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21 November 2024',
                              style: TextStyle(
                                fontSize: 16,
                                color:AppColors.blue,
                              ),
                            ),
                            Text(
                              '12:12PM',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).textTheme.bodyMedium?.color,fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      border:Border.all(color: AppColors.blue),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.iconLocation),
                        SizedBox(width: 10),
                        Text(
                          'Cairo, Egypt',
                          style: TextStyle(
                            fontSize: 16,
                            color:AppColors.blue,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, color: AppColors.blue, size: 24),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: latlong.LatLng(30.0444, 31.2357), // Cairo coordinates
                        initialZoom: 13.0,
                      ),
                      children: [
                        TileLayer(
                         // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                         /// subdomains: ['a', 'b', 'c'],
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: latlong.LatLng(30.0444, 31.2357),
                              width: 80.0,
                              height: 80.0,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscpi et neque senectus a. Nulla at non malesuada odio duis scelerisque amet nisi. Risus hac enim maecenas sociis et. At cras massa diam porta facilisis maecenas purus. Laculis eget quis ut amet. Sit ac malesuada nisi quis feugiat.',
                    style: TextStyle(fontSize: 16),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}