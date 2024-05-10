import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  static AdsHelper adsHelper = AdsHelper._();

  AdsHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  NativeAd? nativeAd;
  AppOpenAd? appOpenAd;

  var bannerId = Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/2934735716";

  var interstitialId = Platform.isAndroid
      ? "ca-app-pub-3940256099942544/1033173712"
      : "ca-app-pub-3940256099942544/4411468910";

  var rewardedId = Platform.isAndroid
      ? "ca-app-pub-3940256099942544/5224354917"
      : "ca-app-pub-3940256099942544/1712485313";

  var nativeId = Platform.isAndroid
      ? "ca-app-pub-3940256099942544/2247696110"
      : "ca-app-pub-3940256099942544/3986624511";

  var openId = Platform.isAndroid
      ? "ca-app-pub-3940256099942544/9257395921"
      : "ca-app-pub-3940256099942544/5575463023";

  void initBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerId,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  void initIntertital() {
    InterstitialAd.load(
      adUnitId: interstitialId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("$error");
        },
      ),
    );
  }

  void initReward() {
    RewardedAd.load(
        adUnitId: rewardedId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (error) {
            print("$error");
          },
        ));
  }

  // void initNative() {
  //   nativeAd = NativeAd(
  //     adUnitId: nativeId,
  //     listener: NativeAdListener(
  //       onAdLoaded: (ad) {
  //         nativeAd = ad as NativeAd?;
  //       },
  //     ),
  //     request: AdRequest(),
  //     nativeTemplateStyle: NativeTemplateStyle(
  //       templateType: TemplateType.small
  //     ),
  //   );
  //
  //   nativeAd!.load();
  // }

  void initOpenAds() {
    AppOpenAd.load(
      adUnitId: openId,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("$error");
        },
      ),
    );
  }
}
