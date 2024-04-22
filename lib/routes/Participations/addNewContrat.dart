import 'package:date_field/date_field.dart';
import 'package:dossier/services/contratController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:supercharged/supercharged.dart';

class AddNewContrat extends GetView<ContratController> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController textEditingController = TextEditingController();
  final List<Map<String, dynamic>> items = [
    {"title": 'A_Item1', "value": '1885675802'},
    {"title": 'A_Item2', "value": '3605901217'},
    {"title": 'A_Item3', "value": '1886842418'},
    {"title": 'A_Item4', "value": '3799349667'},
    {"title": 'B_Item1', "value": '1468564568'},
    {"title": 'B_Item2', "value": '170604519'},
    {"title": 'B_Item3', "value": '2521220311'},
    {"title": 'B_Item4', "value": '4022129770'},
  ];
  Map payload = {};

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBuilderTextField(
              cursorHeight: 18,
              onSaved: (value) => payload['DESCRIPTION'] = value,
              onChanged: (value) => payload['DESCRIPTION'] = value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.max(70),
                (val) {
                  final number = int.tryParse(val ?? "");
                  if (number == null) return null;
                  if (number < 0) return 'We cannot have a negative age';
                  return null;
                },
              ]),
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Description'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'Description',
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderTextField(
              cursorHeight: 18,
              onSaved: (value) => payload['VERSION_TYPE'] = value,
              onChanged: (value) => payload['VERSION_TYPE'] = value,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('version_type'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'version_type',
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderTextField(
              cursorHeight: 18,
              onSaved: (value) => payload['CONTRACT_NUMBER'] = value,
              onChanged: (value) => payload['CONTRACT_NUMBER'] = value,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Contract number'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'contract_number',
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderFilePicker(
              name: "images",
              decoration: InputDecoration(labelText: "Attachments"),
              maxFiles: 2,
              previewImages: false,
              onChanged: (val) => print(val),
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: Row(
                    children: <Widget>[
                      Icon(Icons.add_circle),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Add documents"),
                      ),
                    ],
                  ),
                ),
              ],
              onFileLoading: (val) {
                print(val);
              },
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderDropdown(
              onSaved: (value) => payload['CONTRACT_TYPE_ID'] = value,
              onChanged: (value) => payload['CONTRACT_TYPE_ID'] = value,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Contract type'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'contract_type_id',
              items: [
                DropdownMenuItem(
                  child: Text('Item 2'),
                )
              ],
            ),
            SizedBox(width: 0, height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DateTimeFormField(
                      onSaved: (value) =>
                          payload['START_DATE'] = value?.toIso8601String(),
                      onChanged: (value) =>
                          payload['START_DATE'] = value?.toIso8601String(),
                      decoration: const InputDecoration(
                          labelText: 'Srart date',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: EdgeInsets.all(5),
                          filled: true),
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      mode: DateTimeFieldPickerMode.date),
                ),
                SizedBox(
                  height: 5,
                  width: 5,
                ),
                Expanded(
                  child: DateTimeFormField(
                      onSaved: (value) =>
                          payload['END_DATE'] = value?.toIso8601String(),
                      onChanged: (value) =>
                          payload['END_DATE'] = value?.toIso8601String(),
                      decoration: const InputDecoration(
                          labelText: 'End date',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: EdgeInsets.all(5),
                          filled: true),
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      mode: DateTimeFieldPickerMode.date),
                ),
              ],
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderTextField(
              cursorHeight: 18,
              onSaved: (value) => payload['ESTIMATED_AMOUNT'] = value,
              onChanged: (value) => payload['ESTIMATED_AMOUNT'] = value,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Estimated amount'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'estimated_amount',
            ),
            SizedBox(width: 0, height: 10),
            DateTimeFormField(
              onSaved: (value) =>
                  payload['DATE_APPROVED'] = value?.toIso8601String(),
              onChanged: (value) =>
                  payload['DATE_APPROVED'] = value?.toIso8601String(),
              decoration: const InputDecoration(
                  labelText: 'date_approved',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.all(5),
                  filled: true),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              mode: DateTimeFieldPickerMode.date,
            ),
            SizedBox(width: 0, height: 10),
            DateTimeFormField(
                onSaved: (value) =>
                    payload['DATETIME_CANCELED'] = value?.toIso8601String(),
                onChanged: (value) =>
                    payload['DATETIME_CANCELED'] = value?.toIso8601String(),
                decoration: const InputDecoration(
                    labelText: 'datetime_canceled',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    contentPadding: EdgeInsets.all(5),
                    filled: true),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                mode: DateTimeFieldPickerMode.date),
            SizedBox(width: 0, height: 10),
            FormBuilderDateTimePicker(
              initialDate: DateTime.now().add(const Duration(days: 10)),
              onSaved: (value) =>
                  payload['DATE_SIGNED'] = value?.toIso8601String(),
              onChanged: (value) =>
                  payload['DATE_SIGNED'] = value?.toIso8601String(),
              decoration: const InputDecoration(
                  labelText: 'Date signed',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.all(5),
                  filled: true),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              name: 'date_signed',
            ),
            SizedBox(width: 0, height: 10),
            DateTimeFormField(
              onSaved: (value) =>
                  payload['DATE_TERMINATED'] = value?.toIso8601String(),
              onChanged: (value) =>
                  payload['DATE_TERMINATED'] = value?.toIso8601String(),
              decoration: const InputDecoration(
                  labelText: 'date_terminated',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.all(5),
                  filled: true),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              mode: DateTimeFieldPickerMode.date,
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderTextField(
              onSaved: (value) => payload['STATUT'] = value,
              onChanged: (value) => payload['STATUT'] = value,
              cursorHeight: 18,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Statut'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'statut',
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderTextField(
              cursorHeight: 18,
              onSaved: (value) => payload['PERIODE_RECONDUCTION_JOURS'] = value,
              onChanged: (value) =>
                  payload['PERIODE_RECONDUCTION_JOURS'] = value,
              decoration: InputDecoration(
                  filled: true,
                  label: Text('Periode de reconduction (jour)'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'periode_reconduction_jours',
            ),
            SizedBox(width: 0, height: 10),
            FormBuilderDropdown(
              // cursorHeight: 18,
              onSaved: (value) => payload['CONTRAT_PARENT_ID'] = value,
              onChanged: (value) => payload['CONTRAT_PARENT_ID'] = value,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.dashed),
                  filled: true,
                  label: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('Contrat parent')),
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              name: 'contrat_parent_id',
              items: [
                DropdownMenuItem(
                  child: Text('Item 2'),
                )
              ],
            ),
            SizedBox(width: 0, height: 10),
            DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
              isExpanded: false,
              hint: Text(
                '${items.filter((el) => el['value'] == payload['PROJECT_ID'])}',
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item['value'],
                        child: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: payload['PROJECT_ID'],
              onChanged: (value) => payload['PROJECT_ID'] = items
                  .where((element) => element['value'] == value)
                  .first['value'],
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 280,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black26, width: 2)),
                    color: Colors.grey.withOpacity(.2)),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    // expands: true,
                    controller: textEditingController,
                    decoration: InputDecoration(
                        isDense: true,
                        // contentPadding: const EdgeInsets.symmetric(
                        //   horizontal: 10,
                        //   vertical: 8,
                        // ),
                        hintText: 'Project',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            )),
            SizedBox(width: 0, height: 10),
            // TextFormField(
            //   cursorHeight: 18,
            //   onSaved: (value) => payload['TYPE_PARTENARIAT_ID'] = value,
            //   onChanged: (value) => payload['TYPE_PARTENARIAT_ID'] = value,
            //   decoration: InputDecoration(
            //       filled: true,
            //       label: Text('Type de partenariat'),
            //       isDense: true,
            //       contentPadding: EdgeInsets.all(5),
            //       floatingLabelAlignment: FloatingLabelAlignment.start,
            //       floatingLabelBehavior: FloatingLabelBehavior.auto),
            // ),
            Container(
              height: 50,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();

                      print('Data: $payload');
                      controller.addNewContrat(payload);
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
