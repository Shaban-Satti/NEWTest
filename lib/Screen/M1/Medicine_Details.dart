// ignore_for_file: file_names, unused_import, camel_case_types
import 'package:bnf_conversion_to_db/Screen/M1/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';
import '../../Models/Medicine_Details.Model.dart';


class M1_MedicineDetailsScreen extends StatefulWidget {
  const M1_MedicineDetailsScreen({super.key});

  @override
  State<M1_MedicineDetailsScreen> createState() => _M1_MedicineDetailsScreenState();
}

class _M1_MedicineDetailsScreenState extends State<M1_MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getMedDetails(m1),
                builder:
                    (context, AsyncSnapshot<List<MedicineDetails>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: detailslst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                Card(
                                    child: ListTile(
                                  title: Text(
                                      snapshot.data![index].medName.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].medCompany
                                      .toString()),
                                )
                                ),
                                snapshot.data![index].medDescription
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine Description'),
                                        subtitle: Text(snapshot
                                            .data![index].medDescription
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medDose.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Dose'),
                                        subtitle: Text(snapshot
                                            .data![index].medDose
                                            .toString()))
                                    : Container(),
                                snapshot.data![index].medCompany.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Company'),
                                        subtitle: Text(snapshot
                                            .data![index].medCompany
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medIndications
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine Indication'),
                                        subtitle: Text(snapshot
                                            .data![index].medIndications
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medCautions.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Cautions'),
                                        subtitle: Text(snapshot
                                            .data![index].medCautions
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medContraIndications
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text(
                                            'Medicine ContraIndicaion'),
                                        subtitle: Text(snapshot
                                            .data![index].medContraIndications
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medSideEffects
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine SideEffect'),
                                        subtitle: Text(snapshot
                                            .data![index].medSideEffects
                                            .toString()),
                                      )
                                    : Container(),
                              ],
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
