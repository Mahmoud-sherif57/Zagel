import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zagel/core/services/api_services.dart';
import 'package:zagel/core/services/dio_helper.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsByCategoryInitial());

  // get news by category
  void getNewsByCategory(String category) async {
    emit(NewsByCategoryLoading());
    try {
      await ApiServices.getNews(
          endPoint: DioHelper.eveyThingEndPoint,
          params: {"q": category, "language": "en"}).then((value) {
        emit(NewsByCategorySuccess(value));
      });
    } catch (e) {
      emit(NewsByCategoryError(e.toString()));
    }
  }

  void getSourcesOfNews() async {
    emit(SourceNewsLoading());
    try {
      await ApiServices.getSource(
          endPoint: DioHelper.sourcesEndPoint,
          params: {"q": "general"}).then((value) {
        emit(SourceNewsSuccess(value));
      });
    } catch (e) {
      emit(SourceNewsError(e.toString()));
    }
  }

  // CUBIT OF SEARCH SCREEN
  void getNewsBySearch(String query) async {
    emit(NewsBySearchLoading());
    try {
      await ApiServices.getNews(endPoint: DioHelper.eveyThingEndPoint, params: {
        "q": query,
      }).then((value) {
        emit(NewsBySearchSuccess(value));
      });
    } catch (e) {
      emit(NewsBySearchError(e.toString()));
    }
  }
}
