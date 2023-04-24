import 'package:dgu/Models/Career.dart';
class CareerManage {
  late final int _totalItems;
  late final List<Career> _items;

  get getTotalItem=>_totalItems;
  get getItems=>_items;

  CareerManage():_totalItems=0,_items=List<Career>.empty();

  CareerManage.fromJson(Map<String, dynamic> json) {
    _totalItems = json['totalItems'];
    if (json['items'] != null) {
      _items=List<Career>.filled(_totalItems,Career(), growable: false);
      int index=0;
      json['items'].forEach((v){
        _items[index++]=Career.fromJson(v);
      });
    }
  }
}
