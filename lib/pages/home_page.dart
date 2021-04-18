import 'package:flutter/cupertino.dart';
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
            body: Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: Column(
                      children: [
                        SearchWidget(
                          loading: _homeStore.loading,
                          onTextChange: (text) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _homeStore.searchMusicByArtist(text);
                          },
                        ),
                        Expanded(
                            child: _homeStore.musicModels.length > 0 ? ListView.builder(
                              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              itemCount: _homeStore.musicModels.length,
                              itemBuilder: (context, index) => ItemSongWidget(
                                homeStore: _homeStore,
                                position: index,
                              ),
                            ) : _homeStore.musicModels.length == 0 && _homeStore.loading == true ?
                            Center(
                              child: CupertinoActivityIndicator(),
                            ) :
                            Center(
                              child: Text('Hmmmm.... Sorry ... We couldn\'t find what you wanted', ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                if (_homeStore.loading == false && _homeStore.musicModels.length > 0)
                  PlayerWidget(
                    homeStore: _homeStore,
                  ),
              ],
            )
          );
        }),
    );
  }
}
