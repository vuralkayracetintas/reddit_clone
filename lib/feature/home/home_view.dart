// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reddit_clone/bloc/reddit_events.dart';
import 'package:reddit_clone/bloc/reddit_states.dart';
import 'package:reddit_clone/bloc/spacex_bloc.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/model/reddit_model.dart';
import 'package:reddit_clone/product/repository/reddit_repository.dart';

int counter = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedditBloc(
        RepositoryProvider.of<RedditRepository>(context),
      )..add(RedditLoadData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringConstans.appbarTitle),
        ),
        body: BlocBuilder<RedditBloc, RedditStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is RedditInitialState || state is RedditLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is RedditErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is RedditLoadedState) {
              return Column(
                children: [
                  Text('text'),
                  Text(state.redditModel.data.children.first.data.title),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
