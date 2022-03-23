import 'package:flutter/foundation.dart';

class Votingdetlist extends ChangeNotifier {
  List _votingbox = [
    {"title": "hdfkjanfb", "votes": 0},
    {"title": "hdfkjanfb", "votes": 1},
    {"title": "hdfkjanfb", "votes": 10},
    {"title": "hdfkjanfb", "votes": 0},
    {"title": "hdfkjanfb", "votes": 1},
    {"title": "hdfkjanfb", "votes": 10},
  ];
  List get getdata => _votingbox;

  void addItem(String value) {
    _votingbox.add({"title": value, "votes": 0});
    notifyListeners();
  }

  void incrementvote(int index) {
    _votingbox[index]["votes"]++;
    notifyListeners();
  }

  void removeName(int indexval) {
    getdata.removeAt(indexval);

    
  }
}
