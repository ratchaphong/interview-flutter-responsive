import 'package:flutter_responsive/provider/contact.dart';
import 'package:flutter_responsive/model/contact.dart';

class ContactRepository {
  final ContactProvider provider;

  ContactRepository(this.provider);

  Future<Data?> getContactById(
    int id,
  ) async {
    Data? contactData = await provider.getContactById(id);
    return contactData;
  }
}
