import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meowassistan/screen/infoApp/version_App_Screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _launchInApp(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
        webViewConfiguration:
            const WebViewConfiguration(enableJavaScript: true),
      )) {
        throw 'Could not launch $url';
      }
    }

    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(url,
        mode: LaunchMode.externalNonBrowserApplication
      )) throw 'Could not launch $url';
    }

    Widget containerWid(
        {required String title,
        required String url,
        required bool showLog,
        required bool launch}) {
      return
        InkWell(
          onTap: () {
            showLog
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('coming_soon').tr(),
            ))
                : launch
                ? _launchInApp(Uri.parse(url))
                : _launchInBrowser(Uri.parse(url));


          },
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    //                   <--- left side
                    color: Colors.white,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    //                   <--- left side
                    color: Colors.white,
                    width: 1.0,
                  ),
                )),
            child: Center(
              child: InkWell(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        );
    }

    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'acssets/images/cats/bgInfoApp2.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   'Setting',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                // ),
                containerWid(title: 'sua_tt'.tr(), url: '', showLog: true, launch: true),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: VersionAppScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            //                   <--- left side
                            color: Colors.white,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            //                   <--- left side
                            color: Colors.white,
                            width: 1.0,
                          ),
                        )),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          'thong_tin_app',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ).tr(),
                      ),
                    ),
                  ),
                ),
                containerWid(title: 'csbm'.tr(), url: 'https://chinhsachbaomatvqhapp.blogspot.com/', showLog: false, launch: true),
                containerWid(title: 'dieu_khoan'.tr(), url: 'https://dieukhoanvqhapps.blogspot.com/', showLog: false, launch: true),
                containerWid(title: 'web_dev'.tr(), url: 'https://vqhapps.blogspot.com/', showLog: false, launch: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
