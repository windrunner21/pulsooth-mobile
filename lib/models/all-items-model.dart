class AllItemsList {
  final List<AllItemsModel> items;

  AllItemsList({
    this.items,
  });

  factory AllItemsList.fromJson(List<dynamic> parsedJson) {
    List<AllItemsModel> items = new List<AllItemsModel>();
    items = parsedJson.map((i) => AllItemsModel.fromJson(i)).toList();

    return new AllItemsList(items: items);
  }
}

class AllItemsModel {
  final String id;
  final String phoneNumber;
  final String brandName;
  final int amount;
  final String surveyId;
  final String image;
  final String createdOn;
  final String name;
  final String description;

  AllItemsModel(this.id, this.phoneNumber, this.brandName, this.amount,
      this.surveyId, this.image, this.createdOn, this.name, this.description);

  AllItemsModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        phoneNumber = json['phoneNumber'],
        brandName = json['brandName'],
        amount = json['amount'],
        surveyId = json['surveyId'],
        image = json['image'],
        createdOn = json['createdOn'],
        name = json['name'],
        description = json['description'];
}
