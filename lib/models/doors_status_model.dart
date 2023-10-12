class DoorsStatusModel {
  bool? left;
  bool? right;
  bool? front;
  bool? back;

  DoorsStatusModel({this.left, this.right, this.front, this.back});

  DoorsStatusModel.fromJson(Map<String, dynamic> json) {
    left = json['left'];
    right = json['right'];
    front = json['front'];
    back = json['back'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['left'] = left;
    data['right'] = right;
    data['front'] = front;
    data['back'] = back;
    return data;
  }
}