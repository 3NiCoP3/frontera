import 'dart:convert';
import 'package:frontera/classes/Estimate.dart';
import 'package:frontera/classes/customer.dart';
import 'package:frontera/classes/module.dart';
import 'api.dart';
import 'httpRequest.dart';

class EstimateService {
  static Customer customer;

  static setUser() {}

  static setCustomer(Customer customer) {
    EstimateService.customer = customer;
  }

  static saveEstimate(List<Module> modulesList) async {
    String userEmail = "maxime@madera.fr";
    Map<String, Object> body = new Map<String, Object>();
    body["clientId"] = EstimateService.customer.id.toString();
    body["userLogin"] = userEmail;
    var partialModulesList = [];
    for (var i = 0; i < modulesList.length; i++) {
      partialModulesList
          .add({"id": modulesList[i].id, "count": modulesList[i].count});
    }
    body["modulesList"] = partialModulesList;
    print(jsonEncode(body));
    var response = await Api.call(new HttpRequest(HttpVerb.post, "estimates",
        jsonEncode(body), {"Content-Type": "application/json"}));
  }

  static getEstimates() async {
    var response =
        await Api.call(new HttpRequest(HttpVerb.get, "estimates", {}));
    List<Estimate> estimatesList = [];
    var jsonResponse = json.decode(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      estimatesList.add(Estimate(jsonResponse[i]));
    }
    return estimatesList;
  }

  static getEstimatesByCustomerId() async {
    var response = await Api.call(
        new HttpRequest(HttpVerb.get, "estimates", {"userId": customer.id}));
    List<Estimate> estimatesList = [];
    var jsonResponse = json.decode(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      estimatesList.add(Estimate(jsonResponse[i]));
    }
    return estimatesList;
  }
}
