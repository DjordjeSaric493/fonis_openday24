//kreiram kolekciju referenci ovde

import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final spisakpitanjaref = fireStore.collection('spiskovipitanja');
