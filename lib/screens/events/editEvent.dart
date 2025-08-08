import 'package:evently_task/model/category_dm.dart';
import 'package:evently_task/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:evently_task/widget/category_tabs.dart';

import '../../utils/app_assets.dart';
import '../../widget/custom_text_field.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});
  @override
  State<EditEvent> createState() => _editEvent();
  }

class _editEvent extends State<EditEvent> {
  final _titleController = TextEditingController(text: 'Reading Book Club');
  final _descriptionController = TextEditingController(text: '''
Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam...
  ''');
  TextEditingController titleController=TextEditingController();
 // TextEditingController descriptionController=TextEditingController();
  CategoryDM selectedCategory=CategoryDM.editEventCategory[0];
  DateTime selectedDate=DateTime.now();
  TimeOfDay selectedTime=TimeOfDay.now();
  String _location = 'Cairo, Egypt';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              buildCategoryImage(),
              buildCategoryTabs(),
              buildTitleTextField(),
              buildDescriptionTextField(),
              buildEventDate(),
              buildEventTime(),
              buildLocation(),
              buildUpdateButton(),
            ],

          ),
        ),
      ),
    );
  }
  buildAppBar() => AppBar(
      leading: IconButton(
                 onPressed:(){
                   Navigator.pop(context);
                },
                 icon:Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color)),
    title: Text("Edit Event",style: Theme.of(context).textTheme.headlineSmall),
  );

  buildCategoryImage()=> ClipRRect(
    child: Image.asset(selectedCategory.image
    ),
  );

  buildCategoryTabs() => CategoryTabs(
      categories: CategoryDM.editEventCategory,
    onTabSelected:(category){
      selectedCategory=category;
      setState(() {});
    },
      selectedTabBg: AppColors.blue,
      selectedTabTextColor:AppColors.white,
      unselectedTabBg:AppColors.white,
      unselectedTabTextColor: AppColors.blue,
  );

  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Title",
        style:Theme.of(context).textTheme.bodyMedium//TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
      ),
      SizedBox(height: 8),
      CustomTextField(
        hint: "Reading Book Club",
        prefixIcon: AppSvg.icNoteEdit,
        controller: titleController,
      ),
    ],
  );

  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Description",
        style:Theme.of(context).textTheme.bodyMedium //TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: AppColors.black),
      ),
      SizedBox(height: 8),
      CustomTextField(
        hint:_descriptionController.text,//"Description",
        minLines: 5,
        //controller: _descriptionController,
      ),
    ],
  );

  buildEventDate() => InkWell(
    onTap: () async {
      selectedDate = (await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: selectedDate,
          lastDate: DateTime.now().add(Duration(days: 365)))) ??
          selectedDate;
    },
    child: Row(
      children: [
        Icon(Icons.calendar_month,color: Theme.of(context).iconTheme.color),
        SizedBox(width: 8),
        Text(
          "Event Date",
          style:Theme.of(context).textTheme.bodyMedium),// TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.black)),
        Spacer(),
        Text(
          "30/11/2024",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.blue),
        ),
      ],
    ),
  );

  buildEventTime() => InkWell(
    onTap: () async {
      selectedTime = (await showTimePicker(
          context: context, initialTime: selectedTime)) ??
          selectedTime;
    },
    child: Row(
      children: [
        Icon(Icons.access_time,color:Theme.of(context).iconTheme.color),// AppColors.black),
        SizedBox(width: 8),
        Text(
          "Event Time",
          style:Theme.of(context).textTheme.bodyMedium// TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.black),
        ),
        Spacer(),
        Text(
          "11:22PM",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blue),
        ),
      ],
    ),
  );


  Widget buildLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
        SizedBox(height: 4),
        InkWell(
          onTap: _pickLocation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(AppAssets.iconLocation,),
               // Icon(Icons.place, color: Colors.indigo),
                SizedBox(width: 8),
                Expanded(child: Text(_location)),
                Icon(Icons.arrow_forward_ios, color: Colors.indigo),
              ],
            ),
          ),
        ),
      ],
    );
  }
 Widget buildUpdateButton(){
    return SizedBox(
     width: double.infinity,
      height: 48,
     child:ElevatedButton(
       onPressed: (){},
       style: ElevatedButton.styleFrom(
         backgroundColor:AppColors.blue,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8),
         ),
       ),
       child: Text('Update Event', style: TextStyle(fontSize: 16,color: AppColors.white)),
     )
   );
 }

  void _pickLocation() {
    setState(() {
      _location = 'New Location, Country';
    });
  }



}




