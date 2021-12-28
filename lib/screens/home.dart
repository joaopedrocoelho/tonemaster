import 'package:flutter/material.dart';
import 'package:frontend/utils/push_to_screen.dart';
import 'package:frontend/widgets/drawer/drawer_menu.dart';
import 'package:frontend/widgets/menu/default_items/hsk_menu.dart';
import 'package:frontend/widgets/menu/default_items/idioms_menu.dart';
import 'package:frontend/widgets/menu/default_items/tocfl_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/circular_menu.dart';
import 'package:frontend/widgets/menu/menu_buttons/menu_item.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final BannerAd _menuAd = BannerAd(
      adUnitId: 'ca-app-pub-5758087039130918/3967921821', //kDebugMode ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-5758087039130918/3967921821',
      size: AdSize.fluid,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ));


@override
  void initState() {
    _menuAd.load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
       
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        shadowColor: theme.appBarTheme.shadowColor,
        
        title: Text('Tone Master',
        style: TextStyle( //AppBar
            fontFamily: 'SignikaNegative',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: theme.shadowColor)),
       /*  actions: [
          Icon(
            Icons.settings_rounded,
            color: theme.shadowColor,
          size:40
          ),
        ], */
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  HSKMenuItem(),
                 
                  TOCFLMenuItem(),
                  IdiomsMenuItem(),
                  MenuItem(
                    label: "Random",
                    onTap: () {
                      newPushToScreen('assets/json/dictionaries/original.json', context);
                    },
                  ),
                  
                ],
              ),
            ),
          Container(child: AdWidget(ad: _menuAd,),
            height: 100,)
          ],
        ),
      ),
    );
  }
}
