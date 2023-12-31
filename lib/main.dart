// main.dart

import 'package:flutter/material.dart';
import 'package:google_mao/login.dart';
import 'package:supabase/supabase.dart';
import 'HomeScreen.dart';
import 'register.dart';
import 'login.dart';
import 'create_animal.dart';
import 'check_animals.dart';
import 'check_all_animals.dart';

bool isLoggedIn = false; // Variable para rastrear el estado de la sesión

void main() {
  final supabaseUrl = 'https://jtnxusdkumjwecqhskxm.supabase.co';
  final supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp0bnh1c2RrdW1qd2VjcWhza3htIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwMjc1NjUxMSwiZXhwIjoyMDE4MzMyNTExfQ.d7LIkW-RAcoRO9QbEMKTEZOUOjLVdlF2VCKWPhm8tqs';

  runApp(MyApp(
    supabaseUrl: supabaseUrl,
    supabaseKey: supabaseKey,
  ));
}

class MyApp extends StatelessWidget {
  final String supabaseUrl;
  final String supabaseKey;

  MyApp({required this.supabaseUrl, required this.supabaseKey});

  SupabaseClient getSupabase() {
    return SupabaseClient(supabaseUrl, supabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase User Registration',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? HomeScreen(supabase: getSupabase()) // Muestra la pantalla principal si isLoggedIn es true
          : LoginScreen(supabase: getSupabase()), // Muestra la pantalla de inicio de sesión si isLoggedIn es false
    );
  }
}
