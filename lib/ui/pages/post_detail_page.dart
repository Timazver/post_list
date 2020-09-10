import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_list/bloc/post_detail/post_detail_bloc.dart';
import 'package:post_list/data/repositories/post_repository_impl.dart';
import 'package:post_list/domain/model/post.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  PostDetailPage({this.post});

  @override
  State<StatefulWidget> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostDetailBloc _postDetailBloc;

  @override
  void initState() {
    super.initState();
    _postDetailBloc = PostDetailBloc(postRepository: PostRepositoryImpl());
    print(widget.post.id);
    _postDetailBloc.add(PostDetailInitialEvent(postId: widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _postDetailBloc,
        child: Scaffold(
            body: _buildContent()));
  }

  Widget _buildContent() {
    return BlocBuilder<PostDetailBloc, PostDetailState>(
        builder: (context, state) {
      if (state is PostDetailFetchingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PostDetailFetchedState) {
        return SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 60),
          _buildHeader(widget.post.title, widget.post.image),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text(state.comments[index].email),
                title: Text(state.comments[index].body)
                );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: state.comments.length)
        ]));
      } else if (state is PostDetailErrorState) {
        return Center(child: Text(state.errorText));
      }
      return Container(child: Center(child: Text("Нет данных")));
    });
  }

  Widget _buildHeader(String title, String imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width,
        height: 200,
        child: Stack(children: [
          Container(
              // width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(image: NetworkImage(imageUrl)),
              )),
          Positioned(
            top: 20,
            left: 20,
            child: Center(child: Container(
              width: 200,
              child: Text(title)))
          )
        ]));
  }
}
