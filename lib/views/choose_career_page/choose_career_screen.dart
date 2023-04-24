import 'dart:async';
import 'package:async_extension/async_extension.dart';
import 'package:dgu/Models/Career_Manage.dart';
import 'package:flutter/material.dart';
import '../../Models/Career.dart';
import '../../Network/NetworkRequest.dart';
import '../career_map_page/career_map_screen.dart';

class ChooseCareer extends StatelessWidget {
  ChooseCareer({super.key});
  late List<Career> careers;
  Future<CareerManage> futureCareerManage = NetworkRequest.fetchCareerManage();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Career Map"),
     ),
     body: Container(alignment: Alignment.center,
       child: FutureBuilder(
         future: futureCareerManage,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             if (snapshot.data!.getItems.isNotEmpty) {
               careers = snapshot.data!.getItems;
               return ChooseCareerBody(careers: careers);
             }
           } else if (snapshot.hasError) {
             return Text('${snapshot.error}');
           }
           return const CircularProgressIndicator();
         },
       )
     ),
   ) ;
  }
}

class ChooseCareerBody extends StatefulWidget {
  const ChooseCareerBody({super.key, required this.careers});

  @override
  State<ChooseCareerBody> createState() => _ChooseCareerBodyState();

  final List<Career> careers;
}

class _ChooseCareerBodyState extends State<ChooseCareerBody> {
  int selectedItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderTitle(selectedItemIndex),
        Expanded(child: Container(
            height: 1000,
            width: double.infinity,
            child: ListCareer(careers: widget.careers,
              selectedItemIndex: selectedItemIndex,
              onSelectedItem: (index) {
                setState(() {
                  selectedItemIndex = index;
                });
              },)
        ))
      ],
    );
  }
}

class Footer extends StatefulWidget {
  bool scrollUp;
  Footer(this.scrollUp, {super.key});

  @override
  State<StatefulWidget> createState()=>_Footer();
}

class _Footer extends State<Footer>{
  bool isChecked=true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.scrollUp,
        child: Container(
          key: const Key('grp-checkbox_button'),
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: Colors.grey,
          width: double.infinity,
          child: Column(
            children: [
              InkWell(
                key: const Key('grp-display_again'),
                onTap: () => setState(() {
                  isChecked=isChecked==true?false:true;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                                key: const Key('cb-display_again'),
                                value: isChecked,
                                onChanged: (value) =>
                                    setState(() {
                                      isChecked=isChecked==true?false:true;
                                    }),
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
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.green as Color)),
                  key: const Key('btn-confirm_career'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const CareerMap(
                              title: 'Career Map',
                            )));
                  },
                  child: const Text('Next'))
            ],
          ),
        ));
  }
}

class ListCareer extends StatefulWidget {

  ListCareer(
      {super.key, required this.careers, required this.selectedItemIndex, required this.onSelectedItem});

  final List<Career> careers;

  final ValueChanged<int> onSelectedItem;

  int selectedItemIndex;

  final ScrollController _scrollController = ScrollController();

  double currentPosition = 0;


  @override
  State<ListCareer> createState() => _ListCareerState();
}

class _ListCareerState extends State<ListCareer> {

  bool isScrollUp = false;

  void changeStatusScroll() {
    if (widget.selectedItemIndex != -1) {
      if (widget.currentPosition > widget._scrollController.offset) {
        setState(() {
          isScrollUp = true;
        });
      } else if (widget.currentPosition < widget._scrollController.offset) {
        setState(() {
          isScrollUp = false;
        });
      }
      widget.currentPosition = widget._scrollController.offset;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              height: 600,
              padding: const EdgeInsets.symmetric(horizontal: 300),
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  key: const Key('lv-list_career'),
                  controller: widget._scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: TextButton(
                        key: Key(widget.careers[index].getName),
                        onPressed: () {
                          setState(() {
                            widget.onSelectedItem(index);
                            isScrollUp = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          backgroundColor: index == widget.selectedItemIndex
                              ? Colors.green
                              : Colors.black12,
                          padding: EdgeInsets.symmetric(
                              vertical: 35, horizontal: 20),
                        ),
                        child: ListTile(
                            title: Text(
                              widget.careers[index].getName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    );
                  },
                  itemCount: widget.careers.length,
                ),
                onNotification: (notification) {
                  changeStatusScroll();
                  return true;
                },
              ),
            )),
        Footer(isScrollUp),
      ],
    );
  }
}


class HeaderTitle extends StatelessWidget {
  int selectedItemIndex;

  HeaderTitle(this.selectedItemIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          key: const Key('txt-title'),
          selectedItemIndex == -1
              ? "Please chose your career"
              : "You are choosing",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ));
  }
}