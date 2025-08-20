import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Future manageJwtToken({ String? value, bool isStore = true}) async 
// { const storage = FlutterSecureStorage(); 
//   if (isStore && value != null) 
//   {await storage.write(key: 'jwt_token', value: value); } 
//   else {await storage.read(key: 'jwt_token'); 
//   } 
// }

Future addToken({required String value}) async
{
    const storage = FlutterSecureStorage();
    if(value.isNotEmpty)
    {
        await storage.write(key: 'Authorization', value: value);
    }
}

Future<String?> getToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'Authorization');
}