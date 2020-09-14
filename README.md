# flutter_app_testing

A Flutter App study about testing.

## Tests

Na pasta `test/` estão os testes unitários separados por pastas:

- `app/` : Exemplo de teste que vem configurado quando se cria um novo App em Flutter. Para executá-lo
         utilize o comando
          
          flutter test test/app

- `counter/` : Exemplo de teste unitário simples para testar uma classe (Counter). Execute com o
         comando:
         
         flutter test test/counter

- `dio/` : Exemplo de teste com mockito para interceptar chamadas ao Dio. Execute com o comando:
         
         flutter test test/dio

- `mock/` : Exemplo de teste com mockito para interceptar chamadas ao http.client. Execute com o
         comando:

         flutter test test/mock

- `test_widget/` : Exemplo de teste utilizando testWidget para acessar os widgets e acioná-los.

         flutter test test/test_widget

- `todo_list/` : Exemplo de teste utilizando testWidget que interage com uma lista.

         flutter test test/todo_list

Na pasta `test_driver/` estão os testes de integração que testam a interface do App executando
num dispositivo ou no emulador.

- `app/` : Exemplo de test driver para testar o App do contador. Para executar:

         flutter drive --target=test_driver/app/app.dart

- `profile/` : Exemplo de test driver para gerar dados de profile. Para executar:

        flutter drive --target=test_driver/profile/app_long_list_profile.dart --profile

- `scroll/` : Exemplo de test driver para testar a rolagem de uma lista longa. Para executar:

        flutter drive --target=test_driver/scroll/app_long_list.dart

> Para determinar o `device-id` para selecionar qual dispositivo utilizar para o teste faça:
> ```shell script
> adb devices
> List of devices attached
> 0018046067      device
> ```
> Para executar o teste em um device específico, passe o parâmetro `device-id` seguido pelo
> identificador.
> ```shell script
> flutter drive --target=test_driver/scroll/app_long_list.dart --device-id 0018046067
> ```
