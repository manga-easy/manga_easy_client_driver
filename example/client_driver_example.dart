import 'package:client_driver/client_driver.dart';

void main() {
  DriverHttp client = DioDriver();
  client.get(path: '<your endpoint>');
}
