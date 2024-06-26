import 'dart:async';

import 'package:ads/util/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AdsHelper.adsHelper.initBanner();
    AdsHelper.adsHelper.initIntertital();
    AdsHelper.adsHelper.initReward();
    // AdsHelper.adsHelper.initNative();
    AdsHelper.adsHelper.initOpenAds();

    Timer(Duration(seconds: 3), () {
      if (AdsHelper.adsHelper.appOpenAd != null) {
        AdsHelper.adsHelper.appOpenAd!.show();
        AdsHelper.adsHelper.appOpenAd!.fullScreenContentCallback =
            FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {

              },
            );
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ADS APP"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.interstitialAd != null) {
                    AdsHelper.adsHelper.interstitialAd!.show();
                    AdsHelper.adsHelper.initIntertital();
                    AdsHelper.adsHelper.interstitialAd!
                        .fullScreenContentCallback = FullScreenContentCallback(
                      onAdDismissedFullScreenContent: (ad) {
                        Get.snackbar("title", "message");
                      },
                    );
                  } else {
                    AdsHelper.adsHelper.initIntertital();
                  }
                },
                child: const Text("InterAds"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.rewardedAd != null) {
                    AdsHelper.adsHelper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        Get.snackbar("Reward${reward.amount}", "message");
                        AdsHelper.adsHelper.initReward();
                      },
                    );
                  } else {
                    AdsHelper.adsHelper.initReward();
                  }
                },
                child: const Text("RewardAds"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.appOpenAd != null) {
                    AdsHelper.adsHelper.appOpenAd!.show();
                    AdsHelper.adsHelper.initOpenAds();
                  } else {
                    AdsHelper.adsHelper.initOpenAds();
                  }
                },
                child: const Text("OpenAds"),
              ),
              AdsHelper.adsHelper.bannerAd == null
                  ? Container()
                  : SizedBox(
                      height: 200,
                      child: AdWidget(
                        ad: AdsHelper.adsHelper.bannerAd!,
                      ),
                    ),
              // AdsHelper.adsHelper.nativeAd == null
              //     ? Container()
              //     : SizedBox(
              //         height: 200,
              //         child: AdWidget(
              //           ad: AdsHelper.adsHelper.nativeAd!,
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
