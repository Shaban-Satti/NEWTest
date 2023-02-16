import 'dart:convert';

import 'package:bnf_conversion_to_db/Api_Calling/Api_Function.dart';
import 'package:bnf_conversion_to_db/Models/Search_Model.dart';
import 'package:bnf_conversion_to_db/Models/Task.dart';
import 'package:bnf_conversion_to_db/Screen/Disease_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/Organs_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String? o1, d1, m1, c1;
var mm22;

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    print('M1' + o1.toString());
    print('M2' + d1.toString());
    print('M3' + m1.toString());
    print('M4' + c1.toString());

    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: task(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TaskModel>? taskdata = snapshot.data;
                    return ListView.builder(
                        itemCount: taskdata!.length,
                        itemBuilder: (context, index) {
                          if (o1.toString().contains(snapshot
                                  .data![index].O_name
                                  .toString()
                                  .toLowerCase()) &&
                              o1.toString().isEmpty &&
                              m1.toString().isEmpty &&
                              d1.toString().isEmpty &&
                              c1.toString().isEmpty) {
                            return snapshot.data![index].O_name.toString() != ''
                                ? ListTile(
                                    //title: Text('Organ Name'),
                                    onTap: () {
                                      id = Text(snapshot.data![index].O_id
                                          .toString());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DiseaseScreen()));
                                    },
                                    subtitle: Text(snapshot.data![index].O_name
                                        .toString()),
                                  )
                                : Container();
                          }
                          if (snapshot.data![index].D_name
                              .toString()
                              .toLowerCase()
                              .contains(d1.toString())) {
                            return snapshot.data![index].D_name.toString() != ''
                                ? ListTile(
                                    onTap: () {
                                      Text(snapshot.data![index].D_name
                                          .toString());
                                    },
                                    subtitle: Text(snapshot.data![index].D_name
                                        .toString()),
                                  )
                                : Container();
                          }
                          if (snapshot.data![index].M_name
                              .toString()
                              .toLowerCase()
                              .contains(m1.toString())) {
                            return snapshot.data![index].M_name.toString() != ''
                                ? ListTile(
                                    subtitle: Text(snapshot.data![index].M_name
                                        .toString()),
                                  )
                                : Container();
                          }
                          if (snapshot.data![index].M_name
                              .toString()
                              .toLowerCase()
                              .contains(c1.toString())) {
                            return snapshot.data![index].Contra_name
                                        .toString() !=
                                    ''
                                ? ListTile(
                                    subtitle: Text(snapshot
                                        .data![index].Contra_name
                                        .toString()),
                                  )
                                : Container();
                          }
                          if (o1.toString().isEmpty &&
                              m1.toString().isEmpty &&
                              d1.toString().isEmpty &&
                              c1.toString().isEmpty) {
                            return Container();
                          } else
                            return Container();
                          //if(snapshot.data![index].O_name.toString().toLowerCase().contains(o1.toString()))
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
