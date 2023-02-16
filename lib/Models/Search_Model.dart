// ignore_for_file: camel_case_types, unnecessary_this

class maintable {
  String? primaryKey;
  String? oId;
  String? oName;
  String? oId2;
  String? dId;
  String? dName;
  String? dDiscription;
  String? oId3;
  String? dId2;
  String? dCId;
  String? dCName;
  String? dCDescription;
  String? oId4;
  String? dId3;
  String? dCId2;
  String? mId;
  String? mName;
  String? mDescription;
  String? oId5;
  String? mId2;
  String? mName2;
  String? medId;
  String? medName;
  String? medCompany;
  String? medIndications;
  String? medCautions;
  String? medContraIndications;
  String? medSideEffects;
  String? medDose;
  String? medDescription;
  String? medId2;
  String? subId;
  String? subName;
  String? medId3;
  String? medName1;
  String? medCompany2;
  String? medIndications2;
  String? medCautions2;
  String? medContraIndications2;
  String? medSideEffects2;
  String? medDose2;
  String? medDescription2;

  maintable(
      {this.primaryKey,
      this.oId,
      this.oName,
      this.oId2,
      this.dId,
      this.dName,
      this.dDiscription,
      this.oId3,
      this.dId2,
      this.dCId,
      this.dCName,
      this.dCDescription,
      this.oId4,
      this.dId3,
      this.dCId2,
      this.mId,
      this.mName,
      this.mDescription,
      this.oId5,
      this.mId2,
      this.mName2,
      this.medId,
      this.medName,
      this.medCompany,
      this.medIndications,
      this.medCautions,
      this.medContraIndications,
      this.medSideEffects,
      this.medDose,
      this.medDescription,
      this.medId2,
      this.subId,
      this.subName,
      this.medId3,
      this.medName1,
      this.medCompany2,
      this.medIndications2,
      this.medCautions2,
      this.medContraIndications2,
      this.medSideEffects2,
      this.medDose2,
      this.medDescription2});

  maintable.fromJson(Map<String, dynamic> json) {
    primaryKey = json['Primary_Key'];
    oId = json['O_id'];
    oName = json['O_name'];
    oId2 = json['O_id2'];
    dId = json['D_id'];
    dName = json['D_name'];
    dDiscription = json['D_discription'];
    oId3 = json['O_id3'];
    dId2 = json['D_id2'];
    dCId = json['DC_id'];
    dCName = json['DC_name'];
    dCDescription = json['DC_description'];
    oId4 = json['O_id4'];
    dId3 = json['D_id3'];
    dCId2 = json['DC_id2'];
    mId = json['M_id'];
    mName = json['M_name'];
    mDescription = json['M_description'];
    oId5 = json['O_id5'];
    mId2 = json['M_id2'];
    mName2 = json['M_name2'];
    medId = json['Med_id'];
    medName = json['Med_name'];
    medCompany = json['Med_Company'];
    medIndications = json['Med_Indications'];
    medCautions = json['Med_Cautions'];
    medContraIndications = json['Med_Contra_Indications'];
    medSideEffects = json['Med_Side_effects'];
    medDose = json['Med_Dose'];
    medDescription = json['Med_Description'];
    medId2 = json['med_id2'];
    subId = json['sub_id'];
    subName = json['sub_name'];
    medId3 = json['Med_id3'];
    medName1 = json['Med_name1'];
    medCompany2 = json['Med_Company2'];
    medIndications2 = json['Med_Indications2'];
    medCautions2 = json['Med_Cautions2'];
    medContraIndications2 = json['Med_Contra_Indications2'];
    medSideEffects2 = json['Med_Side_effects2'];
    medDose2 = json['Med_Dose2'];
    medDescription2 = json['Med_Description2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Primary_Key'] = this.primaryKey;
    data['O_id'] = this.oId;
    data['O_name'] = this.oName;
    data['O_id2'] = this.oId2;
    data['D_id'] = this.dId;
    data['D_name'] = this.dName;
    data['D_discription'] = this.dDiscription;
    data['O_id3'] = this.oId3;
    data['D_id2'] = this.dId2;
    data['DC_id'] = this.dCId;
    data['DC_name'] = this.dCName;
    data['DC_description'] = this.dCDescription;
    data['O_id4'] = this.oId4;
    data['D_id3'] = this.dId3;
    data['DC_id2'] = this.dCId2;
    data['M_id'] = this.mId;
    data['M_name'] = this.mName;
    data['M_description'] = this.mDescription;
    data['O_id5'] = this.oId5;
    data['M_id2'] = this.mId2;
    data['M_name2'] = this.mName2;
    data['Med_id'] = this.medId;
    data['Med_name'] = this.medName;
    data['Med_Company'] = this.medCompany;
    data['Med_Indications'] = this.medIndications;
    data['Med_Cautions'] = this.medCautions;
    data['Med_Contra_Indications'] = this.medContraIndications;
    data['Med_Side_effects'] = this.medSideEffects;
    data['Med_Dose'] = this.medDose;
    data['Med_Description'] = this.medDescription;
    data['med_id2'] = this.medId2;
    data['sub_id'] = this.subId;
    data['sub_name'] = this.subName;
    data['Med_id3'] = this.medId3;
    data['Med_name1'] = this.medName1;
    data['Med_Company2'] = this.medCompany2;
    data['Med_Indications2'] = this.medIndications2;
    data['Med_Cautions2'] = this.medCautions2;
    data['Med_Contra_Indications2'] = this.medContraIndications2;
    data['Med_Side_effects2'] = this.medSideEffects2;
    data['Med_Dose2'] = this.medDose2;
    data['Med_Description2'] = this.medDescription2;
    return data;
  }
}
