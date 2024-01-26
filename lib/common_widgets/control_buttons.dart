import 'package:flutter/material.dart';
import 'package:test/audio_helpers/page_manager.dart';
import 'package:test/common_widgets/data_collection.dart';

import '../audio_helpers/service_locator.dart';

class ControlButtons extends StatelessWidget {
  final bool shuffle;
  final bool miniPlayer;
  final List buttons;
  const ControlButtons(
      {super.key,
      this.shuffle = false,
      this.miniPlayer = false,
      this.buttons = const ["Previous", "Play/Pause", "Next"]});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: buttons.map((e) {
        switch (e) {
          case "Previous":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isFirstSongNotifier,
                builder: (context, isFirst, ___) {
                  return IconButton(
                      onPressed: isFirst ? null : pageManager.previous,
                      icon: Image.asset(
                        "assets/images/backward_button.png",
                        width: miniPlayer ? 20 : 50,
                        height: miniPlayer ? 20 : 50,
                        color: controlButtonColor,
                      ));
                });
          case "Play/Pause":
            return SizedBox(
              width: miniPlayer ? 40 : 70,
              height: miniPlayer ? 40 : 70,
              child: ValueListenableBuilder<ButtonState>(
                valueListenable: pageManager.playButtonNotifier,
                builder: (context, value, __) {
                  return Stack(
                    children: [
                      if (value == ButtonState.loading)
                        Center(
                          child: SizedBox(
                            height: miniPlayer ? 40 : 70,
                            width: miniPlayer ? 40 : 70,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  controlButtonColor),
                            ),
                          ),
                        ),
                      if (miniPlayer)
                        Center(
                            child: value == ButtonState.playing
                                ? IconButton(
                                    onPressed: pageManager.pause,
                                    icon: Image.asset(
                                      "assets/images/pause_button.png",
                                      height: 20,
                                      width: 20,
                                      color: controlButtonColor,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: pageManager.play,
                                    icon: Image.asset(
                                      "assets/images/play_button.png",
                                      color: controlButtonColor,
                                      width: 20,
                                      height: 20,
                                    )))
                      else
                        Center(
                            child: value == ButtonState.playing
                                ? IconButton(
                                    onPressed: pageManager.pause,
                                    icon: Image.asset(
                                      "assets/images/pause_button.png",
                                      width: 50,
                                      height: 50,
                                      color: controlButtonColor,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: pageManager.play,
                                    icon: Image.asset(
                                      "assets/images/play_button.png",
                                      color: controlButtonColor,
                                      width: 50,
                                      height: 50,
                                    )))
                    ],
                  );
                },
              ),
            );
          case "Next":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isLastSongNotifier,
                builder: (context, isLast, ___) {
                  return IconButton(
                      onPressed: isLast ? null : pageManager.next,
                      icon: Image.asset(
                        "assets/images/forward_button.png",
                        width: miniPlayer ? 20 : 50,
                        height: miniPlayer ? 20 : 50,
                        color: controlButtonColor,
                      ));
                });
          default:
            return Container();
        }
      }).toList(),
    );
  }
}
