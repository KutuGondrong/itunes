import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:itunes/constants/colors.dart';
import 'package:itunes/pages/store/home_store.dart';

class ItemSongWidget<T extends HomeStore> extends StatefulWidget {
  final T homeStore;
  final int position;
  const ItemSongWidget({Key? key, required this.homeStore, required this.position}) : super(key: key);

  @override
  _ItemSongWidgetState createState() => _ItemSongWidgetState();
}

class _ItemSongWidgetState extends State<ItemSongWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.homeStore.lastPositionPlayer == widget.position ? darkPrimaryColor.withOpacity(0.5) : primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: widget.homeStore.lastPositionPlayer == widget.position ? darkPrimaryColor : darkPrimaryColor.withOpacity(0.5),
                offset: Offset(20,8),
                spreadRadius: 3,
                blurRadius: 25
            ),
            BoxShadow(color: widget.homeStore.lastPositionPlayer == widget.position ? Colors.white : Colors.white.withOpacity(0.5),offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            widget.homeStore.changeIndexPositionMusic(widget.position);
          },
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.homeStore.musicModels[widget.position].artworkUrl60.toString(),
                      loadingBuilder:(context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 60,
                          width: 60,
                          child: CupertinoActivityIndicator(),
                        );
                      },
                    ),
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: darkPrimaryColor,
                        offset: Offset(20,8),
                        spreadRadius: 3,
                        blurRadius: 25
                    ),
                    BoxShadow(color: Colors.white,offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
                    )
                  ],
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.homeStore.musicModels[widget.position].trackName.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      widget.homeStore.musicModels[widget.position].artistName.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      widget.homeStore.musicModels[widget.position].collectionName.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w100
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.homeStore.lastPositionPlayer == widget.position && widget.homeStore.playing == true)
                Icon(Icons.audiotrack_rounded)
            ],
          ),
        ),
      );
    });

  }
}
