part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailEvent {}

class PostDetailInitialEvent extends PostDetailEvent {
  
  final int postId;

  PostDetailInitialEvent({this.postId});
}
