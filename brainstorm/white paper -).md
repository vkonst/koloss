# `Koλoss` — идея проекта для хакатона BlockchainHack

## Abstract
`Koλoss` - проектируемвя блокчейн-платформа и экосистема для реализации supply chain сервисов для зерноводтсва, зернотрейдинта и переработки зерна.

 Участие в хакатоне предполагает наличие / демонстрацию:
 - (А) бизнес-идеи
 - (Б) программного кода (прототипа), демонстрирующего возможность реализации идеи

 Далее приводится описание бизнес-идеи и предполагаемого программного кода.

 ## Бизнес-идея. Проект Koλoss.

 ### Рынок зерна. Ведущие позиции России.
 Россия является одним из основных мировых производителей и ведущим мировым экспортером на глобальном рынке зерна.
 Каждая шестая тонна пшеницы, торговавшейся на мировом рынке в прошедшем сельхозсезоне была выращена в России.

 ### Недооцененность бизнеса ввиду недостаточного доверия и "прозрачности"
 Несмотря на уникальные природно-климатические условия для зерноводства в России (зона "нечерноземья" - уникальна!), агрокомпании, в значительной мере, недооценены.
 Помимо страновых/политических рисков, основная причина - "непрозрачность" отрасли и ее участников.

 ### Наследие почившей Госхлебоинспекции
 Во времена СССР была создана целостная система, с центральным регулирующим органом в лице государства.
 Созданы сеть элеваторов, лабораторий, единые стандарты качества...
 После исчезновения "регулятора" рынок пытается самоорганизоваться.
 Не всешда эффективно.

 ### Схожесть отраслей России, Украины и Казахстана
 Принципы и традиции построения отрасли схожи в России, Украине, Кахахстане.
 На эти страны приходится 1/3 от мирового экспорта пшеницы и значительные доли в других зерновых товарах.

 ### Консерватизм и низкая информационная прозрачность отрасли

 ### Окно возможностей: от локального и регионального продукта к глобальной платформе

 ### Проект Koλoss
Платформа для дополняющих друг друга сервисов. Предполагаемый состав сервисов:

#### Сервис "Ambаr" - Основа, Складская книга на блокчейне
 Основа платформы.
 По-сути, складская книга на блокчейне.
 Содержит транзакции, которые показывают -
 - где есть зерно (в поле? на эдеваторе? в порту? ...)
 - какое это зерно (см. сервис "Гранула")
 - какого оно качества (см. сервис Агроlab)
 - кто хозяин зерна

 Транзакции - подтверждаются участвующими в сделке контрагентами - принцип "тройной записи".

 По мере развития проекта - локальная, затем региональная, затем - глобальная.
 Дополняется "слева" сервисом "Nиva"

### Сервис "Nиva" - зерно в полях, расширение для "Ambаr"
 Учитывает потенциальный урожай - посевы.
 Привязка к производителю (хозяйству, полю).
 Экспертная оценка (рейтинг) потенциала - см. сервис "АгроNoм".
 Основа (инфо-обеспечение) для продуктов "Инвестирование урожая".

### Сервис "AγρόNom" ("Агроном")
 Маркетплейс для экспертных оценок потенциала (рейтинга) посевов -
 как p2p экспертные заключения, так и "оракулы".

 Индекс вегетации - анализ снимков полей + статистика + сводки погоды => обоснованные прогноз урожая.
 Оцениваются кокретные объекты (поля). а не "урожай, в целом".

### Сервис "Грануλа"
 Идентификация товарных партий зерна с применением RFID-меток.
 пример маркировки партии:
 одна метка "ближнего действия" на каждую тонну, считывается с расстояния в 1м - при движение по траспортеру, с монетку размером, стоимостью несколько центов
 плюс одна метка "дальнего действия" на 10тн, считывается с 30м - при проезде а/м, вагона, при хранении в силосе, с пивную пробку размером, стоимостью несколько долларов.
 Позволяет, с большой долей вероятности, идентифицировать физические партии при заготовке, хранении, транспортировке...

 !!! Cool side effect:
 де-факто, "обособленне хранение" (с вытекающими правовыми последствиями) при фактическом хранении "в общей куче".

 ### Сервис "AγρόLab" ("Агролаб")
 Агролаб - сервис по хранению результатов анализов и их оценке их надежности (достоверности).
 Данные - в максимально возможной привязке к конкретным партиям зерна.
 Ключевой сервис, поскольку вопрос качества - принципиальный.
 Зерно - неоднородный продукт со множеством непрерывно изменяющихся показателей качества.
 Это живой организм, где происходят непрерывные биологические процессы и био-химические реакции.
 "Усушка", "утруска" - норма, а не случайность.

 ### Сервис "Zakλad" ("заклад")
 Учет обременений (залогов, послед залогов ...) зерна и зернопродуктов.

 ### Сервис "Melnitsa" ("мельница")
 Учет переработки зерна в зернопродукты.
 Необходим, в частности, для:
 - доверия "давальцев" и "переработчиков" при переработке по "дапвальческой схеме"
 - переоформления залогов "в темпе переработки" (по производственным сменам, например)
 Тесно увязан с сервисом "AγρόLab"

 ### Сервис "Ἀγορά" ("Агора") - торговля реальным товаром (а не финансовых инстрментов)
Переработчки - постоянно в "короткой позиции" по форвардным поставкам зерна и в "длинной" - по зернопродуктам, со стабильными объемами.
Производители - наоборот.
Зерно на эдеваторах может выступать в качестве страхового обеспечения открытиых позиций.

