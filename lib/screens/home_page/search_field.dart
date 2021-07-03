
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/data/constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.transparent));
    return SizedBox(
      height: 80.h,
      child: Row(
        children: [
           SizedBox(
            width: 15.w,
          ),
          Expanded(
              child: TextFormField(

                controller: searchController,
                decoration: InputDecoration(

                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border, border: border, focusedBorder: border, filled: true, fillColor: Colors.grey.shade200, prefixIcon: Icon(Icons.search_rounded), hintText: searchFieldHint),
              )),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => searchController.clear(),
          )
        ],
      ),
    );
  }
}