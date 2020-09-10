
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_list/bloc/post_list/post_list_bloc.dart';
import 'package:post_list/data/repositories/post_repository_impl.dart';
import 'package:post_list/ui/pages/post_detail_page.dart';
import 'package:post_list/ui/pages/post_list_item.dart';

class PostListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PostListPageState();

}

class _PostListPageState extends State<PostListPage> {

  PostListBloc _postListBloc;

  @override
  void initState() {
    super.initState();
    _postListBloc = PostListBloc(postRepository: PostRepositoryImpl());
    _postListBloc.add(InitialEvent());
  }

  @override
  void dispose() {
    _postListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => _postListBloc,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 70),
          child: _buildContent()
        )
      ));
  }

  Widget _buildContent() {
    return BlocBuilder<PostListBloc, PostListState> (
      builder: (context, state) {
        if(state is PostListFetchingState) {
          return Center(child: CircularProgressIndicator());
        } else if(state is PostListFetchedState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(post: state.posts[index]))),
                child: PostListItem(
                post: state.posts[index]
              ));
            }, 
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            }, 
            itemCount: state.posts.length);
        } else if(state is PostListErrorState) {
          return Center(child: Text(state.errorText));
        } 
        return Container(child: Center(child: Text("Нет данных")));
      }
    );
  }

}