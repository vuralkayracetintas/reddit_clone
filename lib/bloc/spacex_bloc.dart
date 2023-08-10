import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/reddit_events.dart';
import 'package:reddit_clone/bloc/reddit_states.dart';
import 'package:reddit_clone/product/repository/reddit_repository.dart';

class RedditBloc extends Bloc<RedditEvents, RedditStates> {
  final RedditRepository _redditRepository;
  RedditBloc(this._redditRepository) : super(RedditLoadingState()) {
    on<RedditLoadData>(
      (event, emit) async {
        emit(RedditLoadingState());
        try {
          final redditModel = await _redditRepository.getRedditData();
          emit(RedditLoadedState(redditModel));
        } catch (e) {
          emit(RedditErrorState(e.toString()));
        }
      },
    );
  }
}
