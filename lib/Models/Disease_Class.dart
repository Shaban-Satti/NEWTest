// ignore_for_file: file_names, unnecessary_this, unnecessary_new, prefer_collection_literals

class DiseaseClassModel {
  String? oId;
  String? dId;
  String? dCId;
  String? dCName;
  String? dCDescription;

  DiseaseClassModel(
      {this.oId, this.dId, this.dCId, this.dCName, this.dCDescription});

  DiseaseClassModel.fromJson(Map<String, dynamic> json) {
    oId = json['O_id'];
    dId = json['D_id'];
    dCId = json['DC_id'];
    dCName = json['DC_name'];
    dCDescription = json['DC_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['O_id'] = this.oId;
    data['D_id'] = this.dId;
    data['DC_id'] = this.dCId;
    data['DC_name'] = this.dCName;
    data['DC_description'] = this.dCDescription;
    return data;
  }
}
