// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Api_Calling/Api_Function.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Contra_Indication.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Generic_Medicine.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Medicine_Details.dart';

import 'package:bnf_conversion_to_db/Screen/Medicine_Details_Screen/Toast_Message.dart';
import 'package:flutter/material.dart';


var m4, m4name;

class M4_OptionScreen extends StatefulWidget {
  const M4_OptionScreen({super.key});

  @override
  State<M4_OptionScreen> createState() => _M4_OptionScreenState();
}

class _M4_OptionScreenState extends State<M4_OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            m4name,
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
                        getMedDetails(m4).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const M4_MedicineDetailsScreen(),
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
                        getSubMed(m4).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const M4_SubSection_Screen()));
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
                        getSubMed(m4).then(
                          (result) {
                            if (result != null && result.length > 0) {
                              // Navigate to the next screen if the result is not empty

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const M4_ContraIndication_Screen()));
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
