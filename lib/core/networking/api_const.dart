class ApiConst {
  static const String baseUrl = 'https://dummyjson.com/';
  static const String signup = 'Account/signup';
  static const String login = 'Account/Login';
  static const String getHotel = 'hotel';
  static const String addHotel = 'hotel/add';

  static String updateHotel(String id) => 'hotel/edit/$id';
  static String deleteHotel(String id) => 'hotel/delete/$id';
}
