class Module {
  int id;
  String name;
  String reference;
  double width;
  double height;
  double thick;
  String productRange;
  double priceWithVat;
  String moduleType;
  int count;

  Module(
      {this.id,
      this.name,
      this.reference,
      this.width,
      this.height,
      this.thick,
      this.productRange,
      this.priceWithVat,
      this.moduleType,
      this.count,
      });

  factory Module.fromJson(Map<String, dynamic> parsedJson) {
    return Module(
        id: parsedJson["id"],
        name: parsedJson["name"] as String,
        reference: parsedJson["reference"] as String,
        width: parsedJson["width"] as double,
        height: parsedJson["height"] as double,
        thick: parsedJson["thick"] as double,
        productRange: parsedJson["productRange"] as String,
        priceWithVat: parsedJson["priceWithVat"] as double,
        moduleType: parsedJson["moduleType"] as String,
        count: 1
    );
  }
}
