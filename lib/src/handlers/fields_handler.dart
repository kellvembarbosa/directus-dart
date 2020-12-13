import 'package:dio/dio.dart';
import 'package:directus/src/handlers/items_handler.dart';

class FieldsHandler extends ItemsHandler {
  FieldsHandler({required Dio client}) : super('directus_fields', client: client);
}