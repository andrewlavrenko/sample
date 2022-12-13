import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample/features/sample/domain/models/sample_model.dart';

import '../../../../core/constants/defaults.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modules/network/network_module.dart';
import '../../../../core/modules/network/request.dart';
import '../../../../core/modules/network/response.dart';

@Injectable()
class SampleSource {
  final NetworkClient _client;
  SampleSource(this._client);


  Future<Either<Failure, None>> sampleRequest1(String someone) async {
    return _client.requestForNone(
      '/someone',
      RequestModel.delete(
        queryParameters: {'someone': someone},
        //headers: {'Authorization': 'Bearer $authToken'},
      ),
    );
  }

  Future<Either<Failure, String>> sampleRequest2(String someone) async {
    return _client.requestForObject(
      '/someone',
      RequestModel.get(
        queryParameters: {'someone': someone},
        //headers: {'Authorization': 'Bearer $authToken'},
      ),
    );
  }

  Future<Either<Failure, List<String>>> sampleRequest3() async {
    return _client.requestForList<String>(
        '/someone',
        RequestModel.get(
          queryParameters: {'someone1': 'someone', 'someone2': 0, 'someone3': 20},
          //headers: {'Authorization': 'Bearer $authToken'},
        ),
        key: 'result'
    );
  }

  Future<Either<Failure, SampleModel>> sampleRequest4(String someone) async {
    return _client.requestForObject(
      '/someone',
      RequestModel.post(
        data: {
          'name': someone,
        },
        //headers: {'Authorization': 'Bearer $authToken'},
      ),
    );
  }

  //загрузка файла с получением ответа
  Future<Either<Failure, String>> sampleRequest5(String filePath, String module) async {
    final response = http.MultipartRequest(
      'POST',
      Uri.parse('${Defaults.baseUrl}/someone'),
    );
    final imgResponse = await http.MultipartFile.fromPath(
        'file',
        filePath
    );
    response
      ..files.add(imgResponse)
      ..fields['module'] = module
      //..headers['Authorization'] = 'Bearer $authToken'
      ..headers['Content-Type'] = 'multipart/form-data';
    final result = await response.send();
    final responded = await http.Response.fromStream(result);
    final responseData = json.decode(responded.body);
    final parsed = SingleResponse<String>.fromJson(responseData);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Right(parsed.result);
    } else {
      return Left(ServerFailure(code: result.statusCode));
    }
  }

}