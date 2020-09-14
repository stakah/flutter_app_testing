import 'dart:convert';
import 'dart:math';

import 'package:flutter_app_testing/dio/model/model.dart';
import 'package:flutter_app_testing/dio/service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {

  DioAdapterMock(){
    print("[DioAdapterMock]");
  }
}

const dioHttpHeadersForResponseBody = {
  Headers.contentTypeHeader: [Headers.jsonContentType],
};

void main() {
  group('UserRemoteDataSource', () {
    final Dio dio = Dio();
    User user;
    DioAdapterMock dioAdapterMock;
    Service service;

    setUp(() {
      dioAdapterMock = DioAdapterMock();
      dio.httpClientAdapter = dioAdapterMock;
      service = Service(dio);
    });

    group('get users', () {
      test('when getting users receives JSON with User data', () async {
        final responsePayload = '['
            '{'
            '"id": 109,'
            '"name": "Stewart Little",'
            '"username": "Lit",'
            '"email": "BigLittle@muzk.me",'
            '"address": {'
            '"street": "Xez",'
            '"suite": "Apt. 43",'
            '"city": "Bo",'
            '"zipcode": "55432-3456",'
            '"geo": {'
            '"lat": "-38.4159",'
            '"lng": "82.5496"'
            '}'
            '},'
            '"phone": "1-876-555-7780",'
            '"website": "little.org",'
            '"company": {'
            '"name": "Doughnought",'
            '"catchPhrase": "Personal amusement",'
            '"bs": "synergy"'
            '}'
            '}'
            ']';
        final httpResponse = ResponseBody.fromString(responsePayload, 200, headers: dioHttpHeadersForResponseBody,);

        when(dioAdapterMock.fetch(any, any, any)).thenAnswer((realInvocation) async => httpResponse);

        List<User> list = await service.users();

        expect(list, isA<List<User>>());
        expect(list.length, 1);

        var user = list[0];
        expect(user, isA<User>());
        expect(user.id, 109);
        expect(user.name, "Stewart Little");
        expect(user.username, "Lit");
        // final userCredentials = UserLoginRequestBody(password: 'password', email: 'email');
        // final responsePayload = json.encode({ 'token': 'token' });
        // final httpResponse = ResponseBody.fromString(responsePayload, 200, headers: dioHttpHeadersForResponseBody,);

        // when(dioAdapterMock.fetch(any, any, any)).thenAnswer((_) async => httpResponse);

        // final subject = await dataSource.login(userCredentials);
        // final expected = UserLoginResponse(token: 'token');

        // expect(subject, expected);
      });
    });
  });
}