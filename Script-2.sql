-- Задача 1. Вывести данные о сотрудниках из отдела 60, имеющих нечетный рейтинг.

select employee_id, first_name, last_name, email, salary, department_id, rating_e 
from employees
where department_id = 60 and Mod(rating_e, 2)=1;


-- Задача 2. Для сотрудников, зарплата которых больше 10000, выведите столбец, который должен содержать полное имя сотрудника, зарплату и несколько звездо-чек *, по одной звездочке на каждую 1000 зарплаты.

select(rpad(first_name||' '|| last_name, 17) ||' '|| salary || '   '|| lpad('*', Div(salary, 1000)::integer, '*')) as answer
from employees
where salary > 10000 and salary is not null;


-- Задача 3. Вывести данные о товарах, название которых содержит слово AMD и не содержит слово RYZEN. Предусмотреть то, что эти слова, в названии товара, могут быть представлены в разных регистрах

select *
from products
where lower(product_name) like '%amd%' and lower(product_name) not like '%ryzen%';


-- Задача 4. Выведите названия отделов, которые состоят более чем из одного слова.

select department_name
from departments
where length(department_name) - length(replace(department_name, ' ', '')) > 0;


-- Задача 5. Вывести данные о сотрудниках, которые были приняты на работу 21 апреля.

select employee_id, first_name, last_name, email, salary, department_id, rating_e, hire_date
from employees
where to_char(hire_date, 'DD/MM') = '21/04';


-- Задача 6. Вывести данные о договорах, которые были оформлены в воскресенье.

select *
from orders
where Extract(dow from order_date) = 0;


-- Задача 7. Вывести данные о размере премии сотрудников, которые работают в отделе 30. Размер премии равен: зарплате с учетом комиссионных, если сотрудник получает комиссионные, и равен зарплате умноженной на 1.2, если сотруд-ник не получает комиссионные.

select employee_id, first_name, last_name, salary, commission_pct,
COALESCE(salary*(1+commission_pct), salary*1.2) as premium
from employees
where department_id = 30
