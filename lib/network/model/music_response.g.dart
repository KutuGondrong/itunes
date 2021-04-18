// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMusicResponse _$ListMusicResponseFromJson(Map<String, dynamic> json) {
  return ListMusicResponse(
    resultCount: json['resultCount'] as int?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => MusicResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListMusicResponseToJson(ListMusicResponse instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results,
    };

MusicResponse _$MusicResponseFromJson(Map<String, dynamic> json) {
  return MusicResponse(
    trackName: json['trackName'] as String?,
    artistName: json['artistName'] as String?,
    collectionName: json['collectionName'] as String?,
    artworkUrl60: json['artworkUrl60'] as String?,
    previewUrl: json['previewUrl'] as String?,
  );
}

Map<String, dynamic> _$MusicResponseToJson(MusicResponse instance) =>
    <String, dynamic>{
      'trackName': instance.trackName,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'artworkUrl60': instance.artworkUrl60,
      'previewUrl': instance.previewUrl,
    };
