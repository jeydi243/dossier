import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContratController extends GetxController {
  final supabase = Supabase.instance.client;
  @override
  onInit() {
    super.onInit();
  }

  addNewContrat(Map newContrat) async {
    try {
      var resp = await supabase.from('Contrats').insert(newContrat).select();
      print(resp);
      return resp;
    } catch (e) {
      print(e.toString());
    }
  }

  deleteContrat(String id) {}
}
