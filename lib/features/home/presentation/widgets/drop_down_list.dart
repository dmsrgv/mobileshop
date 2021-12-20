import 'package:flutter/material.dart';
import 'package:mobileshop/components/size_config.dart';

class DropDownList extends StatefulWidget {
  final List<String> listItems;
  final String selectedItem;

  const DropDownList({
    Key? key,
    required this.listItems,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    String? _selectedItem = widget.selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 60,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          value: _selectedItem,
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          items: widget.listItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
        ),
      ),
    );
  }
}
