// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, file_names

class DiseaseModel {
  String? oId;
  String? dId;
  String? dName;
  String? dDescription;

  DiseaseModel({this.oId, this.dId, this.dName, this.dDescription});

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    oId = json['O_id'];
    dId = json['D_id'];
    dName = json['D_name'];
    dDescription = json['D_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['O_id'] = this.oId;
    data['D_id'] = this.dId;
    data['D_name'] = this.dName;
    data['D_description'] = this.dDescription;
    return data;
  }
}
