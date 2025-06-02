 import 'package:smart_cite/src/core/environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String url = Environment.Supabase_url;
const String anonKey = Environment.Supabase_anonkey;

Future<void> supabaseInitialize () async {
   await Supabase.initialize(
     url: url,
     anonKey: anonKey,
   );
 }