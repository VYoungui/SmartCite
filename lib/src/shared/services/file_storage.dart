import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

class FileStorage {
  static Future<void> uploadImage(File imageFile) async {
    try {
      if (kDebugMode) {
        print('doing...');
      }
      final response = await client.storage
          .from('reportmobileapp') // Replace with your storage bucket name
          .upload('reports/${imageFile.path.split('/').last}', imageFile);
      if (kDebugMode) {
        print('supabase response $response');
      }
    } catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<void> downloadImage(String filePath) async {
    try {
      final response = await client.storage
          .from('reportmobileapp') // Replace with your storage bucket name
          .download('reports/$filePath');
      File file = File(String.fromCharCodes(response));
      file.open();
      print(response);
    } catch (e){
      print(e.toString());
    }
  }


}