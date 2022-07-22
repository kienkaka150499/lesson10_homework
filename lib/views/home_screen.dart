import 'package:flutter/material.dart';
import 'package:lesson10_homework/blocs/remote_bloc.dart';
import 'package:lesson10_homework/blocs/remote_event.dart';
import 'package:lesson10_homework/blocs/remote_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = RemoteBloc();

  @override
  void initState() {
    loadDefaulValue();
    super.initState();
  }

  void loadDefaulValue() async {
    await bloc.initValue();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: StreamBuilder<RemoteState>(
              stream: bloc.stateController.stream,
              initialData: bloc.state,
              builder: (context, AsyncSnapshot<RemoteState> snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Kênh hiện tại: ${snapshot.data?.channel}'),
                    Text('Âm lượng hiện tại: ${snapshot.data?.volume}'),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              bottom: 70,
              right: 70,
              child: FloatingActionButton(
                onPressed: () =>
                    bloc.evenController.sink.add(IncrementChannelEvent(1)),
                child: const Icon(Icons.plus_one),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 0,
              child: FloatingActionButton(
                onPressed: () =>
                    bloc.evenController.sink.add(DecrementChannelEvent(1)),
                child: const Icon(Icons.exposure_neg_1),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 140,
              child: FloatingActionButton(
                onPressed: () =>
                    bloc.evenController.sink.add(IncrementVolumeEvent(5)),
                child: const Icon(Icons.volume_up),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 70,
              child: FloatingActionButton(
                onPressed: () =>
                    bloc.evenController.sink.add(DecrementVolumeEvent(10)),
                child: const Icon(Icons.volume_down),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () =>
                    bloc.evenController.sink.add(MuteEvent()),
                child: const Icon(Icons.volume_mute),
              ),
            ),
          ],
        ));
  }
}
