import 'package:equatable/equatable.dart';

import '../models/blogPost.dart';


abstract class BlogPostState extends Equatable{
  const BlogPostState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class BlogPostStateInitial extends BlogPostState{}
class BlogPostStateLoading extends BlogPostState{}
class BlogPostStateSuccess extends BlogPostState{
  final BlogPost blogPost;
  const BlogPostStateSuccess({required this.blogPost});
  @override
  // TODO: implement props
  List<Object?> get props => [blogPost];
}
class BlogPostStateFail extends BlogPostState{}