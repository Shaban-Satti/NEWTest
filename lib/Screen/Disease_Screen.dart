// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Disease_Model.dart';
import 'Diseases_Class_Screen.dart';
import 'Medicine.dart';
import 'Organs_Screen.dart';

var Did, dname;
var dcid;

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          oname,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getdisease(Did),
                builder: (context, AsyncSnapshot<List<DiseaseModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: Diseaselst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                onTap: () {
                                  DiseaseModel apimodel = snapshot.data![index];
                                  dcid = apimodel.dId.toString();
                                  dname = apimodel.dName.toString();
                                  DCid = dcid;
                                  medid = dcid;
                                  //print(DCid);
                                  getdiseaseclass(DCid).then((result) {
                                    if (result != null && result.length > 0) {
                                      // Navigate to the next screen if the result is not empty
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DiseasesClassScreen(),
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
                                title: Text(
                                    snapshot.data![index].dName.toString()),
                                subtitle: Text(snapshot
                                    .data![index].dDescription
                                    .toString()),
                              ),
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
