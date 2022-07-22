import 'package:lesson10_homework/blocs/remote_bloc.dart';

abstract class RemoteEvent{}

class IncrementVolumeEvent extends RemoteEvent{

  final int increment;

  IncrementVolumeEvent(this.increment);
}

class DecrementVolumeEvent extends RemoteEvent{

  final int decrement;

  DecrementVolumeEvent(this.decrement);
}

class MuteEvent extends RemoteEvent{}

class IncrementChannelEvent extends RemoteEvent{

  final int increment;

  IncrementChannelEvent(this.increment);
}

class DecrementChannelEvent extends RemoteEvent{

  final int decrement;

  DecrementChannelEvent(this.decrement);
}