#import "@preview/polylux:0.3.1": *
#import themes.metropolis: *
#import emoji: medal

#show: metropolis-theme.with(
  footer: [Отчет о Kaggle соревновании - LMSYS]
)

#show link: underline

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 100)
#set par(justify: true)

#title-slide(
  author: [Варвус А.И., ПМ23-1],
  title: [Как я получил Kaggle #medal.third],
  subtitle: [#link("https://www.kaggle.com/competitions/lmsys-chatbot-arena")[Ссылка на чемпионат]],
  // date: "Date",
  // extra: "Extra"
)

#slide(title: "Table of contents")[
  #metropolis-outline
]

#new-section-slide("Общая информация о чемпионате")

#slide[
  #figure(
    image("./img/info.png")
  )
]

#slide[
  Соревнование типа Research, где необходимо #alert(["добывать"]) данные самому, так как исходный датасет очень маленький

  #pause

  *Задача*: выбрать лучший ответ от 2-х LLM с платформы #link("https://lmarena.ai/")[LMSYS Chatbot arena]

  #pause

  *Метрика*: Logloss 
]

#slide[
  Входные данные:
  - Промпт пользователя
  - Ответ модели A
  - Ответ модели B
  - Выбор пользователя(A, B, tie)
]

#slide[
  Пример данных:
  #pause

  Входное промпт: #quote([Is it morally right to try to have a certain percentage of females on managerial positions?])

  #pause

  Ответ модели A: #quote([The question of whether it is morally right to aim for a certain percentage of females in manageri...])

  Ответ модели B: #quote([As an AI, I don't have personal beliefs or opinions. However, I can tell you that the question of ...])

  Таргет: A
]

#new-section-slide("Что успели попробовать")

#slide(title: [Что успели попробовать?])[
  - ML
  - DL
  - Статистические подходы
]

#slide(title: [Baseline?])[
  Инференс Llama 3.1 7b, с заменой конечной головы на классификацию меток, а не генерацию текста

  #pause

  Чуть выше публичного ноутбука, но не сильно
]

#focus-slide[
  ML
]

#slide[
  - Используем эмбеддинги от DeBerta-large
  - TF-IDF от текста
  - Учим ансамбль
  - Сохраняем вероятности для дальнейшего ансамбля

  #pause

  Самостоятельный предикт очень слабый и меньше нашего baseline 
]

#focus-slide[
  DL
]

#slide[
  - Дообучение моделей
  - Их смешивание
  - _Дистиляция_
]

#slide(title: [Дообучение моделей])[
  Брали буквально все модели до 30b:
  - Llama
  - Gemma
  - Qwen и тд

  также пробовали брать специальные модели дообученные под какие-то языки - но не получили перфоманса
]

#slide(title: [Как проводили дообучение?])[
  Supervised finetuning (SFT):
  - 2 эпохи
  - Адаптивный learning rate (LR Scheduler)
  - Early stoping rounds
  - Gradient accumlation & Batch normalization

  #pause

  Также пробовали дообучать с меньшими параметрами для использования CV. Но чтобы прошла одна эпоха - необходимо 70 часов. 
  #pause
  Таким временем мы не располагали 
]

#slide(title: [Лучшие модели?])[
  - Мета модель - Llama 3.1 14b:
    - 1.5 эпохи
    - QLora (r=64, a=128, ...)
  - Также хорошо зашла Gemma 7b

  Итоговый предикт: $0.8 dot "Llama" + 0.2 dot "Gemma"$ 
]

#new-section-slide("Что не дало выиграть медаль получше")

#slide[
  - Малые мощности
  - Дистиляция
  - Квантизация до 8bit
]