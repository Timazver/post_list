import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_list/data/datastore/network/model/requests/post_comments_request.dart';
import 'package:post_list/domain/model/comment.dart';
import 'package:post_list/domain/repositories/post_repository.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {

  final PostRepository postRepository;

  PostDetailBloc({this.postRepository}) : super(PostDetailInitial());

  @override
  Stream<PostDetailState> mapEventToState(
    PostDetailEvent event,
  ) async* {
    yield PostDetailFetchingState();
    List<Comment> comments;
    try {
      if(event is PostDetailInitialEvent) {
        comments = await postRepository.fetchComments(PostCommentsRequest(postId: event.postId));
        yield PostDetailFetchedState(comments: comments);
      }
    } catch (error) {
      print(error);
      yield  PostDetailErrorState(errorText: "Неизвестная ошибка");
    }
  }
}
