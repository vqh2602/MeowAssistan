import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/bloc/blogPost_bloc.dart';
import 'package:meowassistan/models/blogPost.dart';
import 'package:meowassistan/states/blogPost_state.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/src/widgets/image.dart' as prefix;
import 'package:url_launcher/url_launcher.dart';


import '../../../Color/colors.dart';
import '../../../events/blogPost_event.dart';

class BlogPostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBlogPostScreen();
  }
}

class _MyBlogPostScreen extends State<BlogPostScreen> {
  late BlogPostBloc blogPostBloc;
  List<Items> listItems = [];
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
  String tachlink(String text){
    RegExp exp = new RegExp(r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
    final urlMatches =exp.allMatches(text);
    List<String> urls = urlMatches.map(
            (urlMatch) => text.substring(urlMatch.start, urlMatch.end))
        .toList();
   // urls.forEach((x) => print('Duonglink: $x'));
    return urls[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogPostBloc = BlocProvider.of<BlogPostBloc>(context);
    blogPostBloc.add(BlogPostEventRequest());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<BlogPostBloc, BlogPostState>(
        builder: (context, stateblog) {
      if (stateblog is BlogPostStateLoading) {
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
            colorPinkFf758c(),
          )),
        );
      }
      if (stateblog is BlogPostStateSuccess) {
        final BlogPost blogPost = stateblog.blogPost;
        listItems = blogPost.items!;
        tachlink(listItems[0].content!);
        return SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),

                    child: Center(
                      child: InkWell(
                        onTap: (){
                          _launchInApp(Uri.parse(listItems[index].url!));
                        },
                        child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  // image: NetworkImage(tachlink(listItems[index].content!)),
                                  image: NetworkImage(tachlink(listItems[index].content!)),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: <Widget>[
                                  // FittedBox(
                                  //   child: prefix.Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                  //   fit: BoxFit.fill,
                                  // ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: BlurryContainer(
                                          child:
                                          Center(
                                            child: Text(
                                              '${ listItems[index].updated!}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 7.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          blur: 5,
                                          width:
                                          MediaQuery.of(context).size.width * 0.9,
                                          height:30,
                                          elevation: 0,
                                          color: Colors.black45,
                                          padding: const EdgeInsets.all(8),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: BlurryContainer(
                                          child:
                                          Center(
                                            child: Text(
                                              '${listItems[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          blur: 5,
                                          width:
                                          MediaQuery.of(context).size.width * 0.9,
                                          height:
                                          MediaQuery.of(context).size.height * 0.1,
                                          elevation: 0,
                                          color: Colors.black45,
                                          padding: const EdgeInsets.all(8),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                      )),
                                ],
                              ),
                            )),
                      ),
                    ),
                  );
                }));
      } else {
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
            colorPinkFf758c(),
          )),
        );
      }
    });
  }
}
