import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:simple_animations/animation_mixin/animation_mixin.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:iconify_flutter/icons/majesticons.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.item, this.selected = false});
  final Map<String, dynamic> item;
  final bool selected;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isEnter = false;
  // late AnimationController widthController;
  // late AnimationController heightController;
  // late AnimationController opacityController;

  // late Animation<double> height;
  // late Animation<double> width;
  // late Animation<double> opacity;
  late double localH = 10;
  late double localW = 200;
  late Color greyy = Colors.transparent;

  @override
  void initState() {
    // heightController = createController();
    // widthController = createController();
    // opacityController = createController();

    // height = Tween<double>(begin: 10, end: 20).animate(heightController);
    // width = Tween<double>(begin: 200, end: 280).animate(widthController);
    // opacity = Tween<double>(begin: 0, end: .2).animate(opacityController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 280,
      height: 40,
      duration: 500.milliseconds,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: 2,
                  color: isEnter && !widget.selected
                      ? Colors.teal
                      : widget.selected
                          ? Colors.teal
                          : Colors.transparent))),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) {
          setState(() {
            isEnter = true;
            localH = 30;
            localW = 280;
            greyy = Colors.grey.withOpacity(.05);
          });
          // heightController.play(duration: 300.milliseconds);
        },
        onExit: (PointerExitEvent e) {
          greyy = Colors.transparent;
          // heightController.playReverse(duration: 400.milliseconds);
          setState(() {
            isEnter = false;
            localH = 20;
            localW = 200;
          });
        },
        child: Stack(children: [
          // Container(
          //   color: Colors.red,
          // ),
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              height: localH,
              width: localW,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: greyy,
              ),
              duration: 300.milliseconds,
              curve: Curves.easeInOut,
            ),
          ),
          Row(
            children: [
              Iconify(
                widget.item['icon'],
                size: 20,
              ),
              Iconify(Majesticons.map_marker_area),
              Text("${widget.item['label']}")
            ],
            // width: Get.width,
          ),
        ]),
      ),
    );
  }
}
