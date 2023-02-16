
// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/M3/Details_Option_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';

class M3_ContraIndication_Screen extends StatefulWidget {
  const M3_ContraIndication_Screen({super.key});

  @override
  State<M3_ContraIndication_Screen> createState() =>
      _M3_ContraIndication_ScreenState();
}

class _M3_ContraIndication_ScreenState extends State<M3_ContraIndication_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(m3name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ContraIndication(m3),
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
                                      m4 =
                                          snapshot.data![index].mId.toString();
                                      m4name = snapshot.data![index].mName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const M4_OptionScreen()));
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
