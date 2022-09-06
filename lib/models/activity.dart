import 'dart:convert';

class Activity {
  int? id;
  String? category;
  int price;
  String decription;
  Activity(this.id, this.category, this.decription, this.price);
  Map toMap() {
    return {
      'id': id,
      'category': category,
      'price': price,
      'decription': decription,
    };
  }

  factory Activity.fromMap(Map data) {
    return Activity(
        data['id'], data['category'], data['decription'], data['price']);
  }
}

class Activities {
  List<Activity> all;
  Activities(this.all);
  String toJson() {
    return jsonEncode({'all': all.map((e) => e.toMap()).toList()});
  }

  factory Activities.fromJson(String decode) {
    return Activities(List<Activity>.from(
        jsonDecode(decode)['all'].map((e) => Activity.fromMap(e)).toList()));
  }
}
