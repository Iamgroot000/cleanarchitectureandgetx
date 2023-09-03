

import '../Domain/entities/formmodel.dart';
import 'abstarctmethodfor form.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<void> registerUser(User user) async {
    // Here, you would implement the actual user registration logic,
    // e.g., sending a network request to your server or saving data locally.
    // For this example, we'll just print the user's information.
    print('Registered user: ${user.username}, ${user.email}');
  }
}
