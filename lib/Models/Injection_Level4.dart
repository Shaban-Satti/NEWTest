// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class MedicineModel {
  String? oId;
  String? dId;
  String? dCId;
  String? mId;
  String? mName;
  String? mDescription;

  MedicineModel(
      {this.oId, this.dId, this.dCId, this.mId, this.mName, this.mDescription});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    oId = json['O_id'];
    dId = json['D_id'];
    dCId = json['DC_id'];
    mId = json['M_id'];
    mName = json['M_name'];
    mDescription = json['M_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['O_id'] = this.oId;
    data['D_id'] = this.dId;
    data['DC_id'] = this.dCId;
    data['M_id'] = this.mId;
    data['M_name'] = this.mName;
    data['M_description'] = this.mDescription;
    return data;
  }
}
