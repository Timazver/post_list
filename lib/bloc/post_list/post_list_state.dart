part of 'post_list_bloc.dart';

@immutable
abstract class PostListState {}

class PostListInitial extends PostListState {}

class PostListFetchingState extends PostListState {}

class PostListFetchedState extends PostListState {

  final List<Post> posts;
  PostListFetchedState({@required this.posts});

}

class PostListErrorState extends PostListState {

  final String errorText;
  PostListErrorState({@required this.errorText});

}

class PostListEmptyState extends PostListState {
  
}