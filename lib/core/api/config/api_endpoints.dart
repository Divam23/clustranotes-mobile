import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();
  
  static final String baseUrl = dotenv.get('BASE_API_URI');

}
