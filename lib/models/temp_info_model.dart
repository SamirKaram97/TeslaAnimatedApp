class TempInfoModel
{
  int tempDegree;
  final int insideTempDegree;
  final int outsideTempDegree;
  bool isCool;

  TempInfoModel(
      {required this.tempDegree,
      required this.insideTempDegree,
      required this.outsideTempDegree,
      required this.isCool});

  factory TempInfoModel.fromJson(Map<String, dynamic> json)=>TempInfoModel(tempDegree: json['tempDegree'], insideTempDegree: json['insideTempDegree'],outsideTempDegree: json['outsideTempDegree'], isCool: json['isCool']);

  Map<String,dynamic> toJson()
  {
    return {"tempDegree":tempDegree,"insideTempDegree":insideTempDegree,"isCool":isCool,"outsideTempDegree":outsideTempDegree};
  }
}

