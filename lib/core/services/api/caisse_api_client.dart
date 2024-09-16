import 'package:dio/dio.dart';
import 'package:pos_flutter/features/Caisse/infrastucture/models/caisse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'caisse_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class CaisseApiClient {
  factory CaisseApiClient(Dio dio, {String? baseUrl}) = _CaisseApiClient;

  @GET('/caisse')
  Future<List<CaisseModel>> getCaisse(
    @Query('days') int days,
  );

  @POST('/caisse/open')
  Future<HttpResponse> openCaisse();

  @POST('/caisse/close')
  Future<HttpResponse> closeCaisse();

  @POST('/caisse/withdraw')
  Future<HttpResponse> withdrawCaisse(@Body() Map<String, dynamic> body);

  @POST('/caisse/deposit')
  Future<HttpResponse> depositCaisse(@Body() Map<String, dynamic> body);
}
