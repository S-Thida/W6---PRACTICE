import 'package:w6_practice/EX-2-START-CODE/DTO/post_dto.dart';

class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});
  
   factory Post.fromDto(PostDto postDto) {
    return Post(id: postDto.id, title: postDto.title, description: postDto.body);
 }
}
