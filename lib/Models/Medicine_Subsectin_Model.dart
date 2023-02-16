// ignore_for_file: unnecessary_this, file_names

class Medicine_Subsection {
  String? iD;
  String? medId;
  String? subId;
  String? medName;
  String? subName;

  Medicine_Subsection(
      {this.iD, this.medId, this.subId, this.medName, this.subName});

  Medicine_Subsection.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    medId = json['med_id'];
    subId = json['sub_id'];
    medName = json['Med_name'];
    subName = json['sub_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['med_id'] = this.medId;
    data['sub_id'] = this.subId;
    data['Med_name'] = this.medName;
    data['sub_name'] = this.subName;
    return data;
  }
}
