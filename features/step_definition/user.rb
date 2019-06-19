# windows-1251
# language: ru

require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

When(/^захожу на страницу "(.*)"/) do |url| # Заходим на нужную страницу
  visit url
  sleep 1
end

When(/^ввожу в поле (.*)$/) do |email|         # Вводим email из списка и жмем кнопку
  find("//input[@id='email']").set(email)
  find("//input[@type='button']").click

end

When(/^я должен увидеть текст на странице "(.*?)"$/) do |status| # Проверяем появился ли ожидаемый статус
  sleep 2
  switch_to_window page.windows[0]
  page.should have_text status
end

When(/^ввожу "([^"]*)" в поле с id "([^"]*)"$/) do |text, fields_id| # Заполняем поля
  find("//input[@id='#{fields_id}']").set(text)

end

When(/^выбираю текст "([^"]*)" в выпадающем списке с id "([^"]*)"$/) do |text, select_id| # Выбираем указанное значение в выпадающем списке
  find("//select[@id='#{select_id}']/option[text()='#{text}']").click
end

When(/^нажимаю кнопку с текстом "([^"]*)"$/) do |text| # Жмем кнопку
  find("//input[@value='#{text}']").click

end



When(/^я должен увидеть файл в папке tmp$/) do       # Проверяем наличие файла
  sleep 15
  raise('папка tmp пуста') if Dir.glob('C:/Users/Виктор/Documents/git/ruby_test_project/features/tmp')[0].nil?
end


When(/^я должен увидеть в файле xml тег "(.*?)"$/) do |tag_text|    # Ищем тег в файле
  file_path = "C:/Users/Виктор/Documents/git/ruby_test_project/features/tmp/test.xml"
  File.open(file_path) do |f|
    doc = Nokogiri::XML(f)
    tag_name = tag_text.scan(/[\wА-Яа-я-]+/)[0]
    fail "В содержимом файла тэг #{tag_text} отсутствует" unless doc.xpath("//#{tag_name}").find do |item|
      item.to_s.encode('UTF-8').include? tag_text
    end
  end
end

When(/^я должен увидеть в теге "(.*)" текст "(.*)"$/) do |tag, text|    # Ищем текст в теге
  # путь до папки tmp в проекте
  file_path = 'C:/Users/Виктор/Documents/git/ruby_test_project/features/tmp/test.xml'
  File.open(file_path) do |f|
    doc = Nokogiri::XML(f)
    tag = doc.at_css "#{tag}"
    tag.should have_text text
  end
end

