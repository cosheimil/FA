#set text(
  lang: "ru",
  size: 12pt,
)

#show table.cell.where(y: 0): set text(weight: "bold")
#show figure: set block(breakable: true)

#set page(
  height: 41cm,
  numbering: "— 1 —",
  header: align(right)[СУБД. Лабараторная работа №3],
  footer: align(right)[ПМ23-1, Варвус А.И.]
)

#set document(
  title: "Практическое задание 3",
  author: "Варвус А.И."
)

= Задание 1

1. Объединение

Даны две таблицы:

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R1]
    ),
    [*A*], [*B*],
    [3], [C],
    [4], [D],
    [10], [L],
    [7], [G],
    [8], [H]
  )

  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R2]
    ),
    [*A*], [*B*],
    [1], [A],
    [3], [C],
    [9], [K],
    [5], [E],
  )
]

Чтобы вычислить объединение: $R"3" = A "unioin" B$. Получаем:
#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R3]
    ),
    [*A*], [*B*],
    [3], [C],
    [4], [D],
    [10], [L],
    [7], [G],
    [8], [H],

    [1], [A],
    [3], [C],
    [9], [K],
    [5], [E],
  )
]

2. Пересечение:

Даны две таблицы:

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R1]
    ),
    [*A*], [*B*],
    [3], [C],
    [4], [D],
    [5], [E],
    [6], [G],
    [7], [G],
    [8], [H]
  )

  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R2]
    ),
    [*A*], [*B*],
    [1], [A],
    [3], [C],
    [8], [H],
    [9], [K],
  )
]

Чтобы вычислить пересение: $R"3" = A "intersect" B$. Получаем

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R3]
    ),
    [*A*], [*B*],
    [3], [C],
    [8], [H]
  )
]

#pagebreak()

3. Разность

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R1]
    ),
    [*A*], [*B*],
    [3], [C],
    [4], [D],
    [10], [L],
    [11], [Z],
    [5], [E],
    [6], [F],
    [7], [G],
    [8], [H]
  )

  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R2]
    ),
    [*A*], [*B*],
    [1], [A],
    [3], [C],
    [9], [K],
    [5], [E],
    [6], [F],
    [7], [G],
    [8], [H],
  )
]

Чтобы вычислить разность: $R"3" = A "except" B$

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R3]
    ),
    [*A*], [*B*],
    [4], [D],
    [10], [L],
    [11], [Z],
  )
]

4. Декартово произведение

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R1]
    ),
    [*A*], [*B*],
    [11], [Z],
    [5], [E],
    [6], [F],
    [7], [G],
    [8], [H],
  )

  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[R2]
    ),
    [*A*], [*B*],
    [1], [A],
    [3], [C],
    [9], [K]
  )
]

Чтобы вычислить декартово произведение: $R"3" = A "times" B$

#align(center)[
  #table(
    columns: 4,
    align: center,

    table.header(
      table.cell(colspan: 4)[R3]
    ),
    [*A*], [*B*], [*A*], [*B*],
    [11], [Z], [1], [A],
    [11], [Z], [3], [C],
    [11], [Z], [9], [K],

    [5], [E], [1], [A],
    [5], [E], [3], [C],
    [5], [E], [9], [K],

    [6], [F], [1], [A],
    [6], [F], [3], [C],
    [6], [F], [9], [K],

    [7], [G], [1], [A],
    [7], [G], [3], [C],
    [7], [G], [9], [K],

    [8], [H], [1], [A],
    [8], [H], [3], [C],
    [8], [H], [9], [K],
  )
]

5. Выборку

#align(center)[
  #table(
    columns: 3,
    align: center,

    table.header(
      table.cell(colspan: 3)[R1]
    ),
    [*Номер*], [*Название*], [*Количество*],
    [1], [a], [10],
    [2], [b], [15],
    [3], [c], [20],
    [4], [d], [25],
    [5], [e], [30],
    [6], [g], [40],
    [7], [c], [50],
    [8], [e], [55],
    [9], [b], [70],
    [10], [e], [35],
    [11], [g], [55],
    [12], [k], [50],
  )
]

Чтобы сделать выборку:
```sql
select
  *
from R3
where ('Название' = a or 'Название' = g) and 
    ('Количество' <= 12 or 'Количество' >= 70)
```

Получим:

#align(center)[
  #table(
    columns: 3,
    align: center,

    table.header(
      table.cell(colspan: 3)[R1]
    ),
    [*Номер*], [*Название*], [*Количество*],
    [1], [a], [10],
  )
]

6. Проекция

#align(center)[
  #table(
    columns: 4,
    align: center,

    table.header(
      table.cell(colspan: 4)[R]
    ),
    [*a1*], [*a2*], [*a3*], [*a4*],
    [A], [1], [ab], [abc],
    [A], [2], [bc], [bcd],
    [B], [1], [dc], [bca],
    [B], [3], [bc], [dca],
    [B], [4], [ab], [abc],
    [B], [1], [bc], [bcd],
    [C], [1], [bc], [dca],
  )
]

Чтобы сделать проекцию:
```sql
select a1 from R
```

Получаем:

#align(center)[
  #table(
    columns: 1,
    align: center,

    table.header(
      table.cell(colspan: 1)[R]
    ),
    [*a1*],
    [A],
    [A],
    [B],
    [B],
    [B],
    [B],
    [C],
  )
]

7. Соединение

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[Отношение #text(red)[R]]
    ),
    [#text(red)[*R.a1*]], [#text(red)[*R.a2*]],
    [X], [1],
    [X], [2],
    [Y], [1],
    [Y], [3],
    [Y], [4],
  )
]

#align(center)[
  #table(
    columns: 2,
    align: center,

    table.header(
      table.cell(colspan: 2)[Отношение #text(red)[S]]
    ),
    [#text(red)[*S.b1*]], [#text(red)[*S.b2*]],
    [1], [p],
    [2], [g],
    [3], [p],
    [5], [h],
  )
]

Left-join по ключам $"a1" arrow.l.r.double "a2"$:

#align(center)[
  #table(
    columns: 3,
    align: center,

    table.header(
      table.cell(colspan: 3)[Отношение #text(red)[RS]]
    ),
    [#text(red)[*R.a1*]], [#text(red)[*R.a2*]],[#text(red)[*S.b2*]],
    [X], [1], [p],
    [X], [2], [g],
    [Y], [1], [p],
    [Y], [3], [p],
    [Y], [4], [ ],
  )
]



Inner-join по ключам $"a1" arrow.l.r.double "a2"$:

#align(center)[
  #table(
    columns: 4,
    align: center,

    table.header(
      table.cell(colspan: 4)[Отношение #text(red)[RS]]
    ),
    [#text(red)[*R.a1*]], [#text(red)[*R.a2*]], [#text(red)[*S.b1*]], [#text(red)[*S.b2*]],
    [X], [1], [1], [p],
    [X], [2], [2], [g],
    [Y], [3], [3], [p],
    [Y], [3], [3], [p]
  )
]

= Задание 2. Вариант 3

Реляционное исчесление кортежей:

```sql
RANGE OF R IS Студенты
RANGE OF L IS Курсы
{R.Имя | L.Код = 'CS101'}
```

