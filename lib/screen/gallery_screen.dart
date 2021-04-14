import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fileimage/screen/display_image.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("images").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return snapshot.hasError
                  ? Center(
                      child: Text("There is some problem loading your images"),
                    )
                  : snapshot.hasData
                      ? GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                          children: snapshot.data.docs
                              .map((e) => InkWell(
                            onTap: () => Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => DisplayImage())),
                                child: Card(
                                        child: Image.network(
                                      e.get("url"),
                                      fit: BoxFit.cover,
                                    )),
                              ))
                              .toList(),
                        )
                      : Container();
            } else {
              return const Center(
                child: Text("loading....."),
              );
            }
          },
        ),
      ),
    );
  }
}
