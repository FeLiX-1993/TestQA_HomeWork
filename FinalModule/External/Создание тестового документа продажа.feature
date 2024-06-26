﻿#language: ru

@tree
@ExportScenarios

Функционал: Создание тестового документа продажа 

Переменные: 

	импорт "Переменные.feature"

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание тестового документа продажа

	// Документ.РасходТовара
	И я проверяю или создаю для документа "РасходТовара" объекты:
		| 'Ссылка'                                                                | 'ПометкаУдаления' | 'Номер'                       | 'Дата'                       | 'Проведен' | 'Покупатель'                                                             | 'Склад'                                                             | 'Валюта'                                                            | 'ВидЦен'                                                             | 'ОбоснованиеОтгрузки' | 'Организация'                                                            |
		| 'e1cib/data/Документ.РасходТовара?ref=aa633c6aa7a1839311ef27dd6f4305f3' | 'False'           | '$НомерДокументаДляПроверки$' | '$ДатаДокументаДляПроверки$' | 'True'     | 'e1cib/data/Справочник.Контрагенты?ref=aa633c6aa7a1839311ef27d292d6f42b' | 'e1cib/data/Справочник.Склады?ref=8ca1000d8843cd1b11dc8eb49faea67b' | 'e1cib/data/Справочник.Валюты?ref=a9b000055d49b45e11db8c4421dda1c5' | 'e1cib/data/Справочник.ВидыЦен?ref=a9b000055d49b45e11db8c4c9d5c4224' | ''                    | 'e1cib/data/Справочник.Организации?ref=aa633c6aa7a1839311ef27d292d6f428' |

	И я перезаполняю для объекта табличную часть "Товары":
		| 'Ссылка'                                                                | 'Товар'                                                             | 'Цена' | 'Количество' | 'Сумма' |
		| 'e1cib/data/Документ.РасходТовара?ref=aa633c6aa7a1839311ef27dd6f4305f3' | 'e1cib/data/Справочник.Товары?ref=aa633c6aa7a1839311ef27d292d6f42c' | 800    | 10           | 8000    |
		| 'e1cib/data/Документ.РасходТовара?ref=aa633c6aa7a1839311ef27dd6f4305f3' | 'e1cib/data/Справочник.Товары?ref=aa633c6aa7a1839311ef27d292d6f42d' | 100    | 1            | 100     |

	И я выполняю код встроенного языка на сервере
	"""bsl
		ДокументСсылка = Документы.РасходТовара.НайтиПоНомеру("$НомерДокументаДляПроверки$");
		ДокументОбъект = ДокументСсылка.ПолучитьОбъект();
		ДокументОбъект.Записать(РежимЗаписиДокумента.Проведение);
	"""
