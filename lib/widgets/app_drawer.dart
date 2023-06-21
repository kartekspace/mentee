import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/topic_bloc.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/infrastructure/model/topic_details.dart';

class DrawerItems {
  final IconData icon;
  final String? name;

  DrawerItems(this.icon, this.name);
}

class SuggestedTopics {
  final String image;
  final String? title;
  final String? code;

  SuggestedTopics({required this.image, required this.title, this.code});
}

class AppDrawer extends StatelessWidget {
  final TopicBloc topicBloc = new TopicBloc();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<DrawerItems> _drawerItems = [
      DrawerItems(Icons.explore, context.getTranslationOf('feeds_title')),
      DrawerItems(
          Icons.bookmark_added, context.getTranslationOf('bookmark_title')),
      DrawerItems(
          Icons.speaker_notes, context.getTranslationOf('trending_title')),
      DrawerItems(Icons.book_rounded, context.getTranslationOf('editor_title')),
      DrawerItems(Icons.book_rounded, context.getTranslationOf('settings_title')),
    ];
    // List<SuggestedTopics> _suggestedTopics = [
    //   SuggestedTopics('assets/topics/ic_trending.png',
    //       context.getTranslationOf('trending')),
    //   SuggestedTopics(
    //       'assets/topics/ic_sports.png', context.getTranslationOf('sports')),
    //   SuggestedTopics('assets/topics/ic_politics.png',
    //       context.getTranslationOf('politics')),
    //   SuggestedTopics('assets/topics/ic_business.png',
    //       context.getTranslationOf('business')),
    //   SuggestedTopics(
    //       'assets/topics/ic_tech.png', context.getTranslationOf('tech')),
    //   SuggestedTopics(
    //       'assets/topics/ic_travel.png', context.getTranslationOf('travel')),
    //   SuggestedTopics(
    //       'assets/topics/ic_fashion.png', context.getTranslationOf('fashion')),
    //   SuggestedTopics('assets/topics/ic_education.png',
    //       context.getTranslationOf('education')),
    //   SuggestedTopics(
    //       'assets/topics/ic_health.png', context.getTranslationOf('health')),
    //   SuggestedTopics(
    //       'assets/topics/ic_fun.png', context.getTranslationOf('funny')),
    //   SuggestedTopics('assets/topics/ic_hollywodd.png',
    //       context.getTranslationOf('hollywood')),
    //   SuggestedTopics(
    //       'assets/topics/ic_science.png', context.getTranslationOf('science')),
    // ];
    return Container(
      width: 350,
      color: theme.scaffoldBackgroundColor,
      child: Drawer(
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: ListView(
            children: [
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: theme.focusColor,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      'Linjith\nKunnon',
                      style: theme.textTheme.headline6,
                    ),
                    Spacer(),
                    Icon(
                      Icons.person_add_alt_rounded,
                      color: theme.backgroundColor,
                      size: 60,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  itemCount: _drawerItems.length,
                  itemExtent: 40.0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        _drawerItems[index].icon,
                        color: theme.primaryColor,
                      ),
                      title: Text(
                        _drawerItems[index].name!,
                        style:
                            theme.textTheme.headline6!.copyWith(fontSize: 16),
                      ),
                      onTap: index == 0
                          ? () {
                              Navigator.pushNamed(context, PageRoutes.news);
                            }
                          : index == 4
                              ? () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.preferences);
                                }
                              : () {
                                  Navigator.pushNamed(context, PageRoutes.news);
                                },
                    );
                  }),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        context.getTranslationOf('topic_title')!,
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                    StreamBuilder<List<TopicDetails>>(
                        stream: topicBloc.getAllTopics(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                            case ConnectionState.active:
                              return Center(
                                  child: CircularProgressIndicator(
                                color: theme.primaryColor,
                              ));
                            case ConnectionState.done:
                              if (snapshot.hasError)
                                return Text('Err: ${snapshot.error}');
                              List<TopicDetails> topicList = snapshot.data!;
                              return GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: topicList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 4.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PageRoutes.news,
                                            arguments: topicList[index].title);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: theme.hintColor),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [

                                            Text(
                                              topicList[index].title!,
                                              softWrap: false,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.caption!
                                                  .copyWith(
                                                fontSize: 10,
                                                color: theme.focusColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                          }
                        })
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: 16, horizontal: 16.0),
              //   child: BuyThisApp.button(
              //     'qunews',
              //     'http://bit.ly/cc_flutter_qunews',
              //     color: Theme.of(context).primaryColor,
              //   ),
              // ),
              // BuyThisApp.developerRow(
              //     Colors.transparent, Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
