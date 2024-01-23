// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dossier/datasources/partenairesDS.dart';
import 'package:dossier/models/Partenaire.dart';
import 'package:dossier/routes/Participations/addNewContrat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
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
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late PartenaireDataSource partDS;
  final OverlayPortalController _tooltipController = OverlayPortalController();

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
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  OverlayPortal(
                    controller: _tooltipController,
                    overlayChildBuilder: (BuildContext context) {
                      return PlayAnimationBuilder(
                          tween: Tween<double>(begin: 1.5, end: 1),
                          duration: 100.milliseconds,
                          builder: (ctx, value, _) {
                            return BlurryContainer(
                              blur: 5,
                              child: FractionallySizedBox(
                                alignment: Alignment(value, 1),
                                widthFactor: .2,
                                heightFactor: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                  ),
                                  width: 100,
                                  height: 300,
                                  child: GestureDetector(
                                    child: AddNewContrat(),
                                    onTap: () {
                                      _tooltipController.hide();
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          onCompleted: () {
                            // do something ...
                            print('Animation finish...');
                          });
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.teal),
                        height: Get.height,
                        width: constraints.maxWidth * .2),
                  ),
                  Container(
                    width: constraints.maxWidth * .8,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            ...myTabs
                                .map((e) => Tab(text: e['title']))
                                .toList(),
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
                                        allowSorting: true,
                                        allowMultiColumnSorting: true,
                                        gridLinesVisibility:
                                            GridLinesVisibility.none,
                                        selectionMode: SelectionMode.single,
                                        onCellTap: (f) {
                                          // _key.currentState?.toggle();
                                          _tooltipController.toggle();
                                        },
                                        verticalScrollPhysics:
                                            BouncingScrollPhysics(),
                                        columns: [
                                          GridColumn(
                                              columnName: 'id',
                                              label: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    'ID',
                                                  ))),
                                          GridColumn(
                                              columnName: 'name',
                                              label: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text('Name'))),
                                          GridColumn(
                                              columnName: 'designation',
                                              width: 120,
                                              label: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text('Designation'))),
                                          GridColumn(
                                              columnName: 'capital_social_cdf',
                                              label: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                      'capital_social_cdf'))),
                                          GridColumn(
                                              columnName: 'actions',
                                              label: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  alignment: Alignment.center,
                                                  child: Text('Actions'))),
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
              );
            },
          ),
        ));
  }
}
