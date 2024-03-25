class Endpoints {
  static const baseUrl = "https://watchstore.sasansafari.com$versionRoute";
  static const versionRoute = "/public/api/v1";
  static const sendSms = "$baseUrl/send_sms";
  static const checkSmsCode = "$baseUrl/check_sms_code";
  static const register = "$baseUrl/register";
  static const productsByBrand = "$baseUrl/products_by_brand/";
  static const productsByCategory = "$baseUrl/products_by_category/";
  static const search = "$baseUrl/all_products/";
  static const home = "$baseUrl/home";
  static const userCart = "$baseUrl/user_cart";
  static const productDetail = "$baseUrl/product_details/";
  static const addToCart = "$baseUrl/add_to_cart";
  static const removeFromCart = "$baseUrl/remove_from_cart";
  static const deleteFromCart = "$baseUrl/delete_from_cart";
  static const totalPrice = "$baseUrl/total_cart_price";

  static const getProcessingOrder = "$baseUrl/user_processing_orders";
  static const getCanceledOrder = "$baseUrl/user_cancelled_orders";
  static const getAddress = "$baseUrl/user_addresses";
  static const getRecievedOrder = "$baseUrl/user_received_orders";
  static const getUserInfo = "$baseUrl/profile";
}

class ProductSortRoutes {
  static const newestProducts = "/newest_products";
  static const cheapestProducts = "/cheapest_products";
  static const mostExpensiveProducts = "/most_expensive_products";
  static const mostViewedProducts = "/most_viewed_products";
}