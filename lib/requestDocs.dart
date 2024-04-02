import 'package:GLSeUniVerse/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class requestDocs extends StatefulWidget {
  const requestDocs({super.key});

  @override
  State<requestDocs> createState() => _requestDocsState();
}

class _requestDocsState extends State<requestDocs> {
  //for dropdown button
  var roles = ["Student", "Alumini", "Staff", "Guard"];
  String? role;

  //for file upload
  File? _selectedFile;

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Center(
                  child: Text(
                    "Gls University is putting constant efforts to make your interactions with the University offices seamless and are attempting to simplify some processes for you. You may request important documents from the comfort of your home!!",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 420,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   width: 350,
                    //   child: TextField(
                    //     decoration: InputDecoration(labelText: "Email"),
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 355,
                      child: DropdownButton(
                        hint: Text("Select Documents"),
                        value: role,
                        items: roles.map((String role) {
                          return DropdownMenuItem(
                              value: role, child: Text(role));
                        }).toList(),
                        onChanged: (String? selectedValue) {
                          setState(() {
                            role = selectedValue!;
                          });
                        },
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        isExpanded: true,
                        elevation: 8,
                        underline: Container(),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(labelText: "Purpose"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Additional Instructions"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(labelText: "No of Copies"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        ElevatedButton(
                          onPressed: _openFileExplorer,
                          child: Text('Select File'),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 220,
                          child: _selectedFile != null
                              ? Text('Selected File: ${_selectedFile!.path}')
                              : Text('No file selected'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Charges 200/- for One Copy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttoncolor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
