#import "@preview/touying:0.4.0": *
#import "@preview/octique:0.1.0": *
#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.4.3" as fletcher: node, edge
#import emoji: lightning, face

#let date = datetime(
  year: 2024,
  month: 04,
  day: 22,
)

#set text(
  font: ("Fira Sans"), weight: "light", size: 20pt)

#set strong(delta: 100)
#set par(justify: true)
// #show math.equation: set text(font: "Fira Math")

#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)
#let s = themes.metropolis.register(aspect-ratio: "16-9")

#(s.page-args.header = self => {
  utils.call-or-display(self, s.page-args.header)

  place(top + right, dx: -3.15em, dy: 0.0em)[
    // #image("../photos/catboost.png")
  ]

  place(top + right, dx: -0.5em, dy: 0em)[
    // #image("../photos/logo_nso_new.png")
  ]
})


#let s = (s.methods.info)(
  self: s,
  title: [JeML #lightning],
  subtitle: [Машинное обучение и с чем его едят],
  author: [Варвус Артем],
  date: date,
  institution: [Финансовый Университет при Правительстве РФ],
)
#let (init, slides, touying-outline, alert) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, new-section-slide, focus-slide) = utils.slides(s)
#show: slides

= О курсе

#slide[
В рамках данного курса мы рассмотрим основы машинного обучения для *уверенного* стартра в данной сфере\ 
#pause
Для прохождения курса вам понадобятся навыки:
- Python
- Numpy 
- Pandas
- _Математика_]

#slide[
  Каждое занятие будет проходить в формате: 1 час теории, 10 минут #strike[чиллим] отдыхаем, 50 минут практики 
]

#slide[
  #align(center)[*Авторы курса*]
  #align(center)[
    #grid(
      columns: (auto, auto),
      gutter: 10pt,
      // image("../photos/logo_nso_new.png", height: 40%),

      // image("../photos/catboost.png", height: 40%)
    )
  ]
]

= Что такое Машинное обучение

#slide[
  Машинное обучение — это наука, изучающая алгоритмы, автоматически улучшающиеся благодаря опыту. \
  #pause
  Машинное обучение это когда...:
  - перевести текст с одного языка на другой
  - отличить бобика от мурзика
  - оценить, по какой цене удастся продать квартиру]

== История возникновения

#slide[
  В 1956 году американский математик *Артур Сэмюэл* предложил первую формальную концепцию машинного обучения и создал программу, способную играть в шашки на уровне человека. Это стало одним из первых примеров применения алгоритмов обучения для достижения высокой производительности в задачах, требующих интеллектуальных усилий.
]

#slide[
  #align(center)[
    // #image("../photos/artur_samuel.jpg")
  ]
]

= Что такое модель и метрика?

== Модель
#slide[
  Модель машинного обучения — это #pause объект, который был *обучен* для распознавания определенных типов и дальнейшего *предсказания*. Вы обучаете модель на основе набора данных, предоставляя ей алгоритм, который она может использовать для анализа и обучения на основе этих данных. \
]

#slide[
  Тогда пусть задана выборка: $(XX, YY)$, где $XX$ - множество признаков, $YY$ - "ответы" к ним \ #pause
  Пусть задана: $g: XX times Theta arrow YY$, где $Theta$ - веса модели, которые подбираются при *обучении* \ #pause
  То модель: $A = {g(x, theta)| theta in Theta}$
]

#focus-slide[
  Что значит обучается?
]

#slide[
  У модели есть:
  - параметры 
  #pause
  - гиперпараметры
]

#slide[
  Параметры модели — параметры, которые изменяются и оптимизируются в процессе обучения модели и итоговые значения этих параметров являются результатом обучения модели. 
]

#slide[
  Гиперпараметры модели — параметры, значения которых задается до начала обучения модели и не изменяется в процессе обучения. У модели может не быть гиперпараметров.
]

#slide[
  #align(center)[
    Что из этого является весами модели? #face.think\ 
    #pause
    Ответ: Параметры]
  
  
]

#slide[
  #align(center)[
    #fletcher-diagram(
      node-stroke: .1em,
      node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
      spacing: 4em,
      edge((-1,0), "r", "-|>", `Данные`, label-pos: 0, label-side: center),
      pause,
      node((0,0), `Модель`, radius: 2em),
      pause,
      edge((0,0), (0,0), `Обучаемся`, "--|>", bend: 130deg),
      pause,
      edge((0, 0), (1, 0), `Ответы?`, "-|>"),
      pause,
      node((1, 0), `Данные`, radius: 2em),
    )
  ]
]

= Какие задачи решаем

#slide[
  Рассмотрим задачи *обучения с учителем* 
  #pause, 
  то есть те, в которых у нас есть $YY$ \
  #pause
  - Регрессия
  #pause
  - Классификация
  #pause 
  - Ранжирование
]

= Регрессия

#slide[
  *Целевая переменная* представлена: $YY = RR$ или $YY = RR^M$
  #pause \
  - продолжительности поездки на каршеринге #pause
  - спрос на конкретный товар #pause
  - погода на Рязанском проспекте завтра
]

= Классификация

#slide[
  Можно разбить на несколько подклассов:
  - Бинарная #pause
  - Многоклассовая
]

#slide(title: [Бинарная Классификация])[
  *Таргет* представлен: $YY = {0, 1}$
  - сдаст ли студент сессию #pause
  - упадет метеорит #pause
  - перейдет ли клиент в другой банк
]

= Ранжирование

#slide[
  *Y-ки* можно представить: $YY = {1, ..., M}$
  - сегодня выбираете на какую пару пойти #pause
  - предсказать язык в переводчике #pause
  - какая порода представлена перед нами
]

#focus-slide[Как оценить модель?]

#slide(title: [Как оценить модель?])[
  По обучающей выборке мы хотим построить модель, предсказания которой достаточно хороши. Что вообще значит «достаточно хороши»? Не понимая, чего мы хотим добиться, мы не предложим хорошего решения, поэтому нужно внимательно отнестись к выбору *метрик качества*.
]

#slide(title: [Метрики])[
  *Метрика* – внешний, объективный критерий качества, обычно зависящий не от параметров модели, а только от предсказанных меток.
]

#slide(title: [Примеры метрик])[
  *MAE*(mean absolute error): $ "MAE"(f, X, y) = L(f, X, y) = 1/N sum_(i=1)^N |f(x_i) - y_i| arrow min_f $ #pause
  *LogLoss*: $ H_p (q) = - 1/N sum_(i=1)^N y_i dot log(p(y_i)) + (1 - y_i) dot log(1 - p(y_i)) $
]

#focus-slide[
  Отдых!
]

#slide[
  #align(center)[*Переходим к практике*]
  #align(center)[
    // #image("../photos/cat.jpg", height: 80%)
  ]
]

#focus-slide[Что сегодня узнали?]

#slide(title: [Что сегодня узнали?])[
  - Какие задачи решает *Машинное обучение*
  - Основные термины 
  - Поигрались с *scikit-learn*
]

#focus-slide[
  Спасибо за внимание!
]
