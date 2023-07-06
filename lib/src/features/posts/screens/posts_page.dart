import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ws_1/src/features/posts/bloc/posts_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsPage extends StatefulWidget {
  final String token;

  const PostsPage({super.key, required this.token});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();
  late String id;
  late SharedPreferences pref;
  late String userToken = '';


  @override
  void initState()  {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    id = jwtDecodedToken['id'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(id),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.token),
    
          ],
        ));
  }
}
