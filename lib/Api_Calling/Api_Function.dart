// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:bnf_conversion_to_db/Models/Task.dart';
import 'package:http/http.dart' as http;
import '../Models/Contra_Indicaton_Model.dart';
import '../Models/Disease_Class.dart';
import '../Models/Disease_Model.dart';
import '../Models/Injection_Level4.dart';
import '../Models/Medicine_Details.Model.dart';
import '../Models/Medicine_Model.dart';
import '../Models/Medicine_Subsectin_Model.dart';
import '../Models/Organs_Model.dart';
import '../Models/Search_Model.dart';

//192.168.18.82 GlobalXoft 172.18.112.1
//192.168.229.242 My Mobile
//192.168.1.102
String baseurl = 'http://192.168.43.242/BNFConversionToDB/api/Home';
List<OrganModel> Orglst = [];
Future<List<OrganModel>> getOrgans() async {
  final response = await http.get(Uri.parse('$baseurl/Organs'));
  var data = jsonDecode(response.body.toString());
  // print(response);
  if (response.statusCode == 200) {
    Orglst.clear();
    for (Map i in data) {
      OrganModel org = OrganModel(O_id: i['O_id'], O_name: i['O_name']);
      Orglst.add(org);
    }
    return Orglst;
  } else {
    return Orglst;
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
List<DiseaseModel> Diseaselst = [];
Future<List<DiseaseModel>> getdisease(String x) async {
  final response = await http.get(Uri.parse('$baseurl/Disease/?num=$x'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    Diseaselst.clear();
    for (Map i in data) {
      DiseaseModel disease = DiseaseModel(
          oId: i['O_id'],
          dId: i['D_id'],
          dName: i['D_name'],
          dDescription: i['D_description']);
      Diseaselst.add(disease);
    }
    return Diseaselst;
  } else {
    return Diseaselst;
  }
}

////////////////////////////////////////////////////////////////////////////////////////
List<DiseaseClassModel> diseasclass = [];
Future<List<DiseaseClassModel>> getdiseaseclass(String x) async {
  final response = await http.get(Uri.parse('$baseurl/DiseaseClass/?num=$x'));

  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    diseasclass.clear();
    for (Map i in data) {
      DiseaseClassModel dis = DiseaseClassModel(
          oId: i['O_id'],
          dId: i['D_id'],
          dCId: i['DC_id'],
          dCName: i['DC_name'],
          dCDescription: i['DC_description']);
      diseasclass.add(dis);
    }
    return diseasclass;
  } else {
    return diseasclass;
  }
}

////////////////////////////////////////////////////////////////////////////////////////
List<MedicineModel> medicinelst = [];
Future<List<MedicineModel>> getMedicine(String x) async {
  final response = await http.get(Uri.parse('$baseurl/Level4/?num=$x '));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    medicinelst.clear();
    for (Map i in data) {
      MedicineModel med = MedicineModel(
        oId: i['O_id'],
        dId: i['D_id'],
        dCId: i['DC_id'],
        mId: i['M_id'],
        mName: i['M_name'],
        mDescription: i['M_description'],
      );
      medicinelst.add(med);
    }
    return medicinelst;
  } else {
    return medicinelst;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////
List<Medicine> mainlst = [];
Future<List<Medicine>> getMed(String x) async {
  final response = await http.get(Uri.parse('$baseurl/MainMedicine?num=$x'));
  var data = jsonDecode(response.body.toString());
  // print(data);

  if (response.statusCode == 200) {
    mainlst.clear();
    for (Map i in data) {
      Medicine dic = Medicine(
        iD: i['ID'],
        oId: i['O_id'],
        mId: i['M_id'],
        mName: i['M_name'],
        sName: i['S_name'],
      );
      mainlst.add(dic);
    }
    return mainlst;
  } else {
    return mainlst;
  }
}

/////////////////////////////////////////////////////////////////
///
List<MedicineDetails> detailslst = [];
Future<List<MedicineDetails>> getMedDetails(String x) async {
  //print(x);
  final response =
      await http.get(Uri.parse("$baseurl/Medicines_Details?num='$x'"));
  var data = jsonDecode(response.body.toString());
  //print(data);

  if (response.statusCode == 200) {
    detailslst.clear();
    for (Map i in data) {
      MedicineDetails dic = MedicineDetails(
        medId: i['Med_id'],
        medName: i['Med_name'],
        medCompany: i['Med_Company'],
        medIndications: i['Med_Indications'],
        medCautions: i['Med_Cautions'],
        medContraIndications: i['Med_Contra_Indications'],
        medSideEffects: i['Med_Side_effects'],
        medDose: i['Med_Dose'],
        medDescription: i['Med_Description'],
      );
      detailslst.add(dic);
    }
    return detailslst;
  } else {
    return detailslst;
  }
}

/////////////////////////////////////
List<Medicine_Subsection> submedlst = [];
Future<List<Medicine_Subsection>> getSubMed(String x) async {
  final response =
      await http.get(Uri.parse("$baseurl/Medicine_Subsection?num='$x'"));
  var data = jsonDecode(response.body.toString());
  //print(data);

  if (response.statusCode == 200) {
    submedlst.clear();
    for (Map i in data) {
      Medicine_Subsection dic = Medicine_Subsection(
        iD: i['ID'],
        medId: i['med_id'],
        subId: i['sub_id'],
        medName: i['Med_name'],
        subName: i['sub_name'],
      );
      submedlst.add(dic);
    }
    return submedlst;
  } else {
    return submedlst;
  }
}
//////////////////

Future<List<maintable>> fetchMaintable() async {
  final response = await http.get(Uri.parse('$baseurl/Search'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> jsonList = json.decode(response.body);
    List<maintable> maintables =
        jsonList.map((i) => maintable.fromJson(i)).toList();
    return maintables;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load maintable');
  }
}

///////////////////////////////
Future<List<intraction>> ContraIndication(String x) async {
  final response =
      await http.get(Uri.parse("$baseurl/Medicine_Interaction?num='$x'"));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> jsonList = json.decode(response.body);
    List<intraction> maintables =
        jsonList.map((i) => intraction.fromJson(i)).toList();
    return maintables;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load maintable');
  }
}
//=================================

Future<List<intraction>> Interaction() async {
  final response = await http.get(Uri.parse("$baseurl/Interaction"));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> jsonList = json.decode(response.body);
    List<intraction> maintables =
        jsonList.map((i) => intraction.fromJson(i)).toList();
    return maintables;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load maintable');
  }
}

//////////////////////////////////////////////////////
///
///task
Future<List<TaskModel>> task() async {
  final response = await http.get(Uri.parse("$baseurl/Task"));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> jsonList = json.decode(response.body);
    List<TaskModel> maintables =
        jsonList.map((i) => TaskModel.fromJson(i)).toList();
    return maintables;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load maintable');
  }
}
