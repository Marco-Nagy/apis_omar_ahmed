import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({required this.text, required this.onCancel});
  final String text;
  final Function onCancel;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.ubuntu,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 5),
          InkWell(
            onTap: () => widget.onCancel(),
            child: Container(
              color: Colors.red,
              width: 18,
              height: 18,
              child: Icon(
                Icons.clear,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
