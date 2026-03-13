import 'package:equatable/equatable.dart';
import '../../models/artical_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<ArticleModel> articles;

  const NewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class NewsFailure extends NewsState {
  final String error;

  const NewsFailure(this.error);

  @override
  List<Object> get props => [error];
}
