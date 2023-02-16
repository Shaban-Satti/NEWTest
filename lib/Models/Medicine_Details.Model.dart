// ignore_for_file: unnecessary_this

class MedicineDetails {
  String? medId;
  String? medName;
  String? medCompany;
  String? medIndications;
  String? medCautions;
  String? medContraIndications;
  String? medSideEffects;
  String? medDose;
  String? medDescription;

  MedicineDetails(
      {this.medId,
      this.medName,
      this.medCompany,
      this.medIndications,
      this.medCautions,
      this.medContraIndications,
      this.medSideEffects,
      this.medDose,
      this.medDescription});

  MedicineDetails.fromJson(Map<String, dynamic> json) {
    medId = json['Med_id'];
    medName = json['Med_name'];
    medCompany = json['Med_Company'];
    medIndications = json['Med_Indications'];
    medCautions = json['Med_Cautions'];
    medContraIndications = json['Med_Contra_Indications'];
    medSideEffects = json['Med_Side_effects'];
    medDose = json['Med_Dose'];
    medDescription = json['Med_Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Med_id'] = this.medId;
    data['Med_name'] = this.medName;
    data['Med_Company'] = this.medCompany;
    data['Med_Indications'] = this.medIndications;
    data['Med_Cautions'] = this.medCautions;
    data['Med_Contra_Indications'] = this.medContraIndications;
    data['Med_Side_effects'] = this.medSideEffects;
    data['Med_Dose'] = this.medDose;
    data['Med_Description'] = this.medDescription;
    return data;
  }
}
