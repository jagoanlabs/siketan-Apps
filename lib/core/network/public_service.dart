import 'package:dio/dio.dart';
import 'base_service.dart';

class PublicService {
  final PublicBaseService _baseService;

  PublicService(this._baseService);

  Future<Response> getPublicData() async {
    return await _baseService.get('/public/data');
  }

  Future<Response> getNews() async {
    return await _baseService.get('/news');
  }

  Future<Response> getAnnouncements() async {
    return await _baseService.get('/announcements');
  }
}