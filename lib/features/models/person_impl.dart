// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';

class PersonImpl implements PersonInterface {
  final String _name;
  final String _cpf;
  final String _date;
  final String _phone;

  PersonImpl(
      {required String name,
      required String cpf,
      required String date,
      required String phone})
      : _name = name,
        _cpf = cpf,
        _date = date,
        _phone = phone;

  @override
  String get name => _name;

  @override
  String get cpf => _cpf;

  @override
  String get date => _date;

  @override
  String get phone => _phone;

  @override
  String toString() {
    return 'PersonImpl(_name: $_name, _cpf: $_cpf, _date: $_date, _phone: $_phone)';
  }
}
