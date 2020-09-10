part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailState {}

class PostDetailInitial extends PostDetailState {}

class PostDetailFetchingState extends PostDetailState {}

class PostDetailFetchedState extends PostDetailState {

  final List<Comment> comments;
  PostDetailFetchedState({@required this.comments});

}

class PostDetailErrorState extends PostDetailState {

  final String errorText;
  PostDetailErrorState({@required this.errorText});

}
