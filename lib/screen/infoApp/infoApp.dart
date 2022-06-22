import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
        webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
      )) {
        throw 'Could not launch $url';
      }
    }

    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('acssets/images/cats/bgInfoApp2.jpg',),
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
                Container(
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
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Sẽ sớm ra mắt"),
                        ));
                      },
                      child: const Text("Chỉnh sửa thông tin",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                ),
                Container(
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
                      onTap: () async {
                        const url = 'https://chinhsachbaomatvqhapp.blogspot.com/';
                        _launchInBrowser(Uri.parse(url));
                      },
                      child: const Text("Chính Sách Bảo Mật",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                ),
                Container(
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
                      onTap: () async {
                        const url = 'https://dieukhoanvqhapps.blogspot.com/';
                        _launchInBrowser(Uri.parse(url));
                      },
                      child: const Text("Điều Khoản Sử Dụng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                ),
                Container(
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
                      onTap: () async {
                        const url = 'https://vqhapps.blogspot.com/';
                        _launchInBrowser(Uri.parse(url));
                      },
                      child: const Text("Website Nhà Phát Triển",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}