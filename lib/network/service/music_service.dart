import 'dart:convert';

import 'package:itunes/network/base_service.dart';
import 'package:itunes/network/model/music_response.dart';
import 'package:itunes/network/service_url.dart';

abstract class MusicService extends BaseService {
  Future<List<MusicResponse>> searchMusicByArtist(String search);
}

class MusicServiceImpl extends MusicService {
  @override
  Future<List<MusicResponse>> searchMusicByArtist(String search) async {
    final response = await networkService.get(ServiceUrl.path_search,
    queryParameters: {
      'term' : search,
      'limit' : 25
    });
    return ListMusicResponse.fromJson(jsonDecode(response)).results ?? [];
  }


}

