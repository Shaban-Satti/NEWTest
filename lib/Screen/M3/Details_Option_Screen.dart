// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Api_Calling/Api_Function.dart';
import 'package:bnf_conversion_to_db/Screen/M3/Contra_Indication.dart';
import 'package:bnf_conversion_to_db/Screen/M3/Generic_Medicine.dart';
import 'package:bnf_conversion_to_db/Screen/M3/Medicine_Details.dart';

import 'package:bnf_conversion_to_db/Screen/Medicine_Details_Screen/Toast_Message.dart';
import 'package:flutter/material.dart';

var m3, m3name;

class M3_OptionScreen extends StatefulWidget {
  const M3_OptionScreen({super.key});

  @override
  State<M3_OptionScreen> createState() => _M3_OptionScreenState();
}

class _M3_OptionScreenState extends State<M3_OptionScreen> {
  @override
  Widget build(BuildContext context) {
    //print('M1 ID ============' + m3);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            m3name,
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: ListTile(
                      onTap: () {
                        getMedDetails(m3).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      M3_MedicineDetailsScreen(),
                                ),
                              );
                            } else {
                              Utils().toastMassage('No Details');
                            }
                          },
                        );
                      },
                      title: const Text(
                        'Medicine Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                Card(
                  child: ListTile(
                      onTap: () {
                        getSubMed(m3).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const M3_SubSection_Screen()));
                            } else {
                              Utils().toastMassage('No More Subsection');
                              // Navigate to another screen if the result is empty

                            }
                          },
                        );
                      },
                      title: const Text(
                        'Generic Medicine',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                Card(
                  child: ListTile(
                      onTap: () {
                        ContraIndication(m3).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const M3_ContraIndication_Screen()));
                            } else {
                              // Utils()
                              //     .toastMassage('Contra-Indication Not Exist');
                              // Navigate to another screen if the result is empty

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Text(
                                        'Contra-Indication Not Exist',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: (Colors.red)));
                            }
                          },
                        );
                      },
                      title: const Text(
                        'Drug To Drug Contra-Indication',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
