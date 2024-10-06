#import "@preview/touying:0.4.0": *

#set text(
  lang: "ru",
  size: 14pt
)

#let date = datetime(
  year: 2024,
  month: 04,
  day: 12,
)

#let s = themes.university.register(aspect-ratio: "16-9")
#let s = (s.methods.info)(
  self: s,
  title: [Моя семья и ее подвиги],
  subtitle: [ДТЗ],
  author: [Варвус Артем Иванович, ПМ23-1],
  date: date,
  institution: [Финансовый университет при Правительстве РФ],
)
#let (init, slides, touying-outline, alert) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, focus-slide, matrix-slide) = utils.slides(s)
#show: slides

= План презентации

#slide[
  == План презентации
  - Введение. Актуальность
  - Мама
  - Папа
  - Бабушка
  - Дедушка
  - Заключение
]
= Мама

== История
#slide()[
  #align(center)[
    #image("мама.jpg")
  ]

  Моя мама - профессиональный педагог, работающий в университете
]

#slide()[
  #align(center + horizon)[Мой папа доктор со стажем более 30 лет!]
]

#focus-slide[
  #align(center)[Бабушка и дедушка]
]

= Бабушка

== История
#slide()[
  #align(center)[
    #image("бабушка.png", height: 80%)
  ]

  Моя бабушка - врач УЗИ
]

#slide()[
  #align(center)[
    #image("дед.jpg", height: 80%)
  ]

  Мой дедушка - врач анестезиолог реаниматолог 
]

#slide()[
  Мой прадед - Варвус Никифор - прошел ВОВ, получив 2 медали за отвагу в бою (за форсирование реки Одра)
]

#focus-slide[
  #align(center)[Спасибо за внимание!]
]