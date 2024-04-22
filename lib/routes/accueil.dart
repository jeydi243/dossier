// ignore_for_file: prefer_const_constructors

import 'package:dossier/constant/menu.dart';
import 'package:dossier/services/authController.dart';
import 'package:dossier/services/utilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  AuthController ac = Get.find();
  UtilController ul = Get.find();

  var drawerKey = GlobalKey();
  int currentIndex = 0;
  OverlayPortalController oController = OverlayPortalController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          key: drawerKey,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            child: ListView.builder(
                itemCount: menuList2.length,
                itemBuilder: (e, index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${menuList2[index]['title']}"),
                          menuList2[index].containsKey("children")
                              ? Iconify(Zondicons.airplane)
                              : Container()
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed('/participations');
                    },
                  );
                }),
          ),
        ),
        appBar: AppBar(
          actions: [
            CircleAvatar(
              backgroundColor: Colors.teal[300],
            )
          ],
        ),
        body: AnimatedSwitcher(
            duration: 500.milliseconds, child: ul.getContent(currentIndex)));
  }
}
