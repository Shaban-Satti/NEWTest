//  "Primary_Key": 1,
//     "O_id": "1",
//     "O_name": "Gastro-intestinal system",
//     "M_id": "m23",
//     "M_name": "Antimuscarinics",
//     "D_id": "11",
//     "D_name": "Dyspepsia and gastro-oesophageal reflux disease",
//     "Contra_id": "m1008",
//     "Contra_name": "Cefpodoxime"
class TaskModel {
  String? O_id;
  String? O_name;
  String? M_id;
  String? M_name;
  String? D_id;
  String? D_name;
  String? Contra_id;
  String? Contra_name;

  TaskModel({
    this.O_id,
    this.O_name,
    this.M_id,
    this.M_name,
    this.D_id,
    this.D_name,
    this.Contra_id,
    this.Contra_name,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    O_id = json['O_id'];
    O_name = json['O_name'];
    M_id = json['M_id'];
    M_name = json['M_name'];
    D_id = json['D_id'];
    D_name = json['D_name'];
    Contra_id = json['Contra_id'];
    Contra_name = json['Contra_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['O_id'] = this.O_id;
    data['O_name'] = this.O_name;
    data['M_id'] = this.M_id;
    data['M_name'] = this.M_name;
    data['D_id'] = this.D_id;
    data['D_name'] = this.D_name;
    data['Contra_id'] = this.Contra_id;
    data['Contra_name'] = this.Contra_name;

    return data;
  }
}
