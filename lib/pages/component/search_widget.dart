import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itunes/constants/colors.dart';
import 'package:itunes/pages/store/home_store.dart';

class SearchWidget<T extends HomeStore> extends StatefulWidget {
  final bool loading;
  final Function(String) onTextChange;
  final String defaultSearch;
  const SearchWidget({Key? key, required this.loading, required this.onTextChange, this.defaultSearch = 'jack johnson'}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  final _debouncer = DebouncerSearch(milliseconds: 1000);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
            color: darkPrimaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.search, color: darkPrimaryColor,),
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 15.0, color: darkPrimaryColor),
                decoration: new InputDecoration.collapsed(
                  hintText: 'What are you looking for',
                  hintStyle: TextStyle(fontSize: 15.0, color: darkPrimaryColor.withOpacity(0.4)),
                ),
                onChanged: (text) {
                  _debouncer.run(() {
                    widget.onTextChange(text.isEmpty ? widget.defaultSearch : text);
                  });
                },
              ),
            ),
            if (widget.loading)
              Container(
                height: 24,
                width: 24,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoActivityIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DebouncerSearch {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;
  DebouncerSearch({ this.milliseconds = 1000});
  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}