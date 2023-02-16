// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Screen/Medicine_Details_Screen/Generic_Medicine.dart';
import 'package:bnf_conversion_to_db/Screen/Medicine_Details_Screen/Medicine_Details.dart';
import 'package:bnf_conversion_to_db/Screen/Medicine_Details_Screen/Toast_Message.dart';
import 'package:flutter/material.dart';

import '../Api_Calling/Api_Function.dart';
import 'Medicine.dart';
import 'Medicine_Details_Screen/Contra_Indication.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
   // print('option screen id' + medid);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            mmname,
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
                        getMedDetails(medid).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicineDetailsScreen(),
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
                        getSubMed(medid).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SubSection_Screen()));
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
                        ContraIndication(medid).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ContraIndication_Screen()));
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
