#set text(lang: "ru")
#show link: underline

#align(center)[Allucard - образовательная платформа беспилотного транспорта]

= Идея проекта
Данная платформа будет _помощником_ для изучения беспилотного транспорта. Учащийся сможет изучить основные алгоритмы движения засчет сенсоров, а также при дальнейшем желании сможет изучить движение засчет 3D камеры

= Цель проекта
Создать *дешевую* платформу для обучения. Тк сейчас данные наборы существуют, но стоят порядка *200 000
#sym.ruble*. Основа робота будет полностью изготовлена на 3D-принтере, что уменьшает конечную стоимость продукта в разы. Из электроники будут использоваться не самые дорогие компоненты, но для простых задач их должно хватить

== Целевая аудитория
Робот будет направлен на школьников 9-11 класса. Но также подойдет для студентов 1-2 курса. Так как нет никаких ограничений на _понимаемость_ алгоритмов

== Как выглядит робот
Машинка будет представлять собой уменьшенную версию обычной, дорожной версии автомобиля

#figure(
  image("./photos/cattouchretcr.png", width: 50%),
  caption: "Примерный вид автомобиля"
)

#figure(
  image("./photos/cattouchret.png", width: 50%),
  caption: "Примерный вид автомобиля"
)

Вид машинки подобран специально таким образом, что обучающийся работает с уже красивым продуктом, а не "голым" скелетом, который просто едет. Также в будущем будет внедряна система тюнинга автомобиля:
- модуль отладки, как багажник
- модуль с датчиком линии под нижний сплиттер
- модуль с камерой, как лидар
И многое другое!

== Компоненты робота
#align(center)[
  #table(
    columns: (auto, auto),
    align: horizon,
    [*Компонент*], [*Цена*],
    [#link("https://www.ozon.ru/product/nvidia-jetson-nano-b01-4gb-mikrokompyuter-1520209594/?asb=cpobcHc9d12dUDHUUuXGZ%252Fn%252B%252BzfbEF%252BUjLLDUR3aOI8%253D&asb2=Y8e7PsH_GUw_BHmQnsQguFazM7ciA8yEQzJQbc8uekOFUzGdxagARwpjHxEO1izcD9omHKEccMGt-xeaRuT7mw&avtc=1&avte=2&avts=1712320568&keywords=nvidia+jetson+nano")[Jetson Nano]], [23 000 #sym.ruble],

    [#link("https://iarduino.ru/shop/Mehanika/motor-reduktor-s-enkoderom-n20-1000rpm-12v-s-upravlyayuschim-kontrollerom-flash-i2c.html")[Мотор с энкодером]], [1200 #sym.ruble],

    [#link("https://iarduino.ru/shop/Expansion-payments/istochnik-pitaniya-5v-12v-18650-li-ion.html")[Аккамуляторный отсек]], [650 #sym.ruble],

    [#link("https://www.ozon.ru/product/akkumulyator-liitokala-18650-li-ion-3-7v-3400mah-do-10a-s-vypuklym-plyusovym-kontaktom-1288192855/?asb=q2%252BT51aSLbu1rgsjbb5BiqSjwxWa7yVST2bS2zk7lRs%253D&asb2=XVRf_AsiWUaiJw5DQj4ltJJ3o2eBoXyF6Ac2moLN5Azbd_gOO2l8lamj4U9PM0ZZnnzpKQ2J4LXabY--xuEZyw&avtc=1&avte=1&avts=1712319297&keywords=18650+%D0%B0%D0%BA%D0%BA%D1%83%D0%BC%D1%83%D0%BB%D1%8F%D1%82%D0%BE%D1%80")[2 Аккамулятора]], [600 #sym.ruble],

    [#link("https://compacttool.ru/stereo-kamera-imx219-83-8mp-dlya-jetson-nano-i-raspberry-pi-cm3-cm4")[Камера]], [6400 #sym.ruble],


  )
]

Также возможно выбрать более дешевый микрокомпьютер #strike[(что и надо сделать)], а также камеру. Но не рекоммендуется. Так как при выборе камеры придется выбирать ее по нескольким параметрам:
- углы обзора: вертикальные, горизонтальные 
- дисторсия и др.

Так как в дальнейшем придется калибровать камеры поотдельности, потом вместе...

