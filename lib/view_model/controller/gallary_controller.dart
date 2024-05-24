import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
enum DataStatus{loading,complete,error}
class GalleryController extends ChangeNotifier{
  List<String> images=[];
  DataStatus status=DataStatus.loading;
  getData()async{
    status=DataStatus.loading;
    notifyListeners();
    FirebaseFirestore.instance.collection('gallery').get().then((value){
      images=value.docs.map((e) => e.get('url').toString()).toList();
      status=DataStatus.complete;
      notifyListeners();
    }).onError((error, stackTrace){
      status=DataStatus.error;
      notifyListeners();
    });
  }

}