import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zagel/core/services/dio_helper.dart';
import 'package:zagel/features/home/model/news_model/news_model.dart';
import 'package:zagel/features/source/model/source/source_model.dart';

class ApiServices {
// Singleton instance of Dio
  static final Dio _dio = Dio(
    BaseOptions(
      // sendTimeout: const Duration(seconds: 20),
      // receiveTimeout: const Duration(seconds: 20),
      // connectTimeout: const Duration(seconds: 5),
      // maxRedirects: ,
      queryParameters: {
        "apiKey": DioHelper.apiKey2,
      },
      baseUrl: DioHelper.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      compact: false,
    ));

  static Future<NewsModel> getNews({
    required endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: params,
      );
      return NewsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<SourceModel> getSource({
    required endPoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: params,
      );
      return SourceModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
