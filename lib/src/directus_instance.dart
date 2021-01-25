import 'package:dio/dio.dart';
import 'package:directus/src/data_classes/directus_storage.dart';
import 'package:directus/src/directus.dart';
import 'package:flutter/widgets.dart';

class DirectusInstance {
  static late final Directus _sdk;
  static final DirectusInstance _instance = DirectusInstance._internal();

  DirectusInstance._internal() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  factory DirectusInstance() => _instance;
  Directus get getInstance => _sdk;

  Future<void> init(String url, {DirectusStorage? storage, Dio? client}) async {
    await Directus(url, storage: storage, client: client).init().then(
      (sdkDirectus) {
        _sdk = sdkDirectus;
      },
    );
  }
}
