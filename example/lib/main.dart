import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:directus/directus.dart';

void main() async {
  await DirectusInstance().init('https://api.zapaudios.com/');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final sdk = DirectusInstance().getInstance;

  /// Get posts.
  Future<DirectusListResponse<Map<String, dynamic>>> getPosts() =>
      sdk.items('audios').readMany();

  /// Get settings.
  Future<DirectusResponse<DirectusSettings>> getSettings() =>
      sdk.settings.read();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directus Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Directus Example'),
        ),
        body: Center(
          child: FutureBuilder<dynamic>(
            future: getPosts(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final posts = snapshot.data.data;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(posts[index]['title']),
                  trailing: Text(posts[index]['id'].toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
