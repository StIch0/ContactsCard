# ContactsCard
Проект задания https://docs.google.com/document/d/1Lxwq4EsqfxOQoc6X32Acdc2g_DMnxSAnNDViOcZ1xpk/edit <br>
Выполнен на основе паттерна MVVM 
Структура проекта:
	Model:
1 - CardModel - общая модель данных, включает в себя имя, фамилию, отчество, фото профиля
2 - FriendCardModel - модель данных друзей, наследуется от CardModel + содержит поле день рождения
3 - ColleagueCardModel -  модель данных коллег, наследуется от CardModel + содержит поля должность и рабочий телефон
	Cells: 
содержит классы FriendsCell и ColleagueCell - описывают модель ячейки в таблице и ссылку на соответствующий обект из папки CellsViewModel
	СellsViewModel: 
В классах  ColleagueCellViewModel и FriendsCellViewModel происходит инициалицация полей и присвоение им значений 
	ViewControlers: 
Заполнение таблицы значениями, добавление нового контакта, выбор контакта и переход на просмотр детальных данных о контакте
	ViewModel:
Содержит логику добавления контактов, обновление, выбор из спииска по индексу
	Managers:
Инструменты для работы с базой данных и начальное заполнение списка контактов.
