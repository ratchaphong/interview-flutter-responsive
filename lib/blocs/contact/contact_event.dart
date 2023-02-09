part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class GetContactEvent extends ContactEvent {
  final int id;

  GetContactEvent(this.id);
}
