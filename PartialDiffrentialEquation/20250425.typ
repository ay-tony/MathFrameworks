#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#set par(first-line-indent: 2em)

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
  设 $c in bb(R)$，考虑以下初值问题：
  $
    cases(delim: "{", u_t - Delta u + c u = f \, quad & upright("在 ") bb(R)^n times (0 , oo) upright(" 中"), u = g \, & upright("在 ") bb(R)^n times { t = 0 } upright(" 上"))
  $
]
#pf[
  考虑方程 $
    u_t - Delta u + c u = f quad "在" med RR^n times (0, oo),
  $ 的初值条件：$
    u = g quad "在" med RR^n times {t = 0},
  $

  首先考虑齐次方程 $
    u_t = Delta u + c u = 0,
  $ 设解的形式为 $
    u(x, t) = e^(-c t) v(x, t),
  $ 代入得到 $
    e^(-c t) (v_t - Delta v) = 0 quad ==> quad v_t - Delta v = 0,
  $ 于是 $v(x, t)$ 满足标准热方程，解为 $
    v(x, t) = integral_(RR^n) Phi(x - y, t) g(y) dd(y),
  $ 其中热核 $
    Phi(x, t) = 1 / (4 pi t)^(n\/2) e^(-(|x|^2)/(4 t)),
  $ 于是齐次方程的解就是 $
    u'(x, t)= e^(-c t) integral_(RR^n) Phi(x - y, t)g(y) dd(y).
  $

  对于非齐次方程，其解可以表示为 $
    u(x, t) = u' + integral_0^t integral_(RR^n) e^(-c(t-s))Phi(x - y, t - s) f(y, s) dd(t, s).
  $ 那么显式解就是 $
    u(x, t) = e^(-c t) integral_(RR^n) Phi(x - y, t)g(y) dd(y) + integral_0^t integral_(RR^n) e^(-c(t-s))Phi(x - y, t - s) f(y, s) dd(t, s).
  $
]

#ex[
  设 $u$ 是齐次热方程 $u_t - Delta u = 0$ 在 $bb(R)^n times (0 , oo)$
  中的光滑解。

  + 证明：对任意 $lambda in bb(R)$，缩放函数 $ u_lambda (x , t) := u (lambda x , lambda^2 t) $ 仍为原方程的解。
  + 利用 (1) 证明函数 $ v (x , t) := x dot.op nabla u (x , t) + 2 t u_t (x , t) $ 也是方程的解。
]
#pf[
  对于缩放不变性，设 $u_lambda (x, t) = u(lambda x, lambda^2 t)$，只要验证 $partial_t u_lambda = Delta u_lambda$。考虑计算各个偏导数。时间导数为 $
    pdv(u_lambda, t) = pdv(u, t)(lambda x, lambda^2 t) dot lambda^2,
  $ 空间导数为 $
    pdv(u_lambda, x_i) &= pdv(u, x_i) (lambda x, lambda^2 t) dot lambda,\
    pdv(u_lambda, x_i, 2) &= pdv(u, x_i, 2) (lambda x, lambda^2 t) dot lambda^2,
  $ 那么得到 $
    Delta u_lambda = sum_(i = 1)^n pdv(u_lambda, x_i, 2) = lambda^2 Delta u(lambda x, lambda^2 t).
  $ 直接代入方程得到 $
    partial_t u_lambda = lambda^2 partial_t u = lambda^2 Delta u = Delta u_lambda,
  $ 其中用到了 $partial_t u = Delta u$，从而 $u_lambda$ 是原方程的解。

  对于对称性，定义 $
    v(x, t) = x dot nabla dot u(x, t) + 2 t partial_t u(x, t),
  $ 分别计算 $v_t, Delta v$ 得到 $
    v_t &= nabla u dot nabla u + x dot nabla u_t + 2 partial_t u + 2 t partial_(t t) u,\
    Delta v &= Delta(x dot nabla u) + 2 t Delta partial_t u.
  $ 利用热方程 $partial_t u = Delta u$，直接化简即可验证 $v_t = Delta_v = 0$。
]

#ex[
  设 $n = 1$ 且解具有形式 $u (x , t) = v (x / sqrt(t))$。

  + 证明：方程 $u_t = u_(x x)$ 可约化为 $ v prime.double (z) + z / 2 v prime (z) = 0 quad (z = x \/ sqrt(t)), $ 并证明其通解为 $ v (z) = c integral_0^z e^(- s^2 \/ 4) thin d s + d, $ 其中 $c , d$ 为常数。
  + 通过选择适当的常数 $c$，给出 $n = 1$ 时的基本解 $Phi (x , t)$，并验证该解满足 $ integral_(- oo)^oo Phi (x , t) thin d x = 1, $ 最后分析当 $t arrow.r 0^(+)$ 时解的初始条件。
]

#pf[
  对于第一问，设 $u(x, t) = v(z)$，其中 $z = x \/ sqrt(t)$。分别计算导数得到 $
    u_t &= v'(z) dot (- x / (2 t^(3\/2))) = - z/(2t) v'(z),\
    u_(x x) &= (v''(z)) / t.
  $ 代入方程 $u_t = u_(x x)$ 得到 $
    - z /(2 t) v'(z) = (v''(z)) / t quad ==> quad v''(z) + z / 2 v'(z) = 0.
  $ 求解 ODE 得到 $
    v(z) = c integral_0^z e^(-s^2 \/ 4) dd(s) + d.
  $

  对于第二问，对 $v(x, t) = v(z)$ 关于 $x$ 求导得到 $
    pdv(u, x) = (v'(z)) / sqrt(t) = c / sqrt(t) e^(-x^2 \/ (4 t)),
  $ 选取 $c = 1 \/ sqrt(4 pi)$ 满足初始条件，然后得到基本解 $
    Phi(x, t) = 1 / sqrt(4 pi t) e^(-x^2 \/ (4 t)).
  $ 当 $t -> 0^+$ 时，这个解趋近于 Dirac-$delta$ 函数，满足初始条件。
]
