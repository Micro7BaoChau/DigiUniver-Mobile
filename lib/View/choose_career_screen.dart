import 'dart:math';

import 'package:dgu/View/career_map_screen.dart';
import 'package:flutter/material.dart';
import '../Models/Career.dart';

class ChooseCareer extends StatefulWidget {
  const ChooseCareer({super.key,required this.title});
  final String title;
  @override
  State<ChooseCareer> createState() => _ChooseCareerState();
}

class _ChooseCareerState extends State<ChooseCareer> {
  List<Career> careers = <Career>[];
  bool isChecked = true;
  bool stateItem = false;
  bool scrollUp = false;
  int selectedItem = -1;
  String header = "Please choose career";
  final ScrollController _scrollController=ScrollController();
  double currentPosition=0;
  changeStateCheckbox() {
    setState(() {
      isChecked = isChecked ? false : true;
    });
  }

  changeSelectedItem(int index) {
    setState(() {
      selectedItem = index;
      scrollUp=true;
    });
  }
  changeStatusScroll(){
    if (selectedItem != -1) {
      setState(() {
        if(currentPosition>_scrollController.offset){
          scrollUp=true;
        }
        else if(currentPosition<_scrollController.offset){
          scrollUp=false;
        }
        currentPosition=_scrollController.offset;
      });
    }
  }

  getListCareer() {
    careers.clear();
    Career career = Career.fullparam("1", "Technology");
    Career career1 = Career.fullparam("2", "Food Technology");
    Career career2 = Career.fullparam("3", "Architecture");
    Career career3 = Career.fullparam("4", "Cooking");
    Career career4 = Career.fullparam("5", "Biotechnology");
    Career career5 = Career.fullparam("6", "Medicine");
    Career career6 = Career.fullparam("7", "Business");
    careers.add(career);
    careers.add(career1);
    careers.add(career2);
    careers.add(career3);
    careers.add(career4);
    careers.add(career5);
    careers.add(career6);
  }

  @override
  Widget build(BuildContext context) {
    getListCareer();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Career Map"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  key: const Key('txt-title'),
                  selectedItem == -1
                      ? "Please chose your career"
                      : "You are choosing",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              height: 1000,
              width: double.infinity,
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  key: const Key('lv-list_career'),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: TextButton(
                        key: Key(careers[index].name),
                        onPressed: () => changeSelectedItem(index),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          backgroundColor: index == selectedItem
                              ? Colors.green
                              : Colors.black12,
                          padding: EdgeInsets.symmetric(
                              vertical: 35, horizontal: 20),
                        ),
                        child: ListTile(
                            title: Text(
                          careers[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    );
                  },
                  itemCount: careers.length,
                ),
                onNotification: (notification) {
                  changeStatusScroll();
                  return true;
                },
              ),
            )),
            Visibility(
                visible: scrollUp ,
                child: Container(
                  key: const Key('grp-checkbox_button'),
                  color: Colors.grey,
                  width: double.infinity,
                  child: Column(
                    children: [
                      InkWell(
                        key: const Key('grp-display_again'),
                        onTap: () => changeStateCheckbox(),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                key: const Key('cb-display_again'),
                                value: isChecked,
                                onChanged: (value) => changeStateCheckbox(),
                              ),
                              const Text(
                                "don't display again",
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.green as Color)),
                          key: const Key('btn-confirm_career'),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const CareerMap(title: 'Career Map',)));},
                          child: const Text('Next'))
                    ],
                  ),
                ))
          ],
        ));
  }
}
