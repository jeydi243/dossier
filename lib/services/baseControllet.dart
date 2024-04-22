import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BaseController extends GetxController {
  final supabase = Supabase.instance.client;

  
  @override
  onInit() {
    super.onInit();
    null;
  }
}
