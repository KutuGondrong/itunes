import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:itunes/constants/colors.dart';
import 'package:itunes/pages/store/home_store.dart';
import 'package:itunes/pages/component/search_widget.dart';
import 'package:provider/provider.dart';

import 'component/item_song_widget.dart';
import 'component/player_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => HomeStore(),
        child: Observer(builder: (context) {
          var _homeStore = context.watch<HomeStore>();
          return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              child: Column(
                children: [
                  SearchWidget(
                    loading: _homeStore.loading,
                    onTextChange: (text) {
                      _homeStore.searchMusicByArtist(text);
                    },
                  ),
                  Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        itemCount: context.watch<HomeStore>().musicModels.length,
                        itemBuilder: (context, index) => ItemSongWidget(
                          homeStore: _homeStore,
                          position: index,
                        ),
                      )
                  ),
                  if (_homeStore.loading == false)
                  PlayerWidget(
                    homeStore: _homeStore,
                  ),
                ],
              ),
            )
          );
        }),
    );
  }
}
