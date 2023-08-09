import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:reddit_clone/bloc/reddit_states.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({
    Key? key,
    required this.state,
  }) : super(key: key);

  final RedditLoadedState state;

  @override
  Widget build(BuildContext context) {
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
            Card(
              elevation: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text(state
                                .redditModel.data.children[index].data.author),
                            Container(
                              decoration: BoxDecoration(
                                color: HexColor(state
                                    .redditModel
                                    .data
                                    .children[index]
                                    .data
                                    .linkFlairBackgroundColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(state.redditModel.data.children[index]
                                  .data.linkFlairText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(state.redditModel.data.children[index].data.title),
                  Text(
                    state.redditModel.data.children[index].data.selftext,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
