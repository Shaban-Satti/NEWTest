// ignore_for_file: unnecessary_this, file_names, prefer_collection_literals, unnecessary_new

class Medicine {
  String? iD;
  int? oId;
  String? mId;
  String? mName;
  String? sName;

  Medicine({this.iD, this.oId, this.mId, this.mName, this.sName});

  Medicine.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    oId = json['O_id'];
    mId = json['M_id'];
    mName = json['M_name'];
    sName = json['S_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['O_id'] = this.oId;
    data['M_id'] = this.mId;
    data['M_name'] = this.mName;
    data['S_name'] = this.sName;
    return data;
  }
}
