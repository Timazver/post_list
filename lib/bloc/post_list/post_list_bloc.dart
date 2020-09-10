import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_list/data/datastore/network/model/requests/post_list_request.dart';
import 'package:post_list/domain/model/post.dart';
import 'package:post_list/domain/repositories/post_repository.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostRepository postRepository;

  PostListBloc({this.postRepository}) : super(PostListInitial());

  @override
  Stream<PostListState> mapEventToState(
    PostListEvent event,
  ) async* {
    yield PostListFetchingState();
    List<Post> posts;
    try {
      if(event is InitialEvent) {
        posts = await postRepository.fetchPosts(PostListRequest());
        yield PostListFetchedState(posts: posts);
      }
    } catch (error) {
      print(error);
      yield  PostListErrorState(errorText: "Неизвестная ошибка");
    }
  }
}
