import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tek_capsule/business_logic/capsule_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/features/news/full_news.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';
import 'package:tek_capsule/widgets/action_indicator.dart';
import 'package:tek_capsule/widgets/app_drawer.dart';

class NewsContent {
  final String image;
  final String? headline;
  final String? description;

  NewsContent(this.image, this.headline, this.description);
}

class NewsComponent extends StatefulWidget {
  bool showAppbar;
  bool reaction;
  final String? title;

  NewsComponent([this.showAppbar = false, this.reaction = false, this.title]);

  @override
  _NewsComponentState createState() => _NewsComponentState();
}

class _NewsComponentState extends State<NewsComponent> {
  bool react = false;
  bool bookmark = false;
  final CapsuleBloc capsuleBloc = CapsuleBloc();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: widget.reaction == false
            ? FadedScaleAnimation(
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                      color: lightScaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30))),
                  child: ListTile(
                    title: Text(
                      getTranslationOf('similar_news')!,
                      style: theme.textTheme.caption,
                    ),
                    subtitle: Text(
                      getTranslationOf('news_content')!,
                      style: theme.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.normal, height: 2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              )
            : react == false
                ? Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 15, top: 15),
                    decoration: BoxDecoration(
                        color: theme.bottomAppBarColor,
                        ),
                    child: FadedScaleAnimation(
                      Row(
                        children: [
                          
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   react = !react;
                              // });
                            },
                            child: Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Text(
                            '  ' + getTranslationOf('like_title')!,
                            style: theme.textTheme.caption!,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.comment,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            '  ' + getTranslationOf('comment')!,
                            style: theme.textTheme.caption!,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   bookmark = !bookmark;
                              // });
                            },
                            child: bookmark == true
                                ? Icon(
                                    Icons.bookmark,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.bookmark_border,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/icons/ic_share.png',
                            scale: 2.5,
                          ),
                        ],
                      ),
                    ),
                  )
                : FadedScaleAnimation(
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          react = !react;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 16, top: 16),
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FadedScaleAnimation(
                                  Image.asset(
                                    'assets/emojis/ic_lol.png',
                                    scale: 3,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                FadedScaleAnimation(
                                  Image.asset(
                                    'assets/emojis/ic_love.png',
                                    scale: 3,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                FadedScaleAnimation(
                                  Image.asset(
                                    'assets/emojis/ic_sad.png',
                                    scale: 3,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                FadedScaleAnimation(
                                  Image.asset(
                                    'assets/emojis/ic_wow.png',
                                    scale: 3,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                FadedScaleAnimation(
                                  Image.asset(
                                    'assets/emojis/ic_angry.png',
                                    scale: 3,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                FadedScaleAnimation(
                                  Icon(
                                    Icons.close,
                                    color: theme.backgroundColor,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: '50%',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 8,
                                                color: theme.backgroundColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                ' ' + getTranslationOf('lol')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color:
                                                        theme.backgroundColor),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: '29%',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 8,
                                                color: theme.backgroundColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: ' ' +
                                                getTranslationOf('loved')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color:
                                                        theme.backgroundColor),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: '12%',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 8,
                                                color: theme.backgroundColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                ' ' + getTranslationOf('sad')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color:
                                                        theme.backgroundColor),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: '6%',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 8,
                                                color: theme.backgroundColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: ' ' +
                                                getTranslationOf('surprised')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color:
                                                        theme.backgroundColor),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: '3%',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 8,
                                                color: theme.backgroundColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: ' ' +
                                                getTranslationOf('angry')!,
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color:
                                                        theme.backgroundColor),
                                          )
                                        ]),
                                  ),
                                  Text(
                                    getTranslationOf('close')!,
                                    style: theme.textTheme.caption!.copyWith(
                                      color: theme.backgroundColor,
                                      fontSize: 8,
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
        backgroundColor: theme.backgroundColor,
        drawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.primaryColor, size: 26.0),
          backgroundColor: theme.backgroundColor.withOpacity(0.3),
          centerTitle: true,
          title: Text(
            widget.title!,
            style: theme.textTheme.headline6!.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: constructFeedWidget());
  }

  void loadWebPage({required String? url, required String? title}) {
    if (url == null) return;
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => FullNews(url, title!)));
  }

  Widget getFeedWidget(List<CapsuleDetails> payload) {
    final theme = Theme.of(context);
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: payload.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return FadedSlideAnimation(
            Column(
              // physics: NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          loadWebPage(
                              url: payload[index].resourceUrl!,
                              title: payload[index].title!);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.6,
                          child: Image.network(
                            payload[index].imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        )),

                    // if (widget.showAppbar)
                    //   Frost(
                    //     child: AppBar(
                    //       centerTitle: true,
                    //       title: Text(
                    //         widget.title!,
                    //         style: theme.textTheme.headline6!.copyWith(
                    //           color: theme.backgroundColor,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //     ),
                    //     frostColor: theme.primaryColor,
                    //     blur: 5,
                    //     frostOpacity: 0.05,
                    //   ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        // PositionedDirectional(
                        //   end: 24,
                        //   top: 40,
                        //   child: Image.asset(
                        //     'assets/ic_swipeleft.png',
                        //     scale: 2,
                        //   ),
                        // ),
                        Column(
                          children: [

                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   widget.showAppbar = !widget.showAppbar;
                                //   widget.reaction = !widget.reaction;
                                // });
                                loadWebPage(
                                    url: payload[index].resourceUrl!,
                                    title: payload[index].title!);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: FadedSlideAnimation(
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      payload[index].title!,
                                      style: theme.textTheme.headline6!.copyWith(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  beginOffset: Offset(0, 3),
                                  endOffset: Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   widget.reaction = !widget.reaction;
                                //   widget.showAppbar = !widget.showAppbar;
                                // });
                                loadWebPage(
                                    url: payload[index].resourceUrl!,
                                    title: payload[index].title!);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: FadedSlideAnimation(
                                  Text(
                                    payload[index].description!,
                                    softWrap: false,
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.subtitle2!.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                  beginOffset: Offset(0, 3),
                                  endOffset: Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.comment);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      payload[index].publishedDate!,
                                      style: theme.textTheme.caption,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: theme.primaryColor,
                                    ),
                                    Text(
                                      payload[index].duration!.toString() +
                                          'MIN',
                                      style: theme.textTheme.caption,
                                    ),
                                    Spacer(),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        payload[index].author!,
                                        style:
                                            theme.textTheme.caption!.copyWith(
                                          color: theme.primaryColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          );
        });
  }

  Widget constructFeedWidget() {
    final theme = Theme.of(context);
    return StreamBuilder<List<CapsuleDetails>>(
        stream: capsuleBloc.getAllCapsules(),
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
              if (snapshot.hasError) return Text('Err: ${snapshot.error}');
              List<CapsuleDetails> capsuleDetails = snapshot.data!;
              final scaffoldkey = RootInjectorWidget.of(context)!
                  .applicationBloc
                  .globalscaffoldKey;
              final scaffoldState = scaffoldkey.currentState;
              if (capsuleDetails.length > 0) {
                capsuleDetails[0].resourceUrl = 'https://www.tekcapsule.com/';
                capsuleDetails[1].resourceUrl =
                    'https://tekcapsule.blog/the-rise-of-artificial-intelligence-exploring-the-benefits-challenges-and-future-implications/';
                if (scaffoldState != null) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    scaffoldState.showSnackBar(ActionIndicator()
                        .getSnackBar(context, 'Topics fetched!'));
                  });
                }
                return getFeedWidget(capsuleDetails);
              } else {
                if (scaffoldState != null) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    scaffoldState.showSnackBar(ActionIndicator()
                        .getSnackBar(context, 'No topics available!'));
                  });
                }
                return getFeedWidget([]);
              }
          }
        });
  }
}
