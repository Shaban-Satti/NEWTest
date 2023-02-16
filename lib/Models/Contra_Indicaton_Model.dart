// ignore_for_file: camel_case_types, file_names, unnecessary_this, unnecessary_new, prefer_collection_literals

class intraction {
  String? primaryKey;
  String? mId;
  String? mName;
  String? medId;
  String? medName;
  String? mDiscription;

  intraction(
      {this.primaryKey,
      this.mId,
      this.mName,
      this.medId,
      this.medName,
      this.mDiscription});

  intraction.fromJson(Map<String, dynamic> json) {
    primaryKey = json['Primary_Key'];
    mId = json['m_id'];
    mName = json['m_name'];
    medId = json['med_id'];
    medName = json['med_name'];
    mDiscription = json['m_discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Primary_Key'] = this.primaryKey;
    data['m_id'] = this.mId;
    data['m_name'] = this.mName;
    data['med_id'] = this.medId;
    data['med_name'] = this.medName;
    data['m_discription'] = this.mDiscription;
    return data;
  }
}
