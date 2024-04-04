import 'dart:convert';

import 'package:GLSeUniVerse/colors.dart';
import 'package:GLSeUniVerse/qrPage.dart';
import 'package:GLSeUniVerse/scanQrCode.dart';
import 'package:GLSeUniVerse/userDetails.dart';
import 'package:GLSeUniVerse/visitorEntryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class securityPage extends StatefulWidget {
  const securityPage({super.key});

  @override
  State<securityPage> createState() => _securityPageState();
}

class _securityPageState extends State<securityPage> {
  TextEditingController _enroll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 80,
              //backgroundImage: AssetImage('images/profile.png'),
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                  //   width: 350,
                  //   height: 50,
                  //   padding: EdgeInsets.only(left: 14, bottom: 10, right: 14),
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(255, 221, 237, 245),
                  //     borderRadius: BorderRadius.circular(40),
                  //   ),
                  //   child: TextField(
                  //     controller: _enroll,
                  //     cursorColor: black,
                  //     style: TextStyle(
                  //         fontSize: 17, fontWeight: FontWeight.w500, color: black),
                  //     decoration: InputDecoration(
                  //         prefixIcon: Icon(Icons.email_outlined),
                  //         prefixIconColor: black,
                  //         hintText: "Enrollment Number",
                  //         border: InputBorder.none),
                  //   ),
                  // ),

                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
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
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enrollment Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextField(
                          controller: _enroll,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.numbers_outlined),
                              prefixIconColor: black,
                              hintText: "Search Enrollment Number",
                              border: InputBorder.none),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Pressed");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => userDetails(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: buttoncolor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              height: 320,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => QRCodeScannerScreen(),
                              //     ));
                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SimpleBarcodeScannerPage(),
                                  ));
                              setState(() {
                                if (res is String && res.isNotEmpty) {
                                  final data = jsonDecode(res);
                                  // result = res;
                                  print(data['enrolment']);
                                }
                              });
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
                                    top: 10, bottom: 10, right: 20, left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: arrowbgColor,
                                        borderRadius: BorderRadius.circular(15),
                                        // shape: BoxShape.circle
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.qr_code_2_outlined,
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
                                                "Scan QR Code",
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
                                    builder: (context) => visitorEntry(),
                                  ));
                              //print("1st Clicked");
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
                                    top: 10, bottom: 10, right: 20, left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: arrowbgColor,
                                        borderRadius: BorderRadius.circular(15),
                                        // shape: BoxShape.circle
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.bookmark_add_rounded,
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
                                                "Visitor Entry",
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
                  ],
                ),
              ),
            ),
            // Container(
            //   width: 300,
            //   height: 150,
            //   decoration: BoxDecoration(
            //     color: Color.fromRGBO(63, 121, 235, 1),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed('/scanQrCode');
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Icon(
            //           Icons.qr_code_2,
            //           size: 85,
            //           color: Colors.white,
            //         ),
            //         Center(
            //           child: Text(
            //             "Scan\nQr Code",
            //             style: TextStyle(
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white),
            //           ),
            //         ),
            //       ],
            //     ),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Color.fromARGB(255, 63, 121, 235)),
            //   ),
            // ),
            // SizedBox(
            //   height: 22,
            // ),
            // Container(
            //   width: 300,
            //   height: 150,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 63, 121, 235),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed('/visitorEntryPage');
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Icon(
            //           Icons.book_rounded,
            //           size: 85,
            //           color: Colors.white,
            //         ),
            //         Center(
            //           child: Text(
            //             "Create\nVisitor\nEntry",
            //             style: TextStyle(
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white),
            //           ),
            //         ),
            //       ],
            //     ),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Color.fromARGB(255, 63, 121, 235)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
