import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



final fr = Firestore.instance.collection('resturants').document().collection('items');

getItemsToList(String docId) {
  fr.getDocuments().then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
    });
  });
//fr.document(docId).get().then((DocumentSnapshot doc){
//  print(doc.data);
//});
}

 getData() {
  fr.getDocuments().then((QuerySnapshot snapshot) {
    snapshot.documents.forEach(
      (DocumentSnapshot f) => print(
        '${f.data}}',
      ),
    );

  });
}
