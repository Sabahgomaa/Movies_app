import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/Core/Utilites/app_constant.dart';
import '../../../Core/Error/expection.dart';
import '../../../Core/Network/error_message_model.dart';
import '../../Domain/Entities/recommodation.dart';
import '../../Domain/UseCases/get_movie_details_usecase.dart';
import '../../Domain/UseCases/get_recommendation_usecase.dart';
import '../Model/movie_details_model.dart';
import '../Model/movies_model.dart';
import '../Model/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MoviesDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<Recommendation>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstant.nowPlayingMovies);
    if (kDebugMode) {
      print("now");
    }
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstant.popularMovies);
    if (kDebugMode) {
      print("popular");
    }
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstant.topRatedMovies);
    if (kDebugMode) {
      print("top");
    }
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(AppConstant.moviesDetails(parameters.id));
    if (kDebugMode) {
      print("details");
    }
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(AppConstant.recommendationPath(parameters.id));
    if (kDebugMode) {
      print("recommendation");
    }
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
