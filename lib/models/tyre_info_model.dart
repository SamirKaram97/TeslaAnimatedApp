class TyreInfoModel
{
  final double psi;
  final int tempDegree;
  final bool isLow;

  TyreInfoModel({required this.psi,required  this.tempDegree,required  this.isLow});

  factory TyreInfoModel.fromJson(Map<String, dynamic> json)=>TyreInfoModel(psi: json['psi'], tempDegree: json['tempDegree'], isLow: json['isLow']);

  Map<String,dynamic> toJson()
  {
    return {"psi":psi,"tempDegree":tempDegree,"isLow":isLow};
  }
}

List<TyreInfoModel> tyresInfo =[
  TyreInfoModel(psi: 18.6,tempDegree: 26,isLow: false),
  TyreInfoModel(psi: 23.6,tempDegree: 26,isLow: true),
  TyreInfoModel(psi: 24.4,tempDegree: 26,isLow: true),
  TyreInfoModel(psi: 29.8,tempDegree: 26,isLow: true),
];