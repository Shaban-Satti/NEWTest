// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:bnf_conversion_to_db/Screen/M3/Details_Option_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';
import '../../Models/Medicine_Subsectin_Model.dart';

class M3_SubSection_Screen extends StatefulWidget {

  const M3_SubSection_Screen({super.key});

  @override
  State<M3_SubSection_Screen> createState() => _M3_SubSection_ScreenState();
}

class _M3_SubSection_ScreenState extends State<M3_SubSection_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generic Medicine',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getSubMed(m3),
                builder: (context,
                    AsyncSnapshot<List<Medicine_Subsection>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: submedlst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (() {
                                    setState(() {
                                      m4 = snapshot.data![index].subId
                                          .toString();
                                      m4name = snapshot.data![index].subName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                M4_OptionScreen()));
                                  }),
                                  title: Text(
                                      snapshot.data![index].subName.toString()),
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
