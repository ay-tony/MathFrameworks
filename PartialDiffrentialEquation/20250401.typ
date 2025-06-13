#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#set par(first-line-indent: 2em) // TODO

#text(fill: blue.darken(50%))[
  #align(center)[
    #text(20pt)[
      *偏微分方程*
    ]

    更新日期：#datetime(year: 2025, month: 4, day: 1).display("[year] 年 [month] 月 [day] 日")

    22377264 安阳
  ]
]
#line(stroke: 1pt + blue.darken(50%), length: 100%)

#ex[
  设 $u$ 满足：
  $
    cases(delim: "{", u_(x x) + u_(y y) = 0 \, quad quad & (x , y) in B (0 , R), eval(frac(diff u, diff r))_(r = R) = g (theta) \, & theta in [0 , 2 pi])
  $ 当边界条件 $g (theta)$ 满足相容性条件 $ integral_0^(2 pi) g (theta) dd(theta) = 0 $ 时，解可表示为：
  $ u (r , theta) = - frac(1, 2 pi) integral_0^(2 pi) g (tau) ln (R^2 + r^2 - 2 R r cos (tau - theta)) dd(tau) + C, $
  其中 $C$ 为任意常数，$(r, theta)$ 为点 $(x , y)$ 的极坐标。
]
#pf[
  设解为
  $
    u (r , theta) = a_0 / 2 + sum_(n = 1)^oo r^n (a_n cos n theta + b_n sin n theta),
  $ 其法向导数为 $
    eval(frac(diff u, diff r))_(r = R) = sum_(n = 1)^oo n R^(n - 1) (a_n cos n theta + b_n sin n theta) = g (theta),
  $ 那么其傅里叶系数为 $
      cases(
        a_n = frac(1, pi n R^(n - 1)) integral_0^(2 pi) g (tau) cos n tau d tau,
        b_n = frac(1, pi n R^(n - 1)) integral_0^(2 pi) g (tau) sin n tau d tau.
      )
    $ 利用 Poisson 积分公式和对数势函数，最终解就可表示为 $ u (r , theta) = - frac(1, 2 pi) integral_0^(2 pi) g (tau) ln (R^2 + r^2 - 2 R r cos (tau - theta)) dd(tau) + C, $
  其中 $C$ 为任意常数，由积分条件 $integral g = 0$ 保证解的存在唯一性。
]

#ex[
  证明在区域 $Omega subset bb(R)^3$ 中，格林函数满足：
  $ G (x , y) < frac(1, 4 pi lr(|x - y|)) , quad forall x , y in Omega. $
]
#pf[
  记自由空间格林函数为 $
  Phi (x , y) = - frac(1, 4 pi lr(|x - y|)).
  $ 设格林函数分解形式 $G (x , y) = Phi (x , y) + v (x , y)$，其中 $v$ 满足
  $
    cases(
    Delta_x v = 0\, & x in Omega,
    v|_(x in diff Omega) = frac(1, 4 pi lr(|x - y|))\, quad  & x eq.not y.
    )
  $ 由极大值原理，$v (x , y) > 0$ 在 $Omega$ 内取到，从而有 $ G (x , y) = Phi (x , y) + v (x , y) = - frac(1, 4 pi lr(|x - y|)) + v (x , y) < frac(1, 4 pi lr(|x - y|)). $
]

#ex[
  证明当 $y arrow.r x$ 时，有 $G (x , y) arrow.r + oo$，且其阶数与基本解 $Phi (x , y)$ 相同。
]
#pf[
  由格林函数的构造 $G (x , y) = Phi (x , y) + v (x , y)$。当 $y arrow.r x$ 时，$
  Phi (x , y) = - frac(1, 4 pi lr(|x - y|)) arrow.r - oo,
  $ 其中校正项 $v (x , y)$ 在 $y arrow.r x$ 时保持有界，故阶数由 $Phi (x , y)$ 主导，即
  $ lim_(y arrow.r x) frac(G (x , y), Phi (x , y)) = 1. $
]

#ex[
  设 $c (x) gt.eq c_0 > 0$，$u in C^2 (Omega) inter C^1 (overline(Omega))$ 是 Dirichlet 问题 $ cases(- Delta u + c (x) u = f (x) \, quad & x in Omega, u|_(diff Omega) = 0) $
  的解，则成立能量估计：
  $
    integral_Omega lr(|D u (x)|)^2 dd(x) + c_0 / 2 integral_Omega lr(|u (x)|)^2 dd(x) lt.eq M integral_Omega lr(|f (x)|)^2 dd(x),
  $
  其中 $M$ 是仅依赖 $c_0$ 的常数。
]
#pf[
  方程两边乘以 $u$ 并积分得到
  $ integral_Omega (- Delta u) u dd(x) + integral_Omega c (x) u^2 dd(x) = integral_Omega f u dd(x), $ 再应用分部积分得到
  $
    integral_Omega lr(|D u|)^2 dd(x) + integral_Omega c (x) u^2 dd(x) = integral_Omega f u dd(x),
  $ 代入 Poincaré 不等式就有 $
    integral_Omega u^2 dd(x) lt.eq C_p integral_Omega lr(|D u|)^2 dd(x),
    $ 结合 $c (x) gt.eq c_0 > 0$ 得 $
    integral_Omega lr(|D u|)^2 dd(x) + c_0 / 2 integral_Omega u^2 dd(x) lt.eq frac(1, 2 c_0) integral_Omega f^2 dd(x),
    $ 取 $M = max (1 , 1 \/ c_0)$ 即得结论。

]



