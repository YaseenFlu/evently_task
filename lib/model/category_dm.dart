import 'package:evently_task/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryDM {
  IconData icon;
  String title;
  String image;
  CategoryDM({required this.icon,required this.title,required this.image});

  static List<CategoryDM> editEventCategory=[
    CategoryDM(
        icon:Icons.book_online,
        title: "Book Clup",
        image: AppAssets.eventBookingClub),
    CategoryDM(
        icon:Icons.sports_motorsports,
        title: "Sport",
        image:AppAssets.sport),
    CategoryDM(
        icon:Icons.cake,
        title: "Birthday",
        image: AppAssets.sport),
    CategoryDM(
        icon: Icons.holiday_village,
        title: "Holiday",
        image: AppAssets.eventHoliday),
    CategoryDM(
        icon: Icons.meeting_room,
        title: "Meeting",
        image: AppAssets.eventGaming),

  ];

  static List<CategoryDM> createEventsCategories = [
    CategoryDM(
        icon: Icons.sports_handball,
        title: "Sports",
        image: AppAssets.eventSport),
    CategoryDM(
        icon: Icons.holiday_village,
        title: "Holiday",
        image: AppAssets.eventHoliday),
    CategoryDM(
        icon: Icons.meeting_room,
        title: "Meeting",
        image: AppAssets.eventGaming),
    CategoryDM(
        icon: Icons.cake,
        title: "Birthday",
        image: AppAssets.eventBirthday),
    CategoryDM(
        icon: Icons.book_online,
        title: "Booking Club",
        image: AppAssets.eventBookingClub),
  ];

  static CategoryDM fromTitle(String title){
    //return homeCategories.firstWhere((category){
    return  editEventCategory.firstWhere((category){
      return title == category.title;
    });
  }
}
