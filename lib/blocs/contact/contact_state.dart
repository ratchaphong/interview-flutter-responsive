part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
}

class ContactFinish extends ContactState {
  final Data? contact;

  ContactFinish(this.contact);
}
