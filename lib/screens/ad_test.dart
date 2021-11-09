import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdTestScreen extends StatefulWidget {
  AdTestScreen({Key? key}) : super(key: key);

  @override
  _AdTestScreenState createState() => _AdTestScreenState();
}

class _AdTestScreenState extends State<AdTestScreen> {

  final BannerAd bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
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
    // TODO: implement initState
    bannerAd.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdWidget(ad: bannerAd),
    );
  }
}