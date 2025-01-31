import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/core/network_exceptions.dart';
import 'package:note_app/domain/form/i_note_add_form_facade.dart';
import 'package:note_app/domain/note/model/note_fetch_model.dart';

@LazySingleton(as: INoteAddFormFacade)
class FirebaseNoteAddFacade extends INoteAddFormFacade {
  final FirebaseFirestore firebaseFirestore;

  FirebaseNoteAddFacade(this.firebaseFirestore);

  @override
  Future<Either<NetworkExceptions, String>> addNote(NoteModel noteModel) async {
    try {
      await firebaseFirestore.collection("notes").add(noteModel.toJson());
      return right("Task added successfully");
    } catch (e) {
      if (e is SocketException) {
        return left(const NetworkExceptions.noInternetConnection());
      } else {
        return left(const NetworkExceptions.unexpectedError());
      }
    }
  }
}
