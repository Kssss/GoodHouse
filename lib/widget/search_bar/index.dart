import 'dart:ffi';

import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final bool? shwoLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const MySearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue,
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  String _searchWord = ' ';
  late TextEditingController _controller;
  Function? _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = ' ';
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (widget.shwoLocation != null)
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.room, color: Colors.green, size: 20),
                  Text('广州',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ],
              ),
            ),
          if (widget.goBackCallback != null)
            GestureDetector(
              // onTap: widget.goBackCallback,
              child: Icon(
                Icons.chevron_left,
                color: Colors.black87,
              ),
            ),
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18)),
              padding: EdgeInsets.only(left: 8),
              child: TextField(
                textInputAction: TextInputAction.search,
                // controller: _controller,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: -4),
                  hintText: '请输入搜索词',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          if (widget.onCancel != null)
            GestureDetector(
              // onTap: widget.goBackCallback,
              child: Text(
                '取消',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
