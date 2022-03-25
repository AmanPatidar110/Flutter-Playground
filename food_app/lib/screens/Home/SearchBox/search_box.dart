import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          color: grey,
          offset: Offset(1, 1),
          blurRadius: 4,
        ),
      ]),
      child: const ListTile(
        leading: Icon(
          Icons.search,
          color: red,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Find food and restaurent",
            border: InputBorder.none,
          ),
        ),
        trailing: Icon(
          Icons.filter_list,
          color: red,
        ),
      ),
    );
  }
}
