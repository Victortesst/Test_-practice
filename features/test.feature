# encoding: UTF-8
# language: ru

  Функция: Тест

    Структура сценария: test1
      Дано захожу на страницу "https://tester67.github.io"
      И ввожу в поле <email>
      И я должен увидеть текст на странице "<status>"

      Примеры:
        | email                      | status           |
        | Vsozonenkov@gmail.com      | Адрес правильный |
        |                            | Поле пустое      |
        | .Vsozonenkov@gmail.com     | Адрес неверный   |
        | Всозоненков@gmail.com      | Адрес неверный   |
        | Vsozonenkov@гмайл.ком      | Адрес неверный   |
        | Vsozonenkov@               | Адрес неверный   |
        | @gmail.com                 | Адрес неверный   |
        | Vso zonenkov@gmail.com     | Адрес неверный   |
        | Vsozonenkov@g mail.com     | Адрес неверный   |
        | Vsozo_123_nenkov@gmail.com | Адрес правильный |
        | Vsozonenkov@g_123_mail.com | Адрес правильный |
        | Vsozonenkov@gmail.c        | Адрес неверный   |
        | Vsozonenkovgmail.com       | Адрес неверный   |



Сценарий: test2
  Дано захожу на страницу "https://tester67.github.io/twopage.html"
  И ввожу "Виктор" в поле с id "name"
  И ввожу "Созоненков" в поле с id "surname"
  И ввожу "34" в поле с id "age"
  Когда выбираю текст "Женский" в выпадающем списке с id "select_id"
  Тогда нажимаю кнопку с текстом "Экспортировать в xml"

  И я должен увидеть файл в папке tmp

  И я должен увидеть в файле xml тег "name"
  И я должен увидеть в теге "name" текст "Виктор"

  И я должен увидеть в файле xml тег "surname"
  И я должен увидеть в теге "surname" текст "Созоненков"

  И я должен увидеть в файле xml тег "age"
  И я должен увидеть в теге "age" текст "34"

  И я должен увидеть в файле xml тег "gender"
  И я должен увидеть в теге "gender" текст "Женский"