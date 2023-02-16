// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Organs_Screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'BNF',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(15), //fromLTRB(20, 20, 20, 20),
              child: const Text(
                  'BNF (British National Formulary) is a pharmaceutical reference book containing a wide spectrum of information and details about human ograns system there diseases and there medicines, including indication, symptoms,contra-indications, company, side effects, dosages,name and generic formulations. ',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                  ))),
          const SizedBox(
            height: 250,
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrgansScreen())),
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
