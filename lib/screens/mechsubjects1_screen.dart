import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:file_picker/file_picker.dart';

class MechSubjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          String subjectName = 'Subject ${index + 1}';
          return SubjectRow(subjectName: subjectName);
        },
      ),
    );
  }
}

class SubjectRow extends StatelessWidget {
  final String subjectName;

  const SubjectRow({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subjectName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              uploadDocument(context);
            },
            icon: Icon(Icons.upload),
          ),
          IconButton(
            onPressed: () {
              navigateToDownloadScreen(context, subjectName);
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
    );
  }

  Future<void> uploadDocument(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        String fileName = result.files.single.name;
        String filePath = 'documents/$subjectName/$fileName';

        firebase_storage.UploadTask task = firebase_storage
            .FirebaseStorage.instance
            .ref(filePath)
            .putFile(file);

        firebase_storage.TaskSnapshot snapshot = await task.whenComplete(() {});
        String downloadUrl = await snapshot.ref.getDownloadURL();

        // Store the download URL in Firestore or perform any necessary operations

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Document uploaded successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload document')),
      );
    }
  }

  void navigateToDownloadScreen(BuildContext context, String subjectName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DownloadScreen(subjectName: subjectName),
      ),
    );
  }
}

class DownloadScreen extends StatelessWidget {
  final String subjectName;

  const DownloadScreen({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Notes'),
      ),
      body: FutureBuilder<List<String>>(
        future: fetchDocumentUrls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<String> documentUrls = snapshot.data!;
            return ListView.builder(
              itemCount: documentUrls.length,
              itemBuilder: (context, index) {
                String documentUrl = documentUrls[index];
                return ListTile(
                  title: Text('Document ${index + 1}'),
                  onTap: () {
                    downloadDocument(documentUrl);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No documents found');
          }
        },
      ),
    );
  }

  Future<List<String>> fetchDocumentUrls() async {
    firebase_firestore.QuerySnapshot snapshot = await firebase_firestore
        .FirebaseFirestore.instance
        .collection('documents')
        .where('subject', isEqualTo: subjectName)
        .get();

    List<String> urls = snapshot.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['url'] as String?)
        .whereType<String>()
        .toList();

    return urls;
  }

  void downloadDocument(String documentUrl) {
    url_launcher.launch(documentUrl);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MechSubjectsScreen(),
    );
  }
}
