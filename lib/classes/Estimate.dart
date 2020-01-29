import 'dart:convert';
import 'package:frontera/services/api/moduleService.dart';
import 'module.dart';

class Estimate {
  int id;
  String reference;
  String expectedStartDate;
  String expectedEndDate;
  double taxfreeTotalPrice;
  double totalPriceIncTax;
  int clientId;
  int userId;
  List<Module> modules;

  Estimate(var rawEstimate) {
    this.id = rawEstimate["id"];
    this.reference = rawEstimate["reference"];
    this.expectedStartDate = rawEstimate["expectedStartDate"];
    this.expectedEndDate = rawEstimate["expectedEndDate"];
    this.taxfreeTotalPrice = double.parse(rawEstimate["taxfreeTotalPrice"]);
    this.totalPriceIncTax = double.parse(rawEstimate["totalPriceIncTax"]);
    this.clientId = rawEstimate["clientId"];
    this.userId = rawEstimate["userId"];
    this.modules = ModuleService.loadModules(json.encode(rawEstimate["modules"]));
  }
}
