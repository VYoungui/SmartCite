 import 'package:supabase_flutter/supabase_flutter.dart';

const String url = 'https://uszpckjfflywknogcwrt.supabase.co';
const String anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVzenBja2pmZmx5d2tub2djd3J0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwODMzMzg4OSwiZXhwIjoyMDIzOTA5ODg5fQ.-lWRpiPiTw5nczuScWrTdirJuxvT0smel_SRDq4viO8';

Future<void> supabaseInitialize () async {
   await Supabase.initialize(
     url: url,
     anonKey: anonKey,
   );
 }