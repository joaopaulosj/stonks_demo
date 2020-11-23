import 'package:demo_stonks/app/modules/home/domain/models/post.dart';
import 'package:demo_stonks/app/modules/home/domain/repositories/home_repository.dart';

class GetTopPostsUsecase {
  final HomeRepository repository;

  GetTopPostsUsecase({this.repository});

  List<Post> call() => repository.getTopPosts();
}
