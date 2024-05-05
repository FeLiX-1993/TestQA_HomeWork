﻿#language: ru

@tree

Функционал: Создание цепочки документов продажи

Как менеджер по продажам я хочу
ввести документ продажи
чтобы продать товар   

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Cоздание документа заказа клиента
// создание моего нового документа заказ клиента
* Закрытие всех окон
	И я закрываю все окна клиентского приложения
* Открытие формы документов продаж
	И В командном интерфейсе я выбираю "Продажи" "Документы продаж"
	Тогда открылось окно "Документы продаж"
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруЗаказ'
* Заполнение шапки документа заказа
	Тогда открылось окно "Заказ (создание)"
	И из выпадающего списка "Организация" я выбираю точное значение "ООО \"1000 мелочей\""
	Тогда элемент формы с именем 'Организация' стал равен "ООО \"1000 мелочей\""	
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000006" | "Пантера АО"   |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
* Заполнение таблицы товары
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000004" | "Сметана"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка заполнения таблицы товары
	Тогда таблица 'Товары' содержит строки:
		| "Товар"   | "Цена"  | "Количество" | "Сумма" |
		| "*" 		| "20,00" | "1"          | "20,00" | // * означает любое запонленное значение
* Номер 
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение заказа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 5 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |

Сценарий: Проверка создания номенклатуры Колбаса
И В командном интерфейсе я выбираю "Закупки" "Товары"
И таблица "Список" содержит строки:
	| 'Наименование' |
	| 'Колбаса'      |



	
	
