# ИСБД Лабораторная работа №3
___
## Задание:
По варианту, выданному преподавателем, составить и выполнить запросы к базе данных "Учебный процесс".

Команда для подключения к базе данных ucheb:

psql -h pg -d ucheb

Составить запросы на языке SQL (пункты 1-7):

1. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
Таблицы: Н_ЛЮДИ, Н_СЕССИЯ.
Вывести атрибуты: Н_ЛЮДИ.ИМЯ, Н_СЕССИЯ.ЧЛВК_ИД.
Фильтры (AND):
a) Н_ЛЮДИ.ФАМИЛИЯ < Петров.
b) Н_СЕССИЯ.УЧГОД > 2003/2004.
c) Н_СЕССИЯ.УЧГОД < 2011/2012.
Вид соединения: LEFT JOIN.
2. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.
Вывести атрибуты: Н_ЛЮДИ.ИД, Н_ВЕДОМОСТИ.ИД, Н_СЕССИЯ.ИД.
Фильтры (AND):
a) Н_ЛЮДИ.ОТЧЕСТВО > Георгиевич.
b) Н_ВЕДОМОСТИ.ДАТА = 1998-01-05.
Вид соединения: INNER JOIN.
3. Составить запрос, который ответит на вопрос, есть ли среди студентов группы 3102 те, кто не имеет отчества.
4. Выдать различные фамилии людей и число людей с каждой из этих фамилий, ограничив список фамилиями, встречающимися ровно 50 раз на на очной форме обучения.
Для реализации использовать подзапрос.
5. Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст), где средний возраст меньше максимального возраста в группе 1100.
6. Получить список студентов, отчисленных после первого сентября 2012 года с очной или заочной формы обучения. В результат включить:
номер группы;
номер, фамилию, имя и отчество студента;
номер пункта приказа;
Для реализации использовать соединение таблиц.
7. Вывести список студентов, имеющих одинаковые отчества, но не совпадающие ид.
