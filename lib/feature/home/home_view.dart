import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_events.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_states.dart';
import 'package:reddit_clone/bloc/RedditBloc/reddit_bloc.dart';
import 'package:reddit_clone/feature/widget/custom_circular_progress.dart';
import 'package:reddit_clone/feature/home/home_main.dart';
import 'package:reddit_clone/feature/widget/custom_drawer.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/repository/reddit_repository.dart';

int counter = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkMode = false; // Tema modu durumu

  void _toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedditBloc(
        RepositoryProvider.of<RedditRepository>(context),
      )..add(RedditLoadData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringConstants.appbarTitle,
          ),
          actions: [],
        ),
        drawer: CustomDrawer(),
        body: BlocBuilder<RedditBloc, RedditStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is RedditInitialState || state is RedditLoadingState) {
              return const CustomCircleProgress();
            } else if (state is RedditErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is RedditLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<RedditBloc>(context).add(RedditLoadData());
                },
                child: HomeMain(
                  state: state,
                  index: counter,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
