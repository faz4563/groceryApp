// ignore_for_file: file_names, non_constant_identifier_names

class ApiConstants {
  static String mobile = "192.168.195.113";
  static String off1 = "192.168.1.102";
  static String home = "192.168.1.8";
  static String ip = mobile;
  static String LoginApi = "http://$ip:5000/login";
  static String addUserApi = "http://$ip:5000/add_user";
  static String saveOrderApi = "http://$ip:5000/save_order";
  static String getOrderApi = "http://$ip:5000/get_cart_products";
  static String getProdApi = "http://$ip:5000/get_products";
  static String deleteOrderApi = "http://$ip:5000/deleteAllorders";
}
