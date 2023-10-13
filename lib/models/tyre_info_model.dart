class TiresInfoModel {
  TireModel? frontLeftTireModel;
  TireModel? frontRightTireModel;
  TireModel? backLeftTireModel;
  TireModel? backRightTireModel;

  TiresInfoModel(
      {this.frontLeftTireModel,
        this.frontRightTireModel,
        this.backLeftTireModel,
        this.backRightTireModel});

  TiresInfoModel.fromJson(Map<String, dynamic> json) {
    frontLeftTireModel = json['frontLeftTireModel'] != null
        ? TireModel.fromJson(json['frontLeftTireModel'])
        : null;
    frontRightTireModel = json['frontRightTireModel'] != null
        ? TireModel.fromJson(json['frontRightTireModel'])
        : null;
    backLeftTireModel = json['backLeftTireModel'] != null
        ? TireModel.fromJson(json['backLeftTireModel'])
        : null;
    backRightTireModel = json['backRightTireModel'] != null
        ? TireModel.fromJson(json['backRightTireModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (frontLeftTireModel != null) {
      data['frontLeftTireModel'] = frontLeftTireModel!.toJson();
    }
    if (frontRightTireModel != null) {
      data['frontRightTireModel'] = frontRightTireModel!.toJson();
    }
    if (backLeftTireModel != null) {
      data['backLeftTireModel'] = backLeftTireModel!.toJson();
    }
    if (backRightTireModel != null) {
      data['backRightTireModel'] = backRightTireModel!.toJson();
    }
    return data;
  }
}

class TireModel {
  double? psi;
  int? tempDegree;
  bool? isLow;

  TireModel({this.psi, this.tempDegree, this.isLow});

  TireModel.fromJson(Map<String, dynamic> json) {
    psi = json['psi'];
    tempDegree = json['tempDegree'];
    isLow = json['isLow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['psi'] = psi;
    data['tempDegree'] = tempDegree;
    data['isLow'] = isLow;
    return data;
  }
}