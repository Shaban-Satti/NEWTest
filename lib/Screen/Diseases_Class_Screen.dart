// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Disease_Class.dart';
import 'Disease_Screen.dart';
import 'Injection_Level4.dart';
import 'Medicine.dart';

var DCid, dcname;
var mmid;

class DiseasesClassScreen extends StatefulWidget {
  const DiseasesClassScreen({super.key});

  @override
  State<DiseasesClassScreen> createState() => _DiseasesClassScreenState();
}

class _DiseasesClassScreenState extends State<DiseasesClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dname,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getdiseaseclass(DCid),
                builder:
                    (context, AsyncSnapshot<List<DiseaseClassModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: diseasclass.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: ListTile(
                              onTap: () {
                                DiseaseClassModel apimodel =
                                    snapshot.data![index];
                                mmid = apimodel.dCId.toString();
                                dcname = apimodel.dCName.toString();
                                mid = mmid;
                                medid = mmid;
                               // print(mid);
                                getMedicine(mid).then((result) {
                                  if (result != null && result.length > 0) {
                                    // Navigate to the next screen if the result is not empty
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MedicineScreen(),
                                      ),
                                    );
                                  } else {
                                    // Navigate to another screen if the result is empty
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainMedicineScreen(),
                                      ),
                                    );
                                  }
                                });
                              },
                              title:
                                  Text(snapshot.data![index].dCName.toString()),
                              subtitle: Text(snapshot.data![index].dCDescription
                                  .toString()),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
