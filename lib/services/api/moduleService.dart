import 'dart:convert';

import 'package:frontera/classes/module.dart';

import 'api.dart';
import 'httpRequest.dart';

class ModuleService extends Api{

  static List<Module> loadModules(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Module>((json) => Module.fromJson(json)).toList();
  }


  static getModules() async {
    var response = await Api.call(new HttpRequest(
        HttpVerb.get, "modules", {}));
    if (response.statusCode == 200) {
      print(response.body);
      print("response OK");
      List<Module> modules = ModuleService.loadModules(response.body);
      print(modules.length.toString() + " modules");

      return modules;
    } else
      print("nope");
      print("nope");
      print("nope");
      print("nope");
      print("nope");
  }

}