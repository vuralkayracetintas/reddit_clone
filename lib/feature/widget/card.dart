import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_states.dart';

import 'package:reddit_clone/product/constans/color_constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> share() async {
    final result = await Share.shareWithResult(
        'https://www.reddit.com${widget.state.redditModel.data.children[widget.index].data.permalink}');

    if (result.status == ShareResultStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Paylaşım başarıyla tamamlandı!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Paylaşım sırasında bir hata oluştu.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.state.redditModel.data.children[widget.index].data.permalink);
    final Uri uri = Uri.parse(
        'https://www.reddit.com${widget.state.redditModel.data.children[widget.index].data.permalink}');
    Future<void> _launchUrl() async {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }

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

                  child: Text(
                      'Posted by u/${widget.state.redditModel.data.children[widget.index].data.author}'), //user name
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: increaseLike,
                      icon: isLiked
                          ? const FaIcon(FontAwesomeIcons.solidThumbsUp)
                          : const FaIcon(FontAwesomeIcons.thumbsUp),
                    ),
                    Text('$likes'),
                    IconButton(
                      onPressed: increaseDislike,
                      icon: isDisliked
                          ? const FaIcon(FontAwesomeIcons.solidThumbsDown)
                          : const FaIcon(FontAwesomeIcons.thumbsDown),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.comment),
                      onPressed: () {},
                    ),
                    Text(widget.state.redditModel.data.children[widget.index]
                        .data.numComments
                        .toString()),
                  ],
                ),
                IconButton(
                    onPressed: share,
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowUpFromBracket,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
