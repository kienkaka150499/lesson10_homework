import 'dart:async';

import 'package:lesson10_homework/blocs/remote_event.dart';
import 'package:lesson10_homework/blocs/remote_state.dart';

class RemoteBloc {
  var state;

  final evenController = StreamController<RemoteEvent>();

  final stateController = StreamController<RemoteState>();

  Future<void> initValue() async {
    int initChannel = 1;
    int initVolume = 20;

    state = RemoteState(volume: initVolume, channel: initChannel);

    stateController.sink.add(state);

    evenController.stream.listen((RemoteEvent event) {
      if (event is IncrementVolumeEvent) {
        state.volume = state.volume + event.increment;
      } else if (event is DecrementVolumeEvent) {
        int volume = state.volume - event.decrement;
        state.volume = volume > 0 ? volume : 0;
      } else if (event is MuteEvent) {
        state.volume = 0;
      } else if (event is IncrementChannelEvent) {
        state.channel = state.channel + event.increment;
      } else if (event is DecrementChannelEvent) {
        int channel = state.channel - event.decrement;
        state.channel = channel > 0 ? channel : 1;
      }

      stateController.sink.add(state);
    });
  }

  void dispose(){
    stateController.close();
    evenController.close();
  }
}
