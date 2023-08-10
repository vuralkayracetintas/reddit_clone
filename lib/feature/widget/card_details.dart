// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_states.dart';

// ignore: must_be_immutable
class CardDeteails extends StatelessWidget {
  CardDeteails({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);
  final RedditLoadedState state;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: Center(
        child: Text(state.redditModel.data.children[index].data.title),
      ),
    );
  }
}
