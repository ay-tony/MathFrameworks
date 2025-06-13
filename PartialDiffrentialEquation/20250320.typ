#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#text(fill: blue.darken(50%))[
  #align(center)[
    #text(20pt)[
      *偏微分方程*
    ]

    更新日期：#datetime.today().display("[year] 年 [month] 月 [day] 日")

    22377264 安阳
  ]
]
#line(stroke: 1pt + blue.darken(50%), length: 100%)

#ex[
  证明极坐标公式
  $
    integral_(B (0 , R)) f (x) upright(d) x = integral_0^R integral_(diff B (0 , r)) f (x) upright(d) S (x) upright(d) r .
  $
]
#pf[
  对 $x in RR^n$ 有极坐标分解 $
  &x = (rho, theta_1, ..., theta_(n-1)) in B(0, R) = [0, R] times [0, pi]^(n-2) times [0, 2pi],\
  &x = (rho, theta_1, ..., theta_(n-1)) in partial B(0, R) = {R} times [0, pi]^(n-2) times [0, 2pi],\
  &dd(S(x)) = rho^(n-1) sin^(n-2) theta_1 sin^(n-3) theta_2 ... sin theta_(n-2),
  $ 那么有 $
    LHS
    &= integral_0^R integral_0^pi dots integral_0^pi integral_0^(2pi) f(rho, theta_1, ..., theta_(n-1)) sin^(n-2) theta_1 dots sin^ theta_(n-2) rho^(n-1) dd(theta_1)...dd(theta_(n-1), rho)\
    &= integral_0^R integral_(partial B(0, rho)) f(rho, theta_1, ..., theta_(n-1)) sin^(n-2) theta_1 dots sin^ theta_(n-2) rho^(n-1)dd(theta_1)...dd(theta_(n-1), rho)\
    &= integral_0^R integral_(partial B(0, rho)) f(rho, theta_1, ..., theta_(n-1)) dd(S(x))dd(rho).
  $
]

#ex[
  证明下列函数都是调和函数：
  $ f(x, y) = x^3 - 3 x y^2 ; quad g(x, y) = upright("sh") (n y) sin (n x) , $ 其中 $n$ 为常数.
]
#pf[
  $
    pdv(f, x) &= 3x^2 - 3y^2,\
    pdv(f, x, 2) &= 6x,\
    pdv(f, y) &= -6 x y,\
    pdv(f, y, 2) &= -6x,\
    pdv(f, x, 2) + pdv(f, y, 2) &= 0.
  $
  $
    pdv(g, x) &= n sinh n y cos n x,\
    pdv(g, x, 2) &= -n^2 sinh n y sin n x,\
    pdv(g, y) &= n cosh n y sin n x,\
    pdv(g, y, 2) &= n^2 sinh n y sin n x,\
    pdv(g, x, 2) + pdv(g, y, 2) &= 0.
  $
]

#ex[
  证明用极坐标表示的函数 $r ln r sin theta + r theta cos theta$ 满足 Laplace 方程.
]
#pf[
  对坐标变换 $
    cases(
        x = r cos theta,
        y = r sin theta
    )
  $ 分别对 $x, y$ 求偏导得到 $
    cases(
      1 = - r sin theta dot theta_x + cos theta dot r_x,
      0 = r cos theta dot theta_x + sin theta dot r_x
    )
  $ 和 $
    cases(
        0 = - r sin theta dot theta_y + cos theta dot r_y,
        1 = r cos theta dot theta_y + sin theta dot r_y
    )
  $ 分别解出 $
    cases(
      theta_x = - sin theta\/ r,
      r_x = cos theta
    ),
    quad
    cases(
        theta_y = cos theta \/ r,
        r_y = sin theta
    ),
  $ 那么 $
    f_x
    &= f_theta theta_x + f_r r_x\
    &= (r ln r cos theta + r cos theta - r theta sin theta)(- sin theta)/r + (ln r sin theta + sin theta + theta cos theta) cos theta\
    &= theta,\
    f_(x x)
    &= theta_x\
    &= - (sin theta) / r,\
    f_y
    &= f_theta theta_y + f_r r_y\
    &= (r ln r cos theta + r cos theta - r theta sin theta)(cos theta)/r + (ln r sin theta + sin theta + theta cos theta) sin theta\
    &= 1 + ln r,\
    f_(y y)
    &= 1 / r r_y\
    &= (sin theta) / r,
  $ 那么自然有 $f_(x x) + f_(y y) = 0$.
]
