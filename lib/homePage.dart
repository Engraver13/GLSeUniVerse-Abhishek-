// ignore_for_file: file_names

import 'package:GLSeUniVerse/colors.dart';
import 'package:GLSeUniVerse/users.dart';
import 'package:GLSeUniVerse/requestDocs.dart';
import 'package:GLSeUniVerse/securityHomePage.dart';
import 'package:GLSeUniVerse/sideNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GLSeUniVerse/barcodePage.dart';
import 'package:GLSeUniVerse/main.dart';
import 'package:GLSeUniVerse/qrPage.dart';
import 'package:icon_badge/icon_badge.dart';
// import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primary,
        key: _scaffoldKey,
        drawer: sideNavigation(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25),
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
                      top: 20, bottom: 0, right: 20, left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: (size.width - 40) * 0.6,
                            child: Column(
                              children: [
                                Text(
                                  "Abhi Engraver",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: mainFontColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  users.enrollment,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Text(
                      //           "FCAIT",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: mainFontColor),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         // Text(
                      //         //   "Income",
                      //         //   style: TextStyle(
                      //         //       fontSize: 12,
                      //         //       fontWeight: FontWeight.w100,
                      //         //       color: black),
                      //         // ),
                      //       ],
                      //     ),
                      //     Container(
                      //       width: 0.5,
                      //       height: 40,
                      //       color: black.withOpacity(0.3),
                      //     ),
                      //     Column(
                      //       children: [
                      //         Text(
                      //           "MSCIT",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: mainFontColor),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         // Text(
                      //         //   "Expenses",
                      //         //   style: TextStyle(
                      //         //       fontSize: 12,
                      //         //       fontWeight: FontWeight.w100,
                      //         //       color: black),
                      //         // ),
                      //       ],
                      //     ),
                      //     Container(
                      //       width: 0.5,
                      //       height: 40,
                      //       color: black.withOpacity(0.3),
                      //     ),
                      //     Column(
                      //       children: [
                      //         Text(
                      //           "2023-2025",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: mainFontColor),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         // Text(
                      //         //   "Loan",
                      //         //   style: TextStyle(
                      //         //       fontSize: 12,
                      //         //       fontWeight: FontWeight.w100,
                      //         //       color: black),
                      //         // ),
                      //       ],
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Overview",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: mainFontColor,
                                )),
                            // IconBadge(
                            //   icon: Icon(Icons.notifications_none),
                            //   itemCount: 1,
                            //   badgeColor: Colors.red,
                            //   itemColor: mainFontColor,
                            //   hideZero: true,
                            //   top: -1,
                            //   onTap: () {
                            //     print('test');
                            //   },
                            // ),
                          ],
                        )
                      ],
                    ),
                    // Text("Overview",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20,
                    //       color: mainFontColor,
                    //     )),
                    // Text("Jan 16, 2023",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 13,
                    //       color: mainFontColor,
                    //     )),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 320,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => requestDocs(),
                                      ));
                                  print("1st Clicked");
                                },
                                child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 25,
                                    right: 25,
                                  ),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(25),
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
                                        top: 10,
                                        bottom: 10,
                                        right: 20,
                                        left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: arrowbgColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // shape: BoxShape.circle
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.feed_outlined,
                                            size: 30,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: (size.width - 90) * 0.7,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Request Docs",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 5,
                                                  // ),
                                                  // Text(
                                                  //   "Receiving Payment from company",
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: black
                                                  //           .withOpacity(0.5),
                                                  //       fontWeight:
                                                  //           FontWeight.w400),
                                                  // ),
                                                ]),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Container(
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       children: [
                                        //         Text(
                                        //           "\$250",
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
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => securityPage(),
                                      ));
                                  print("Clicked!!");
                                },
                                child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 25,
                                    right: 25,
                                  ),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(25),
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
                                        top: 10,
                                        bottom: 10,
                                        right: 20,
                                        left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: arrowbgColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // shape: BoxShape.circle
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.feed_outlined,
                                            size: 30,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: (size.width - 90) * 0.7,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Security Home Page",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 5,
                                                  // ),
                                                  // Text(
                                                  //   "Receiving Payment from company",
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: black
                                                  //           .withOpacity(0.5),
                                                  //       fontWeight:
                                                  //           FontWeight.w400),
                                                  // ),
                                                ]),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Container(
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       children: [
                                        //         Text(
                                        //           "\$250",
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
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => requestDocs(),
                                      ));
                                  print("Clicked 3rd row");
                                },
                                child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 25,
                                    right: 25,
                                  ),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(25),
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
                                        top: 10,
                                        bottom: 10,
                                        right: 20,
                                        left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: arrowbgColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // shape: BoxShape.circle
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.feed_outlined,
                                            size: 30,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: (size.width - 90) * 0.7,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Request Form",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 5,
                                                  // ),
                                                  // Text(
                                                  //   "Receiving Payment from company",
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: black
                                                  //           .withOpacity(0.5),
                                                  //       fontWeight:
                                                  //           FontWeight.w400),
                                                  // ),
                                                ]),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Container(
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       children: [
                                        //         Text(
                                        //           "\$250",
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
    
    


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int myIndex = 1;
//   DateTime timeBackPressed = DateTime.now();

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: sideNavigation(),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: CupertinoColors.activeBlue,
//         onTap: (index) {
//           setState(() {
//             myIndex = index;
//           });

//           if (index == 0) {
//             Get.toNamed('/qrPage');
//           } else if (index == 2) {
//             Get.toNamed('/barcodePage');
//           }
//         },
//         currentIndex: myIndex,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR Code'),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart_sharp), label: 'Barcode'),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: 550,
//               height: 380,
//               child: CustomPaint(
//                   size: Size(
//                       500,
//                       (500 * 0.725)
//                           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                   painter: RPSCustomPainter(),
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
//                         padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 15,
//                               height: 50,
//                             ),
//                             // Icon(
//                             //   Icons.menu,
//                             //   size: 30,
//                             //   color: Colors.white,
//                             // ),
//                             IconButton(
//                                 onPressed: () {
//                                   _scaffoldKey.currentState?.openDrawer();
//                                 },
//                                 icon: Icon(
//                                   Icons.menu,
//                                   size: 30,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: CircleAvatar(
//                           radius: 50,
//                           backgroundImage: AssetImage("images/profile.png"),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Hello User",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             letterSpacing: 2),
//                       ),
//                     ],
//                   )),
//             ),
//             Container(
//               height: 375,
//               padding: EdgeInsets.all(8),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 350,
//                       height: 180,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 63, 121, 235),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.book_rounded,
//                             size: 85,
//                             color: Colors.white,
//                           ),
//                           Center(
//                             child: Text(
//                               "Get\nDocuments",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Container(
//                       width: 350,
//                       height: 180,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 63, 121, 235),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.book_rounded,
//                             size: 85,
//                             color: Colors.white,
//                           ),
//                           Center(
//                             child: Text(
//                               "Get\nDocuments",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Container(
//                       width: 350,
//                       height: 180,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 63, 121, 235),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.book_rounded,
//                             size: 85,
//                             color: Colors.white,
//                           ),
//                           Center(
//                             child: Text(
//                               "Get\nDocuments",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Container(
//                       width: 350,
//                       height: 180,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 63, 121, 235),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.book_rounded,
//                             size: 85,
//                             color: Colors.white,
//                           ),
//                           Center(
//                             child: Text(
//                               "Get\nDocuments",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //   Get.toNamed('/qrPage');
//             // },
//             // child: Text("QrPage")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Layer 1

//     Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 63, 121, 235)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.0018500, size.height * -0.0059311);
//     path_0.lineTo(size.width * 1.0021550, size.height * -0.0042603);
//     path_0.lineTo(size.width * 1.0053550, size.height * 0.9368276);
//     path_0.quadraticBezierTo(size.width * 0.9723400, size.height * 0.8254690,
//         size.width * 0.8778750, size.height * 0.7409793);
//     path_0.cubicTo(
//         size.width * 0.7804150,
//         size.height * 0.6695241,
//         size.width * 0.6728200,
//         size.height * 0.6387931,
//         size.width * 0.5163900,
//         size.height * 0.6343586);
//     path_0.cubicTo(
//         size.width * 0.3868950,
//         size.height * 0.6243931,
//         size.width * 0.1966100,
//         size.height * 0.6801103,
//         size.width * 0.1211000,
//         size.height * 0.7504276);
//     path_0.quadraticBezierTo(size.width * 0.0448500, size.height * 0.8066483,
//         size.width * -0.0010800, size.height * 0.9655172);

//     canvas.drawPath(path_0, paint_fill_0);

//     // Layer 1

//     Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(0, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     canvas.drawPath(path_0, paint_stroke_0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
