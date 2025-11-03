import 'package:equatable/equatable.dart';

abstract class InitEvent extends Equatable {}

class Initialize extends InitEvent {
  @override
  List<Object?> get props => [];
}
