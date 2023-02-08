import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class ArtigoModel extends Model {
  QuerySnapshot sps;
  DocumentSnapshot docUser =  Firestore.instance.collection('usuarios')
            .getDocuments() as DocumentSnapshot;

      //QuerySnapshot spse = docUser.reference.firestore.collection('artigos').getDocuments() as QuerySnapshot;



}
