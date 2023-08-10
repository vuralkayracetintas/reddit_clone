import 'package:flutter/material.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_states.dart';

import 'package:reddit_clone/feature/widget/card.dart';
import 'package:reddit_clone/feature/widget/card_details.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({
    Key? key,
    required this.state,
    this.index = 0,
  }) : super(key: key);

  final RedditLoadedState state;
  final int index;

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.redditModel.data.children.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardDeteails(
                                state: widget.state,
                                index: index,
                              )));
                },
                child: CustomCard(state: widget.state, index: index)),
            const Divider()
          ],
        );
      },
    );
  }
}
