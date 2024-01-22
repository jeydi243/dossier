// ignore_for_file: override_on_non_overriding_member

import 'package:dossier/models/partenaire.dart';
import 'package:flutter/material.dart';
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
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
