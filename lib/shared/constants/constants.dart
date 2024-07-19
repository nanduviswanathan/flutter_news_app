//This class contains the constants

class Constants {
  Constants._();

  // Title texts
  static const String newsAppText = 'News App';
  static const String myNewsText = 'MyNews';
  static const String nameText = 'Name';
  static const String emailText = 'Email';
  static const String passwordText = 'Password';
  static const String loginText = 'Login';
  static const String signupText = 'Signup';

  static const String alreadyHaveAccountText = 'Already have an account? ';
  static const String newHereText = 'New here? ';

  static const String enterValidNameText = 'Please enter a valid name';
  static const String enterValidEmailText = 'Please enter a valid email';
  static const String enterValidPasswordText = 'Please enter a valid password';
  static const String requiredText = '*Required';
  static const String topHeadLineText = 'Top Headlines';

  static const String countryText = 'country';
  static const String apiKeyText = 'apiKey';
  static const String countryCodeKey = "country_code";
  static const String dismissText = 'Dismiss';

  static const String accountCreatedSucessfullyText =
      'Account created successfully!';
  static const collectionName = 'users';
  static const String newsAPiKey = 'NEWS_API_KEY';

  //Regex Texts
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //API  and endpoints
  static const String kApiBaseUrl = 'https://newsapi.org'; //prod
  static const String newsEndpoint = '/v2/top-headlines';
}
