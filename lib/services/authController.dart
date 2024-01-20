// ignore_for_file: avoid_print

import 'dart:async';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  Future<List<dynamic>> getData() async {
    try {
      final data = await supabase.from('cities').select('name');
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> signIn() async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: 'example@email.com',
      password: 'example-password',
    );
    final Session? session = res.session;
    final User? user = res.user;
  }
}
