// import 'package:bloc/bloc.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hack19/src/occasion/occasion.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OccasionBloc extends Bloc<OccasionEvent, OccasionState> {
//   final int limit;

//   OccasionBloc({this.limit = 20});

//   @override
//   OccasionState get initialState => OccasionUninitialized();

//   @override
//   Stream<OccasionState> mapEventToState(OccasionEvent event) async* {
//     if (event is FetchOccasions) {
//       final snapshot = await _fetchOccasions();
//       // TODO: Process occasions
//       if (snapshot.documents.isEmpty)
//       yield OccasionLoaded([]);
//     }
//   }

//   AsyncSnapshot<QuerySnapshot> _fetchOccasions() async {
//     StreamBuilder
//     var query = Firestore.instance.collection('occasion');
//     if (currentState is OccasionLoaded) {
//       // TODO: Get last occasion and remove it afterwards
//       // query = query.startAfterDocument(startAfter);
//     }
//     return query.snapshots().first;
//   }
// }
