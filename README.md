# ContactsCard
Проект задания https://docs.google.com/document/d/1Lxwq4EsqfxOQoc6X32Acdc2g_DMnxSAnNDViOcZ1xpk/edit <br>
Выполнен на основе паттерна MVVM  <br>
Структура проекта: <br>
	Model: <br>
1 - CardModel - общая модель данных, включает в себя имя, фамилию, отчество, фото профиля <br>
2 - FriendCardModel - модель данных друзей, наследуется от CardModel + содержит поле день рождения <br>
3 - ColleagueCardModel -  модель данных коллег, наследуется от CardModel + содержит поля должность и рабочий телефон <br>
	Cells:  <br>
содержит классы FriendsCell и ColleagueCell - описывают модель ячейки в таблице и ссылку на соответствующий обект из папки  <br> CellsViewModel <br>
	СellsViewModel:  <br>
В классах  ColleagueCellViewModel и FriendsCellViewModel происходит инициалицация полей и присвоение им значений  <br>
	ViewControlers: 
Заполнение таблицы значениями, добавление нового контакта, выбор контакта и переход на просмотр детальных данных о контакте
	ViewModel:
Содержит логику добавления контактов, обновление, выбор из спииска по индексу
	Managers:
Инструменты для работы с базой данных и начальное заполнение списка контактов.
