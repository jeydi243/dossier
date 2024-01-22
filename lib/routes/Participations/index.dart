// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dossier/datasources/partenairesDS.dart';
import 'package:dossier/models/partenaire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class IndexParticipation extends StatefulWidget {
  const IndexParticipation({super.key});

  @override
  State<IndexParticipation> createState() => _IndexParticipationState();
}

class _IndexParticipationState extends State<IndexParticipation> {
  List<Map<String, dynamic>> myTabs = [
    {
      "title": "Partenaires",
      "icon": Icon(Icons.directions_car),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": "Phases",
      "icon": Icon(Icons.directions_transit),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": "Permis",
      "icon": Icon(Icons.directions_bike),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": "Revenus",
      "icon": Icon(Icons.directions_boat),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": "Production",
      "icon": Icon(Icons.directions_boat),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": 'Representant',
      "icon": Icon(Icons.directions_boat),
      "component": Container(color: Colors.white),
      "color": Colors.red
    },
    {
      "title": 'Reunion',
      "icon": Icon(Icons.directions_boat),
      "component": Container(color: Colors.white),
      "color": Colors.red
    }
  ];
  List<Partenaire> partenaires = <Partenaire>[];

  late PartenaireDataSource partDS;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    partenaires = getPartenaires();
    partDS = PartenaireDataSource(partenaires: partenaires);
  }

  List<Partenaire> getPartenaires() {
    return [
      Partenaire(
          description: 'KCC',
          designation: 'KCC',
          id: 10001,
          name: 'John',
          capital_social_cdf: 10000),
      Partenaire(
          description: 'MMG',
          designation: 'MMG',
          id: 10002,
          name: 'Podle',
          capital_social_cdf: 10000),
      Partenaire(
          description: 'STL',
          designation: 'STL',
          id: 10003,
          name: 'John',
          capital_social_cdf: 10000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 7,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 244, 246, 247),
          body: Row(
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.teal),
                  height: Get.height,
                  width: Get.size.width * .2),
              Container(
                width: Get.size.width * .8,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        ...myTabs.map((e) => Tab(text: e['title'])).toList(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(children: [
                        ...myTabs
                            .map((e) => Container(
                                  color: Colors.white,
                                  child: SfDataGrid(
                                    source: partDS,
                                    
                                    columns: [
                                      GridColumn(
                                          columnName: 'id',
                                          label: Container(
                                              padding: EdgeInsets.all(16.0),
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'ID',
                                              ))),
                                      GridColumn(
                                          columnName: 'name',
                                          label: Container(
                                              padding: EdgeInsets.all(16.0),
                                              alignment: Alignment.centerLeft,
                                              child: Text('Name'))),
                                      GridColumn(
                                          columnName: 'designation',
                                          width: 120,
                                          label: Container(
                                              padding: EdgeInsets.all(16.0),
                                              alignment: Alignment.centerLeft,
                                              child: Text('Designation'))),
                                      GridColumn(
                                          columnName: 'capital_social_cdf',
                                          label: Container(
                                              padding: EdgeInsets.all(16.0),
                                              alignment: Alignment.centerRight,
                                              child: Text('capital_social_cdf'))),
                                    ],
                                  ),
                                ))
                            .toList()
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
