import 'dart:io';

import 'package:GLSeUniVerse/users.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class RequestDocs extends StatefulWidget {
  const RequestDocs({Key? key}) : super(key: key);

  @override
  State<RequestDocs> createState() => _RequestDocsState();
}

class _RequestDocsState extends State<RequestDocs> {
 // List<String> items = ["Document 1", "Document 2", "Document 3"];
 var roles = ["Student", "Alumini", "Staff", "Guard"];
  String? role;
  var doc = docs.toString();
  String? selecteddoc;
  
  //String? selecteddoc;
  File? _selectedFile;

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> uploadPdf(File? selectedFile) async {
    if (selectedFile == null) {
      return; // Handle no file selected scenario
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://poojan17.pythonanywhere.com/api/create_docreq/'),
    );

    request.headers['Content-Type'] = 'multipart/form-data';
    request.files.add(http.MultipartFile(
      'file',
      selectedFile.readAsBytes().asStream(),
      selectedFile.lengthSync(),
      filename: selectedFile.path.split('/').last,
    ));

    request.fields['full_name'] = "Shreya Acharya";
    request.fields['doc_id'] = '1';
    request.fields['doc_name'] = 'Transcript';//selecteddoc ?? '';
    request.fields['num_of_copies'] = '1';
    request.fields['additional_instructions'] = 'NA';
    request.fields['purpose'] = 'NA';
    request.fields['requester_role'] = 'Student'; // Example value, replace with actual value
    request.fields['requester_enrolment'] = '202300819010058'; // Example value, replace with actual value

    var response = await request.send();

    if (response.statusCode == 201) {
      print("Successfully Uploaded");
    } else {
      print("Upload Failed: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Documents"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Instructions...",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Full Name"),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Documents',
                    ),
                    value: selecteddoc,
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selecteddoc = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: "Purpose"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration:
                        InputDecoration(labelText: "Additional Instructions"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: "No of Copies"),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _openFileExplorer,
                        child: Text('Upload pdf'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _selectedFile != null
                              ? 'Selected File: ${_selectedFile!.path}'
                              : 'No file selected',
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await uploadPdf(_selectedFile);
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
