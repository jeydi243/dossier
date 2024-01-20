// ignore_for_file: prefer_const_constructors

import 'package:dossier/constant/menu.dart';
import 'package:dossier/services/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
// import 'package:iconify_flutter/icons/solar.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  AuthController ac = Get.find();
  var drawerKey = GlobalKey();
  OverlayPortalController oController = OverlayPortalController();
  @override
  void initState() {
    // TODO: implement initState
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
                  },
                );
              }),
        ),
      ),
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
            child: FutureBuilder<Object>(
                future: ac.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator.adaptive();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        Text('Leka j ${snapshot.data}'),
                        ElevatedButton(
                          onPressed: oController.toggle,
                          child: OverlayPortal(
                            controller: oController,
                            overlayChildBuilder: (context) {
                              return BlurryContainer(
                                child: TapRegion(
                                    child: Text('Blurred'),
                                    onTapOutside: (ev) {
                                      oController.hide();
                                    }),
                                blur: 5,
                                elevation: 0,
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(8),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              );
                            },
                            child: Text('Btn'),
                          ),
                        )
                      ],
                    );
                  }
                  return Container();
                  // return Text('Leka ${snapshot.data}');
                })),
      ),
    );
  }
}
