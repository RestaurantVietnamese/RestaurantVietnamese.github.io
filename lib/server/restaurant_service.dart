import 'package:restaurant_with_frog_api/base/base_response.dart';
import 'package:restaurant_with_frog_api/flavor/flavor_config.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/dishes/paginated_dishes.dart';
import 'package:restaurant_with_frog_api/base/dio_client.dart'; // 👈 đảm bảo import đúng file chứa DioClient

final DioClient _client = DioClient();

class RestaurantService {
  static String get baseUrl => FlavorConfig.baseUrl;

  //----------------------------------Auth--------------------------------------------------------------------------
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String username,
    String role = 'user',
  }) async {
    return await _client.request(
      path: '$baseUrl/auth/register',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'email': email,
        'password': password,
        'username': username,
        'role': role,
      },
    );
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    return await _client.request(
      path: '$baseUrl/auth/login',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    return await _client.request(
      path: '$baseUrl/auth/refresh_token',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'refreshToken': refreshToken,
      },
    );
  }
  static Future<Map<String, dynamic>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    return await _client.request(
      path: '$baseUrl/auth/verify_otp',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'email': email,
        'otp': otp,
      },
    );
  }

  //------------------------------------------------------------------------------------------------------------------------

  static Future<BaseResponse<PaginatedDishes>> fetchAllDishes({
    int page = 1,
    String? sort,
  }) async {
    final res = await _client.request(
      path: '$baseUrl/dishes',
      method: RequestMethod.get,
      query: {
        'page': page,
        if (sort != null) 'sort': sort,
      },
    );

    return BaseResponse.fromJson(
      {'data': res},
      (data) => PaginatedDishes.fromJson(data),
    );
  }

  static Future<List<Dish>> searchDishes(
    String keyword, {
    String? sort,
    bool matchAll = true,
  }) async {
    final queryParams = {
      'keyword': keyword,
      if (sort != null) 'sort': sort,
      if (matchAll) 'match': 'all',
    };

    final res = await _client.request(
      path: '$baseUrl/dishes_search',
      method: RequestMethod.get,
      query: queryParams,
    );

    final List list = res['results'];
    return list.map((e) => Dish.fromJson(e)).toList();
  }

  static Future<Dish> getDishById(String id) async {
    final res = await _client.request(
      path: '$baseUrl/dishes/$id',
      method: RequestMethod.get,
    );
    return Dish.fromJson(res);
  }

  static Future<Dish> createDish(Map<String, dynamic> data) async {
    final res = await _client.request(
      path: '$baseUrl/dishes',
      method: RequestMethod.post,
      body: data,
    );
    return Dish.fromJson(res);
  }

  static Future<Dish> updateDish(String id, Map<String, dynamic> data) async {
    final res = await _client.request(
      path: '$baseUrl/dishes/$id',
      method: RequestMethod.put,
      body: data,
    );
    return Dish.fromJson(res);
  }

  static Future<void> deleteDish(String id) async {
    await _client.request(
      path: '$baseUrl/dishes/$id',
      method: RequestMethod.delete,
    );
  }

  //------------------------------------Table---------------------------------------------------------------------------
  /// GET /tables - Lấy danh sách tất cả bàn
  static Future<List<TableItem>> fetchAllTables() async {
    final res = await _client.request(
      path: '$baseUrl/tables',
      method: RequestMethod.get,
    );

    final List data = res['results'];
    return data.map((e) => TableItem.fromJson(e)).toList();
  }

  /// POST /tables - Lưu hoặc cập nhật 1 bàn
  static Future<void> saveSingleTable(TableItem table) async {
    await _client.request(
      path: '$baseUrl/tables',
      method: RequestMethod.post,
      body: table.toJson(),
    );
  }

  /// POST /tables/save-all - Lưu toàn bộ danh sách bàn
  static Future<void> saveAllTables(List<TableItem> tables) async {
    await _client.request(
      path: '$baseUrl/tables/save_all',
      method: RequestMethod.post,
      body: tables.map((e) => e.toJson()).toList(), // ✅ giờ không còn lỗi
    );
  }
}