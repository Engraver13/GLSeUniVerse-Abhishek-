import 'package:GLSeUniVerse/cameraPage.dart';
import 'package:GLSeUniVerse/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class postDiscussion extends StatefulWidget {
  const postDiscussion({super.key});

  @override
  State<postDiscussion> createState() => _postDiscussionState();
}

class _postDiscussionState extends State<postDiscussion> {
  TextEditingController pdiscuss = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 420,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Post Discussion",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: pdiscuss,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: "Write your discussions...",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 420,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CameraApp();
                            },
                          ));
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Upload",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
