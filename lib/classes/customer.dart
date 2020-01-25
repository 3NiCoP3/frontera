class Customer {
  int id;
  String lastName;
  String firstName;
  String emailAddress;

  Customer({this.id, this.lastName, this.emailAddress, this.firstName});

  factory Customer.fromJson(Map<String, dynamic> parsedJson) {
    return Customer(
      id: parsedJson["id"],
      lastName: parsedJson["lastName"] as String,
      firstName: parsedJson["firstName"] as String,
      emailAddress: parsedJson["emailAddress"] as String,
    );
  }
}