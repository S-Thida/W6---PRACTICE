import 'package:flutter/material.dart';
import 'package:w6_practice/EX-2-START-CODE/repository/http_posts_repository.dart';
import 'repository/mock_post_repository.dart';
import 'repository/post_repository.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
   PostRepository postRepo1 = HttpPostsRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: postRepo1),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}