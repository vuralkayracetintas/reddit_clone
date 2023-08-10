import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_states.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';

class CardDetails extends StatelessWidget {
  final RedditLoadedState state;
  final int index;

  CardDetails({required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    final redditData = state.redditModel.data.children[index].data;

    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.cardDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posted by u/${redditData.author}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              redditData.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                color: HexColor(redditData.linkFlairBackgroundColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  redditData.linkFlairText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              redditData.selftext,
              maxLines: 5,
            ),
            const SizedBox(height: 8),
            if (redditData.thumbnail != "self" &&
                redditData.thumbnail.isNotEmpty)
              Image.network(
                redditData.thumbnail,
                height: 150,
              ),
          ],
        ),
      ),
    );
  }
}
