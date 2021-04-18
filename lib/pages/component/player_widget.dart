import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:itunes/constants/colors.dart';
import 'package:itunes/pages/store/home_store.dart';

class PlayerWidget<T extends HomeStore> extends StatefulWidget {
  final T homeStore;

  const PlayerWidget({Key? key, required this.homeStore}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    widget.homeStore.prevPosition();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    color: widget.homeStore.lastPositionPlayer == 0 ? Colors.grey.withOpacity(0.4) : Colors.grey,
                    size: 50,
                  )
                ),
                InkWell(
                  child: Icon(
                    widget.homeStore.playing == true ? Icons.pause : Icons.play_arrow,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onTap: () {
                    widget.homeStore.setPlaying();
                  },
                ),
                InkWell(
                    onTap: () {
                      widget.homeStore.nextPosition();
                    },
                    child: Icon(
                      Icons.skip_next,
                      color: widget.homeStore.lastPositionPlayer == widget.homeStore.musicModels.length-1 ? Colors.grey.withOpacity(0.4) : Colors.grey,
                      size: 50,
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: widget.homeStore.position==null? 0 : widget.homeStore.position!.inMilliseconds.toDouble() ,
                activeColor: darkPrimaryColor,
                inactiveColor: darkPrimaryColor.withOpacity(0.3),
                onChanged: (value) {

                  widget.homeStore.seekAudio(Duration(milliseconds: value.toInt()));

                },
                min: 0,
                max:widget.homeStore.totalDuration==null? 20 : widget.homeStore.totalDuration!.inMilliseconds.toDouble() ,
              ),
            )
          ],
        ),
      );
    });
  }
}
