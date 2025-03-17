import 'package:zagel/features/home/model/news_model/news_model.dart';
import 'package:zagel/features/source/model/source/source_model.dart';

class NewsState {}

class NewsByCategoryInitial extends NewsState {}

class NewsByCategoryLoading extends NewsState {}

class NewsByCategorySuccess extends NewsState {
  final NewsModel newsModel;
  NewsByCategorySuccess(this.newsModel);
}

class NewsByCategoryError extends NewsState {
  final String error;
  NewsByCategoryError(this.error);
}

class SourceNewsInitial extends NewsState {}

class SourceNewsLoading extends NewsState {}

class SourceNewsSuccess extends NewsState {
  final SourceModel sourceModel;
  SourceNewsSuccess(this.sourceModel);
}

class SourceNewsError extends NewsState {
  final String error;
  SourceNewsError(this.error);
}

class NewsBySearchInitial extends NewsState {}

class NewsBySearchLoading extends NewsState {}

class NewsBySearchSuccess extends NewsState {
  final NewsModel newsModel;
  NewsBySearchSuccess(this.newsModel);
}

class NewsBySearchError extends NewsState {
  final String error;
  NewsBySearchError(this.error);
}
