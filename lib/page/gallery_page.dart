import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forn_app/api/my_api.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/PopUp/errorWarningPopup.dart';

import '../widgets/other/details_page.dart';

List<ImageDetails> _images = [];
//   ImageDetails(
//     imagePath: 'Assets/img/img (1).jpg',
//     price: '',
//     title: 'New Year',
//     details:
//         'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (2).jpg',
//     price: '\$10.00',
//     title: 'Spring',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (3).jpg',
//     price: '\$30.00',
//     title: 'Casual Look',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (4).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (5).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (6).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (7).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (8).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (9).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (10).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (11).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
//   ImageDetails(
//     imagePath: 'Assets/img/img (12).jpg',
//     price: '\$20.00',
//     title: 'New York',
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
//   ),
// ];

class GalleryPage extends StatefulWidget {
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    // TODO: implement initState
    _loadGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings');
              },
              icon: const Icon(Icons.settings))
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Gallery',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: globals.whiteBlue,
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                imagePath: _images[index].imagePath,
                                title: _images[index].title,
                                price: _images[index].price,
                                details: _images[index].details,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'logo$index',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(_images[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: _images.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _loadGallery() async {
    try {
      _images.clear();
      var data = {
        'version': globals.version,
      };

      var res = await CallApi()
          .postData(data, '/Gallery/Control/(Control)loadGallery.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        for (int i = 0; i < body[1].length; i++) {
          _images.add(
            ImageDetails(
              imagePath: '${globals.myIP}/Images/img%20(' + body[1][i][0] + ')',
              title: body[1][i][1],
              details: body[1][i][2],
              price: body[1][i][3],
            ),
          );
        }
        setState(() {
          _images;
        });
      } else if (body[0] == "empty") {
        WarningPopup(context, 'No Item yet!!');
      } else if (body[0] == "errorVersion") {
        ErrorPopup(context, globals.errorVersion);
      } else {
        ErrorPopup(context, globals.errorElse);
      }
    } catch (e) {
      print(e);
      ErrorPopup(context, globals.errorException);
    }
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  final String price;

  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.details,
    required this.price,
  });
}
