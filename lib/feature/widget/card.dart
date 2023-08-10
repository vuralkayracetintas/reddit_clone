import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:reddit_clone/bloc/reddit_states.dart';
import 'package:reddit_clone/product/constans/color_constants.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.state, required this.index});
  final RedditLoadedState state;
  final int index;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isLiked = false;
  bool isDisliked = false;
  int likes = 0;

  @override
  void initState() {
    super.initState();
    likes = widget.state.redditModel.data.children[widget.index].data.ups;
  }

  void increaseLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        isDisliked = false;
        likes++;
      } else {
        likes--;
      }
    });
  }

  void increaseDislike() {
    setState(() {
      isDisliked = !isDisliked;
      if (isDisliked) {
        isLiked = false;
        likes--;
      } else {
        likes++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      child: Padding(
        padding: context.padding.low,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                Padding(
                  padding: context.padding.onlyLeftLow,

                  child: Text(widget.state.redditModel.data
                      .children[widget.index].data.author), //user name
                ),
              ],
            ),
            Text(
              widget.state.redditModel.data.children[widget.index].data.title,
              style: context.general.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ), // title
            Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: HexColor(widget.state.redditModel.data
                      .children[widget.index].data.linkFlairBackgroundColor),
                  borderRadius: context.border.normalBorderRadius),
              child: Padding(
                padding: context.padding.low,
                child: Text(
                    widget.state.redditModel.data.children[widget.index].data
                        .linkFlairText,
                    textAlign: TextAlign.center,
                    style: context.general.textTheme.titleSmall
                        ?.copyWith(color: ColorConstans.kWhite)),
              ),
            ),
            // Text(state.redditModel.data.children[index].data
            //     .mediaEmbed.content
            //     .toString()), // video link details

            Text(
              widget
                  .state.redditModel.data.children[widget.index].data.selftext,
              maxLines: 5,
            ),
            if (widget.state.redditModel.data.children[widget.index].data
                        .thumbnail !=
                    "self" &&
                widget.state.redditModel.data.children[widget.index].data
                    .thumbnail.isNotEmpty)
              Image.network(
                widget.state.redditModel.data.children[widget.index].data
                    .thumbnail,
              ),

            Row(
              children: [
                IconButton(
                  onPressed: increaseLike,
                  icon: isLiked
                      ? const FaIcon(FontAwesomeIcons.solidThumbsUp)
                      : const FaIcon(FontAwesomeIcons.thumbsUp),
                ),
                Text('Like : $likes'),
                IconButton(
                  onPressed: increaseDislike,
                  icon: isDisliked
                      ? const FaIcon(FontAwesomeIcons.solidThumbsDown)
                      : const FaIcon(FontAwesomeIcons.thumbsDown),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
