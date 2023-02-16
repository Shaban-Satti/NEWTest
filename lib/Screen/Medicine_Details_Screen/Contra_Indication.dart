// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/M1/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';

import '../Medicine.dart';

class ContraIndication_Screen extends StatefulWidget {
  const ContraIndication_Screen({super.key});

  @override
  State<ContraIndication_Screen> createState() =>
      _ContraIndication_ScreenState();
}

class _ContraIndication_ScreenState extends State<ContraIndication_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mmname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ContraIndication(medid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<intraction>? interactions = snapshot.data;
                    return ListView.builder(
                        itemCount: interactions!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (() {
                                    setState(() {
                                      m1 = snapshot.data![index].mId.toString();
                                      m1name = snapshot.data![index].mName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const M1_OptionScreen()));
                                  }),
                                  title: Text(
                                      snapshot.data![index].medName.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].mDiscription
                                      .toString()),
                                ),
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
