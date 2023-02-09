import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_responsive/repository/contact.dart';
import 'package:flutter_responsive/model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository repository;
  ContactBloc(this.repository) : super(ContactInitial()) {
    on<GetContactEvent>((event, emit) async {
      emit(ContactLoading());
      try {
        Data? res = await repository.getContactById(event.id);
        emit(ContactFinish(res!));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(ContactError(e.toString()));
      }
    });
  }
}
