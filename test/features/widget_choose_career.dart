import 'package:dgu/Models/Career.dart';
import 'package:dgu/views/choose_career_page/choose_career_screen.dart';
import 'package:flutter/material.dart';

class WidgetChooseCareer{
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Career Map"),
        ),
        body: Container(alignment: Alignment.center,
          child: ChooseCareerBody(careers: mockData()),
        ),
      ),
    );
  }

  List<Career>mockData(){
    Career career = Career.fullParam("1", "Technology");
    Career career1 = Career.fullParam("2", "Life Style");
    Career career2 = Career.fullParam("3", "Architecture");
    Career career3 = Career.fullParam("4", "Cooking");
    Career career4 = Career.fullParam("5", "Biotechnology");
    Career career5 = Career.fullParam("6", "Medicine");
    Career career6 = Career.fullParam("7", "Art");
    List<Career>careers=[];
    careers.add(career);
    careers.add(career1);
    careers.add(career2);
    careers.add(career3);
    careers.add(career4);
    careers.add(career5);
    careers.add(career6);
    return careers;
  }
}