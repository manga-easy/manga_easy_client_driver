import 'package:client_driver/client_driver.dart';

void main() {
  final ClientRequest client = ClientDio();
  client.get(path: '<your endpoint>');
}
