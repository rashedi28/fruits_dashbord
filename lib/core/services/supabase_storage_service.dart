import 'dart:io';
import '../../constants.dart';
import 'storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    await _supabase.client.storage
        .from(kBucketName)
        .upload('$path/$fileName', file);
    final String publicUrl = _supabase.client.storage
        .from(kBucketName)
        .getPublicUrl('$path/$fileName');
    return publicUrl;
  }
}
