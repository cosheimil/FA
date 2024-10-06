#set text(
  lang: "ru"
)

#set par(
  justify: true
)

#align(center)[== Вариант 4-08]

Для случайной цены $Y$ известно: $PP(Y = 7) = 0,6; PP(Y = 13) = 0,4$. При условии $Y = y$, распределение
выручки $X$ является равномерным на отрезке $[0, 6y]$. Найдите:

+ математическое ожидание $EE(X Y)$;
+ ковариацию $"Cov"(X, y)$

_Решение_:

$EE(X Y|Y=y) = EE(X|Y=y) dot y$

$EE(X|Y=y) = (0 + 6y) / 2 = 3y$

$EE(X Y|Y=y) = 3y^2$; $EE(X Y) = EE(EE(X Y|Y=y)) = EE(3y^2) = 3 dot (49 dot 0,6 + 13 dot 0,4) = 291$

$EE(X Y) = EE(X) dot EE(Y) - "Cov"(X, Y); "Cov"(X, Y) = EE(X) dot EE(Y) - EE(X Y)$

$EE(X) = 0,6 dot 6 dot 7/2 + 0,4 dot 6 dot 13/2 = 28,2$

$EE(Y) = 7 dot 0,6 + 13 dot 0,4 = 9,4$

$"Cov"(X, Y) = 28,2 dot 9,4 - 291 = -20,28$

_Ответ_: $EE(X Y) = 291$; $"Cov"(X, Y) = -20,28$


Найдите распределение случайной величины $Z = min(2, X - Y)$ и $EE(Z)$, если известно распределение
дискретного случайного вектора $(X, Y)$:

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: center,
    table.header(
      [], [$Y=1$], [$Y=2$], [$Y=3$]
    ),
    $X=1$,
    $1/3$,
    $1/3$,
    $1/27$,

    $X=2$,
    $1/27$,
    $1/9$,
    $1/27$,

    $X=3$,
    $1/27$,
    $1/27$,
    $1/27$,
  )
]

Построим распределение $U = X - Y$:

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    table.header(
      [], [$U=-2$], [$U=-1$], [$U=0$], [$U=1$], [$U=2$]
    ),
    $PP(U)$,
    $1/27$,
    $10/27$,
    $13/27$,
    $2/27$,
    $1/27$
  )
]

Построим распределение $Z$:

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    table.header(
      [], [$Z=-2$], [$Z=-1$], [$Z=0$], [$Z=1$], [$Z=2$]
    ),
    $PP(U)$,
    $1/27$,
    $10/27$,
    $13/27$,
    $2/27$,
    $1/27$
  )
]