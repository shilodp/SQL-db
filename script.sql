CREATE TABLE User (
    UserID tinyint NOT NULL,
    FirstName nchar(30) NOT NULL,
    LastName nchar(30) NOT NULL,
    Direction nchar(30) NOT NULL
  );
CREATE TABLE UserTask (
    UserTaskID tinyint NOT NULL,
    UserID tinyint NOT NULL,
    TaskID tinyint NOT NULL,
    State nchar(30) NOT NULL
  );
CREATE TABLE Task (
    TaskID tinyint NOT NULL,
    Name nchar(30) NOT NULL,
    Description nchar(100) NOT NULL,
    Deadline date NOT NULL
  );
Insert Into User  Values 
    (1, 'Дмитрий', 'Шиляев','Минск'),
    (2, 'Андрей', 'Марочкин','Москва'),
    (3, 'Екатерина', 'Кошнина','Екатеринбург'),
    (4, 'Василий', 'Губин','Москва'),
    (5, 'Генадий', 'Малинин','Минск'),
    (6, 'Артём', 'Другов','Рига'),
    (7, 'Мария', 'Марочкина','Минск'),
    (8, 'Элина', 'Васильева','Воронеж'),
    (9, 'Евгений', 'Совин','Гродно'),
    (10, 'Василий', 'Звинин','Минск');
Insert Into UserTask Values
    (1, 1, 1, 'Active'),
    (2, 2, 2, 'Active'),
    (3, 3, 3, 'Active'),
    (4, 4, 4, 'Active'),
    (5, 5, 3, 'Active'),
    (6, 6, 4, 'Active'),
    (7, 7, 6, 'Active'),
    (8, 8, 5, 'Active'),
    (9, 9, 4, 'Active'),
    (10, 10, 6, 'Active');
Insert Into Task Values
    (1, 'Вынести мусор', 'Вынести пакеты с мусором стоящие в коридоре', '2017-12-12'),
    (2, 'Создание базы данных', 'Создать БД по новому проекту согласно ТЗ', '2017-12-19'),
    (3, 'Вёрстка страницы', 'Сверстать страницы по новому проекту согласно макету и ТЗ', '2017-12-22'),
    (4, 'Поиск клиентов', 'Найти клиентов, которых внесём в БД нового проекта', '2017-12-29'),
    (5, 'Купить продукты', 'Купить различных фруктов в комнату отдыха и сахар с чаем на кухню', '2017-12-20'),
    (6, 'Заполнение базы данных', 'Внести найденных клиентов в созданную БД', '2018-01-05');
CREATE VIEW vUserTask AS
    select 
      concat(user.FirstName,' ',user.LastName) as UserFullName, 
      user.direction as Direction, 
      task.name as TaskName, 
      task.description as TaskDescription, 
      usertask.state as TaskState, 
      date_format(task.deadline,'%d.%m.%Y') as Deadline 
    from user, usertask, task 
    where 
      user.userid=usertask.userid 
      and task.taskid=usertask.taskid;