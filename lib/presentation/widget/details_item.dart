import 'package:flutter/material.dart';

import '../screens/details_page.dart';
import '../../data/dummy_data.dart';

class DetailsItem extends StatelessWidget {
  final int index;
  const DetailsItem(this.index, {super.key});

  void onTapProductHandler(index, BuildContext context) {
    Navigator.of(context).pushNamed(DetailsPage.routeName,
        arguments: {'product': myItems[index]});
  }

  @override
  // Widget build(BuildContext context) {
  //   return InkWell(
  //     onTap: () => onTapProductHandler(index, context),
  //     child: Container(
  //       margin: const EdgeInsets.all(10),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         color: Colors.blue,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Text(myItems[index].name),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapProductHandler(index, context),
      child: Card(
          elevation: 10.0,
          shadowColor: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image.asset(
                  'images/model1.jpg',
                  width: 100,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      myItems[index].name,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "\$${myItems[index].price}",
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "\$${myItems[index].price}",
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${myItems[index].price}% off",
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
