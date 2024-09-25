//kreiram kolekciju referenci ovde

import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final spisakpitanjaref = fireStore.collection('spiskovipitanja');

//konstrukcija BlaBla({ ... })=>šta radim
DocumentReference pitanjaref({
  //vršim poziv, jurim id spiska i pitanja (spiskovipitanja)
  required String spisakId,
  required String pitanjeId,
}) =>
    spisakpitanjaref.doc(spisakId).collection("questions").doc(pitanjeId);
