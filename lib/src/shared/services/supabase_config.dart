 import 'package:supabase_flutter/supabase_flutter.dart';

const String url = 'https://pgtleofxtkeeyzgrdwws.supabase.co';
const String anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBndGxlb2Z4dGtlZXl6Z3Jkd3dzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgzMzY5OTMsImV4cCI6MjA2MzkxMjk5M30.CB2vJbLDSYgfwzdLSoesfHpu3xLnM8zaaW9vXpBEOps';

Future<void> supabaseInitialize () async {
   await Supabase.initialize(
     url: url,
     anonKey: anonKey,
   );
 }