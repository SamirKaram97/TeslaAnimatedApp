class BatteryInfoModel {
  int? batteryPercentage;
  int? miles;
  int? milesPerHour;
  int? volt;
  int? rTime;
  bool? isCharging;

  BatteryInfoModel({this.batteryPercentage, this.miles, this.milesPerHour, this.isCharging,this.volt,this.rTime});

  BatteryInfoModel.fromJson(Map<String, dynamic> json) {
    batteryPercentage = json['batteryPercentage'];
    miles = json['miles'];
    volt = json['volt'];
    milesPerHour = json['milesPerHour'];
    isCharging = json['isCharging'];
    rTime = json['rTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batteryPercentage'] = batteryPercentage;
    data['miles'] = miles;
    data['volt'] = volt;
    data['milesPerHour'] = milesPerHour;
    data['isCharging'] = isCharging;
    data['rTime'] = rTime;
    return data;
  }
}