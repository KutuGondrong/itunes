import 'package:flutter_test/flutter_test.dart';
import 'package:itunes/pages/store/home_store.dart';

void main() {
  test('When search music '
          'should contains that item', () async {
    final homeStore = HomeStore();
    await homeStore.searchMusicByArtist();
    expect(homeStore.musicModels.length > 0, true);
    expect(homeStore.musicModels.length, 25);

  });
}
