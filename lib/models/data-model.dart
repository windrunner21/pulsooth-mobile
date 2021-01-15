import 'package:pulsooth_mobile/models/all-items-model.dart';
import 'package:pulsooth_mobile/models/giveaway-model.dart';

class DataModel {
  final AllItemsList itemsList;
  final GiveawayList giveawayList;

  DataModel(this.itemsList, this.giveawayList);

  DataModel.fromJson(Map<String, dynamic> parsedJson)
      : itemsList = AllItemsList.fromJson(parsedJson['items']),
        giveawayList = GiveawayList.fromJson(parsedJson['drawItems']);
}
