import 'package:equatable/equatable.dart';

abstract class OccasionEvent extends Equatable {}

class FetchOccasions extends OccasionEvent {
  @override
  String toString() => 'Fetch';
}
