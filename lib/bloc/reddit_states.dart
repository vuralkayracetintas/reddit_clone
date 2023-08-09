import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/product/model/reddit_model.dart';

@immutable
abstract class RedditStates extends Equatable {
  const RedditStates();
}

class RedditInitialState extends RedditStates {
  @override
  List<Object?> get props => [];
}

class RedditLoadingState extends RedditStates {
  @override
  List<Object?> get props => [];
}

class RedditLoadedState extends RedditStates {
  final RedditModel redditModel;

  const RedditLoadedState(this.redditModel);
  @override
  List<Object?> get props => [redditModel];
}

class RedditErrorState extends RedditStates {
  final String message;

  const RedditErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
