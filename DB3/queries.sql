select distinct "ИМЯ", "ЧЛВК_ИД" from "Н_ЛЮДИ" left join "Н_СЕССИЯ" НС on "Н_ЛЮДИ"."ИД" = НС."ЧЛВК_ИД"
         where "ФАМИЛИЯ" < 'Петров' and "УЧГОД" > '2003/2004' and "УЧГОД" < '2011/2012';

select "Н_ЛЮДИ"."ИД", НВ."ИД", НС."ИД" from "Н_ЛЮДИ" join "Н_ВЕДОМОСТИ" НВ on "Н_ЛЮДИ"."ИД" = НВ."ЧЛВК_ИД" join "Н_СЕССИЯ" НС on "Н_ЛЮДИ"."ИД" = НС."ЧЛВК_ИД"
         where "ОТЧЕСТВО" > 'Георгиевич' and НВ."ДАТА" = '1998-01-05';

select exists(select "ИД" from "Н_ЛЮДИ" where "ИД" in (select distinct "ЧЛВК_ИД" from "Н_УЧЕНИКИ" where "ГРУППА" = '3102') and "ОТЧЕСТВО" is null);

select "ФАМИЛИЯ", "Кол-во людей" from
    (select "ФАМИЛИЯ", count("ИМЯ") as "Кол-во людей" from "Н_ЛЮДИ"
    where "ИД" in
        (select distinct "ЧЛВК_ИД" from "Н_УЧЕНИКИ" where "ПЛАН_ИД" in (select "ИД" from "Н_ПЛАНЫ" where "ФО_ИД" = 1)) group by "ФАМИЛИЯ") as "ФК-в л" where "Кол-во людей" < 50;

select "ГРУППА", "СРЕДНИЙ_ВОЗРАСТ"
from (select "ГРУППА", avg(age("ДАТА_РОЖДЕНИЯ")) as "СРЕДНИЙ_ВОЗРАСТ"
      from "Н_ЛЮДИ" join "Н_УЧЕНИКИ" НУ on "Н_ЛЮДИ"."ИД" = НУ."ЧЛВК_ИД" where "ГРУППА" != '1100' group by "ГРУППА") as age_table
where "СРЕДНИЙ_ВОЗРАСТ" < (select max(age("ДАТА_РОЖДЕНИЯ")) from "Н_ЛЮДИ" where "ИД" in (select distinct "ЧЛВК_ИД" from "Н_УЧЕНИКИ" where "ГРУППА" = '1100'));

select "ГРУППА", "Н_ЛЮДИ"."ИД", "ФАМИЛИЯ", "ИМЯ", "ОТЧЕСТВО", "П_ПРКОК_ИД" from "Н_ЛЮДИ" left join "Н_УЧЕНИКИ" НУ on "Н_ЛЮДИ"."ИД" = НУ."ЧЛВК_ИД"
where "ПРИЗНАК" = 'отчисл' and "СОСТОЯНИЕ" = 'утвержден' and "НАЧАЛО" > '2012-09-01' and
"ПЛАН_ИД" in (select "ИД" from "Н_ПЛАНЫ" where "ФО_ИД" = 1 or "ФО_ИД" = 3);

select "ИД" from "Н_ЛЮДИ" where "ИД" in (select distinct "ЧЛВК_ИД" from "Н_УЧЕНИКИ") and "ОТЧЕСТВО" in
(select "ОТЧЕСТВО" from (select "ОТЧЕСТВО", count(*) as "Кол" from "Н_ЛЮДИ" where "ИД" in (select distinct "ЧЛВК_ИД" from "Н_УЧЕНИКИ") and "ОТЧЕСТВО" is not null and "ОТЧЕСТВО" !='.'
group by "ОТЧЕСТВО") as ОК where "Кол" > 1);
