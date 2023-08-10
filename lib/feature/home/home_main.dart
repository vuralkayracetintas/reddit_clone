import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:kartal/kartal.dart';
import 'package:reddit_clone/bloc/reddit_states.dart';
import 'package:reddit_clone/feature/widget/card_details.dart';
import 'package:reddit_clone/product/constans/color_constants.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({
    Key? key,
    required this.state,
  }) : super(key: key);

  final RedditLoadedState state;

  @override
  Widget build(BuildContext context) {
// Belirli bir kısmı çıkararak yeni bir URL oluşturma

    print(
      state.redditModel.data.children.first.data.preview!.images.reversed.first
          .source.url,
    );

    print(state.redditModel.data.children.first.data.preview!.images.reversed
        .first.source.url);
    print(state.redditModel.data.children.first.data.preview!.images.reversed
        .first.source.height);
    print(state.redditModel.data.children.first.data.linkFlairBackgroundColor);

    return ListView.builder(
      itemCount: state.redditModel.data.children.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardDeteails(
                              state: state,
                              index: index,
                            )));
              },
              child: Card(
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                        Padding(
                          padding: context.padding.onlyLeftLow,
                          //const EdgeInsets.only(left: 10.0),
                          child: Text(state
                              .redditModel.data.children[index].data.author),
                        ),
                      ],
                    ),
                    Text(state.redditModel.data.children[index].data.title),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor(state.redditModel.data.children[index]
                            .data.linkFlairBackgroundColor),
                        borderRadius: context.border.highBorderRadius
                          ..copyWith(
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero),
                      ),
                      child: Padding(
                        padding: context.padding.low,
                        child: Text(
                            state.redditModel.data.children[index].data
                                .linkFlairText,
                            style: context.general.textTheme.titleSmall
                                ?.copyWith(color: ColorConstans.kWhite)),
                      ),
                    ),
                    Text(
                      state.redditModel.data.children[index].data.selftext,
                      maxLines: 5,
                    ),
                    if (state.redditModel.data.children[index].data.thumbnail !=
                            "self" &&
                        state.redditModel.data.children[index].data.thumbnail
                            .isNotEmpty)
                      Image.network(
                        state.redditModel.data.children[index].data.thumbnail,
                      ),
                  ],
                ),
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
