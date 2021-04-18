import 'package:json_annotation/json_annotation.dart';

part 'music_response.g.dart';


@JsonSerializable()
class ListMusicResponse {
  int ?resultCount;
  List<MusicResponse>? results;

  ListMusicResponse({this.resultCount, this.results});

  factory ListMusicResponse.fromJson(Map<String, dynamic> json) {
    return _$ListMusicResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListMusicResponseToJson(this);
  }
}

@JsonSerializable()
class MusicResponse {
  String? trackName;
  String? artistName;
  String? collectionName;
  String? artworkUrl60;
  String? previewUrl;

  MusicResponse({this.trackName, this.artistName, this.collectionName, this.artworkUrl60, this.previewUrl});

  factory MusicResponse.fromJson(Map<String, dynamic> json) {
    return _$MusicResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicResponseToJson(this);
  }
}
