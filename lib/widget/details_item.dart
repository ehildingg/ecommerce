import 'package:flutter/material.dart';

import '../screens/details_page.dart';
import '../dummy_data.dart';

class DetailsItem extends StatelessWidget {
  final int index;
  const DetailsItem(this.index, {super.key});

  void onTapProductHandler(index, BuildContext context) {
    Navigator.of(context).pushNamed(DetailsPage.routeName, arguments: {
      'id': myItems[index]['id'].toString(),
      'name': myItems[index]['name'].toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapProductHandler(index, context),
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(myItems[index]['name']),
      ),
    );
  }
}
