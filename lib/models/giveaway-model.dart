class GiveawayList {
  final List<GiveawayModel> giveaways;

  GiveawayList({
    this.giveaways,
  });

  factory GiveawayList.fromJson(List<dynamic> parsedJson) {
    List<GiveawayModel> giveaways = new List<GiveawayModel>();
    giveaways = parsedJson.map((i) => GiveawayModel.fromJson(i)).toList();

    return new GiveawayList(giveaways: giveaways);
  }
}

class GiveawayModel {
  final String id;
  final String startDate;
  final String endDate;
  final String image;
  final String name;
  final int drawsNumber;

  GiveawayModel(this.id, this.startDate, this.endDate, this.image, this.name,
      this.drawsNumber);

  GiveawayModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        startDate = json['startDate'],
        endDate = json['endDate'],
        image = json['image'],
        name = json['name'],
        drawsNumber = json['drawsNumber'];
}
