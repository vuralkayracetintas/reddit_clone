import 'package:equatable/equatable.dart';

abstract class RedditEvents extends Equatable {
  const RedditEvents();
}

class RedditLoadData extends RedditEvents {
  @override
  List<Object?> get props => [];
}
