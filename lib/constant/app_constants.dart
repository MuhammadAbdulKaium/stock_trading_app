class AppConstants {
  static const String baseUrl = 'https://stock-api.riyadahsan.com'; // Replace with your actual base URL

  static const String loginEndpoint = '/api/auth/login';
  static const String signUpEndpoint = '/api/users/';

  static const String updatePersonalInfoEndpoint = '/api/users/';
  static const String updateUserPhoto = '/api/users/picture';
  static const String updateUserNid = '/api/users/nid';

  static const String getMyBankInfoEndpoint = '/api/user-bank-info/my';
  static const String updateBankInfoEndpoint = '/api/user-bank-info';

  static const String getNomineeInfoEndpoint = '/api/user-nominee-info/my';
  static const String updateNomineeInfoEndpoint = '/api/user-nominee-info';
  static const String updateNomineeNid = '/api/user-nominee-info/nid';
}