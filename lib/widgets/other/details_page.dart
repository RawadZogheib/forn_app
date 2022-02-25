import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String details;
  final int index;

  DetailsPage(
      {required this.imagePath,
      required this.title,
      required this.price,
      required this.details,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'logo$index',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: NetworkImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,//260
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Text(
                          //   'By $photographer',
                          //   style: const TextStyle(
                          //     fontSize: 10,
                          //   ),
                          // ),
                          price != ''
                              ? Column(
                                  children: [
                                    Text(
                                      price + ' L.L.',
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              : const SizedBox(
                                  height: 5,
                                ),
                          Text(
                            details,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
