﻿#language: ru

@tree

Функционал: Проверка заполнения шапки документа заказ покупателя

Как тестировщик я хочу
проверить заполнение полей документа 
чтобы удостовериться в правильности написания кода   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения шапки документа заказ покупателя
* Заполнение основных данных
	И Подготовка основных данных
* Проверка заполнения партнера с 1-им соглашением
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно "Заказ покупателя (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"            |
		| "1"   | "Клиент 1 (1 соглашение)" |
	И в таблице 'List' я выбираю текущую строку
	Тогда элемент формы с именем 'Partner' стал равен "Клиент 1 (1 соглашение)"
	И элемент формы с именем 'LegalName' стал равен "Клиент 1"
	И элемент формы с именем 'Agreement' стал равен "Соглашение с клиентами (расчет по документам + кредитный лимит)"
	И я закрываю все окна клиентского приложения
* Проверка заполнения партнера с 2-мя соглашением
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно "Заказ покупателя (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"            |
		| "2"   | "Клиент 2 (2 соглашения)" |
	И в таблице 'List' я выбираю текущую строку
	Тогда элемент формы с именем 'Partner' стал равен "Клиент 2 (2 соглашения)"
	И элемент формы с именем 'LegalName' стал равен "Клиент 2"
	И элемент формы с именем 'Agreement' стал равен ""
	И я закрываю все окна клиентского приложения	
* Проверка заполнения соглашения
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно "Заказ покупателя (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"            |
		| "2"   | "Клиент 2 (2 соглашения)" |
	И в таблице 'List' я выбираю текущую строку
	Когда открылось окно "Заказ покупателя (создание) *"
	И я нажимаю кнопку выбора у поля с именем 'Agreement'
	Тогда открылось окно "Соглашения"
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"                                        |
		| "2"   | "Индивидуальное соглашение 1 (расчет по соглашениям)" |
	И в таблице 'List' я выбираю текущую строку	
	Тогда элемент формы с именем 'Agreement' стал равен "Индивидуальное соглашение 1 (расчет по соглашениям)"
	И элемент формы с именем 'Company' стал равен "Собственная компания 1"
	И элемент формы с именем 'Currency' стал равен "USD"
	И элемент формы с именем 'PriceIncludeTax' стал равен "Да"
	И элемент формы с именем 'Store' стал равен "Склад 1 (с контролем остатка)"
	И я закрываю все окна клиентского приложения	
* Проверка блокировки контрагента
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно "Заказ покупателя (создание)"
	И в поле с именем 'Partner' я ввожу текст ""
	И элемент формы с именем "LegalName" не доступен
	

		

