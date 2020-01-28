import 'package:frontera/classes/customer.dart';
import 'package:frontera/classes/module.dart';

import 'api.dart';
import 'httpRequest.dart';

class EstimateService {

  static Customer customer;

  static setUser(){}

  static setCustomer(Customer customer){
    EstimateService.customer = customer;
  }

  static saveEstimate(List<Module> modulesList) async {
    print(EstimateService.customer.id.toString());
    String userEmail = "maxime@madera.fr";
    Map<String, dynamic> body = new Map<String, dynamic>();
    body["clientId"] = EstimateService.customer.id.toString();
    body["userLogin"] = userEmail;
    body["modulesList"] = [];
    for (var i = 0; i < modulesList.length; i++){
      body["modulesList"].add({
        "id": modulesList[i].id,
        "count": modulesList[i].count
      });
    }
    var response = await Api.call(new HttpRequest(
        HttpVerb.post, "estimates", body));
    print("response :::::::::::::::::::::::::::::::");
    print(response);
  }

}