import 'package:equatable/equatable.dart';

abstract class BlogPostEvent extends Equatable {
  const BlogPostEvent();
}

class BlogPostEventRequest extends BlogPostEvent {
  BlogPostEventRequest();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BlogPostEventRefesh extends BlogPostEvent {
  BlogPostEventRefesh();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
