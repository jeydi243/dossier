import 'package:flutter/material.dart';

class Parametres extends StatefulWidget {
  const Parametres({super.key});

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  open() {
    // WoltModalSheet.show(
    //   pageIndexNotifier: 1,
    //   context: context,
    //   decorator: (child) {
    //     return ChangeNotifierProvider<StoreOnlineViewModel>.value(
    //       value: model,
    //       builder: (_, __) => child,
    //     );
    //   },
    //   pageListBuilder: AddWaterModalPageBuilder.build(
    //     coffeeOrderId: coffeeOrderId,
    //     goToPreviousPage: () =>
    //         pageIndexNotifier.value = pageIndexNotifier.value - 1,
    //     goToNextPage: () =>
    //         pageIndexNotifier.value = pageIndexNotifier.value + 1,
    //   ),
    //   modalTypeBuilder: _modalTypeBuilder,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              open();
            },
            child: Text('Donne')),
      ),
    );
  }
}
