import 'package:flutter/material.dart';
import 'package:frontera/classes/Estimate.dart';
import 'package:frontera/services/api/EstimateService.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'devisSearchDataTable.dart';

class DevisSearchAutoComplete extends StatefulWidget {
  DevisSearchAutoComplete() : super();

  @override
  _DevisSearchAutoCompleteState createState() => _DevisSearchAutoCompleteState();
}

class _DevisSearchAutoCompleteState extends State<DevisSearchAutoComplete> {
  AutoCompleteTextField searchTextField;

  List<Estimate> selectedEstimate = [];

  GlobalKey<AutoCompleteTextFieldState<Estimate>> key = new GlobalKey();

  static List<Estimate> estimates = new List<Estimate>();
  bool loading = true;

  void getEstimates() async {
    try {
      estimates = await EstimateService.getEstimates();
      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Error getting customers.");
    }
  }
  
  @override
  void initState() {
    getEstimates();
    super.initState();
  }

  deleteEstimate(Estimate estimate) {
    setState(() {
      selectedEstimate.remove(estimate);
    });
  }

  Widget row(Estimate estimate) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Ref : " + estimate.reference,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Client : " + estimate.clientId.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          loading
              ? CircularProgressIndicator()
              : searchTextField = AutoCompleteTextField<Estimate>(
            key: key,
            clearOnSubmit: true,
            suggestions: estimates,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black38,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              labelText: 'Recherchez un devis ...',
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.circular(62.00)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(62.00)),
            ),
            itemFilter: (item, query) {
              return item.reference
                  .toLowerCase()
                  .startsWith(query.toLowerCase());
            },
            itemSorter: (a, b) {
              return a.reference.compareTo(b.reference);
            },
            itemSubmitted: (item) {
              setState(() {
                selectedEstimate.add(item);
                searchTextField.textField.controller.text =
                    item.reference;
              });
            },
            itemBuilder: (context, item) {
              return row(item);
            },
          ),
          SizedBox(height: 10.00),
          DevisSearchDataTable(selectedEstimate, deleteEstimate),
        ],
      ),
    );
  }
}
