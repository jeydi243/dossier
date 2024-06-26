// ignore_for_file: override_on_non_overriding_member

import 'package:dossier/models/Partenaire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PartenaireDataSource extends DataGridSource {
  PartenaireDataSource({required List<Partenaire> partenaires}) {
    _partenaires = partenaires
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(
                  columnName: 'capital_social_cdf',
                  value: e.capital_social_cdf),
              DataGridCell<Map<String, dynamic>>(
                  columnName: 'actions', value: e.toJson()),
            ]))
        .toList();
  }

  List<DataGridRow> _partenaires = [];

  @override
  List<DataGridRow> get rows => _partenaires;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'id' ||
                dataGridCell.columnName == 'capital_social_cdf')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'actions'
            ? ElevatedButton(
                onPressed: () {
                  print(dataGridCell.value);
                  openModal();
                },
                child: Text('Edit'),
              )
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }

  openModal() async {
    // Get.snackbar('Lerler', "A verifier");
    await Get.defaultDialog(
        content: Container(
      child: Text('Le text'),
    ));
  }
}
