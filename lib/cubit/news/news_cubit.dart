import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/news_service.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService _newsService;

  NewsCubit(this._newsService) : super(NewsInitial());

  Future<void> getNews({required String category}) async {
    emit(NewsLoading());
    try {
      final articles = await _newsService.getHeadLines(category: category);
      if (articles.isNotEmpty) {
        emit(NewsLoaded(articles));
      } else {
        emit(const NewsFailure('No news articles found.'));
      }
    } catch (e) {
      emit(NewsFailure(e.toString()));
    }
  }
}
