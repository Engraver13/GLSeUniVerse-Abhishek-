import 'package:GLSeUniVerse/colors.dart';
import 'package:GLSeUniVerse/postDetails.dart';
import 'package:GLSeUniVerse/requestDocs.dart';
import 'package:GLSeUniVerse/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class viewDiscussion extends StatefulWidget {
  @override
  _viewDiscussionState createState() => _viewDiscussionState();
}

class _viewDiscussionState extends State<viewDiscussion> {
  List<Map<String, dynamic>> visitors = [];
  //List<dynamic> posts = [];
  @override
  void initState() {
    super.initState();
    fetchVisitorData();
  }

  Future<void> fetchVisitorData() async {
    final response = await http.get(Uri.parse('https://poojan16.pythonanywhere.com/api/getPost/'));
    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      setState(() {
        //visitors = responseData.cast<Map<String, dynamic>>();
        posts = responseData['posts'];
        print(posts);
        print(posts.length);
      });
    } else {
      throw Exception('Failed to load Discussion data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: Text('Posted Discussion', style: TextStyle(color: white),),
        backgroundColor: mainFontColor,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          //final item = posts[index];
          final content = posts[index]['post_content'].toString().substring(0,20);
          return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          postindex = index;
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => postDetails(),
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            child: Row(
                              children: [
                                // Container(
                                //   width: 50,
                                //   height: 50,
                                //   decoration: BoxDecoration(
                                //     color: arrowbgColor,
                                //     borderRadius: BorderRadius.circular(15),
                                //     // shape: BoxShape.circle
                                //   ),
                                //   child: Center(
                                //       child: Icon(Icons.assignment_sharp)),
                                // ),
                                SizedBox(
                                  width: 0,
                                ),
                                Expanded(
                                  child: Container(
                                    width: (size.width - 90) * 0.7,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            posts[index]['post_title'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: mainFontColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            content + ' ...',
                                            //posts[index]['post_content'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Published By: " + posts[index]['posted_by_first_name'] + ' ' + posts[index]['posted_by_last_name'] + ' (' + posts[index]['program_abbr'] + ')',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: black.withOpacity(0.5),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       children: [
                                //         Text(
                                //           "\$150",
                                //           style: TextStyle(
                                //               fontSize: 15,
                                //               fontWeight: FontWeight.bold,
                                //               color: black),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
          // return Card(
          //   child: ListTile(
          //     //leading: CircleAvatar(child: Text(posts[index]['post_title']), radius: 30,),
          //     title: Text(posts[index]['post_title']),
          //     subtitle: Text(posts[index]['post_content']),
              
          //     trailing: GestureDetector(
          //       child: Icon(Icons.directions_run_rounded, size: 40, color: buttoncolor,),
                
          //       onDoubleTap
          //       : () {
          //         //posts.removeAt(index);
                
          //         setState(() {
                    
          //         });
          //       },
                
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}