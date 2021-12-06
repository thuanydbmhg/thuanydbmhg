import 'package:flutter_architecture/domain/login/use_cases/login_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock.dart';

void main() {
  test('Login form usecase', () {
    final mockRepository = LoginRepositoryMock();
    final useCase = LoginUseCase(mockRepository);

    useCase.login('test', 'test');

    verify(mockRepository.login('test', 'test'))
        .called(1);
  });
}
