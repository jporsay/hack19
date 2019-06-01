import 'package:equatable/equatable.dart';
import 'package:hack19/src/occasion/occasion.dart';

abstract class OccasionState extends Equatable {
  OccasionState([List props = const []]) : super(props);
}

class OccasionUninitialized extends OccasionState {}

class OccasionError extends OccasionState {
  final String error;

  OccasionError(this.error) : super([error]);
}

class OccasionLoaded extends OccasionState {
  final List<Occasion> occasions;

  OccasionLoaded(this.occasions) : super([occasions]);
}
