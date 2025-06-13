#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#set par(first-line-indent: 2em) // TODO

#text(fill: blue.darken(50%))[
  #align(center)[
    #text(20pt)[
      *偏微分方程*
    ]

    更新日期：#datetime(year: 2025, month: 3, day: 28).display("[year] 年 [month] 月 [day] 日")

    22377264 安阳
  ]
]
#line(stroke: 1pt + blue.darken(50%), length: 100%)

#ex("Hopf 引理")[
  设 $S$ 是 $bb(R)^n$ 中的一个区域，假设 $u in C^1 (overline(S)) inter C^2 (S)$ 且满足条件：

  + $- Delta u lt.eq 0$,
  + 存在 $x_0 in diff S$，使得对于任意 $x in S$，有 $u (x) < u (x_0)$，

  则
  $ eval(frac(diff u, diff nu))_(x = x_0) > 0 , $
  其中 $nu$ 是 $diff S$ 在点 $x_0$ 处的外法向量。
]
#pf[
  先构造辅助函数。在边界点 $x_0$ 邻域内，取半径 $epsilon$ 的小球 $B(x_0,epsilon)∩S$。定义比较函数 $ v(x) = e^(-alpha r^2) - e^(-alpha epsilon^2), quad r = |x-x_0|, $ 选取 $alpha$ 足够大，使得在 $partial B(x_0,epsilon)$ 上 $v ≥ 0$，且满足$Delta v > 0$。

  然后应用极值原理，令 $w = u - u(x_0) + delta v$。在 $S inter B(x_0,epsilon)$ 内，由条件得 $Delta w = Delta u - delta Delta v ≥ -delta Delta v < 0$。因在边界上 $u<  u(x_0)$，当 $delta$ 足够小时，$w$ 在 $S inter B(x_0,epsilon)$ 的边界非正。由极值原理，$w ≤ 0$ 于内部。

  那么在 $x_0$ 处沿法向 $nu$ 方向有 $
    eval(pdv(u,nu))_(x=x_0) = lim_(h -> 0^+) (u(x_0 - h nu) - u(x_0)) / (-h) >= delta pdv(u,v) > 0,
  $ 故结论成立。
]

#ex[
  设 $u (x)$ 是球 $B (0 , R_0)$ 上的调和函数，定义
  $ omega (R) = sup_(B (0 , R)) u-inf_(B (0 , R)) u . $

  + 应用 Harnack 不等式证明：存在 $eta in (0 , 1)$，使得 $ omega (R / 2) lt.eq eta omega (R) . $ 提示：对调和函数 $w (x) = u (x) - inf_(B (0 , R)) u$ 在球 $B (0 , R \/ 2)$ 上应用 Harnack 不等式。
  + 如果 $sup_(B (0 , R_0)) lr(|u (x)|) lt.eq M_0$，则存在常数 $alpha in (0 , 1)$ 和 $C > 0$，使得 $ omega (R) lt.eq C (M_0 + 1) (R / R_0)^alpha , quad R in \( 0 , R_0 \] . $ 提示：对于任意 $R in (0 , R_0)$，存在一个整数 $i gt.eq 1$，使得 $R_0 \/ 2^i lt.eq R < R_0 \/ 2^(i - 1)$。
]
#pf[
  + 设 $
  w(x) = u(x) - inf_(B(0,R))u,
$ 则 $w >= 0$ 且是调和的。由 Harnack 不等式，存在仅依赖于维数的 $eta in (0, 1)$ 使得 $
  sup_(B(0, R\/2)) w <= eta inf_B(0,R\/2) w <= eta sup_B(0,R) w = 0,
$ 所以得到 $
  omega(R\/2) = sup_(B(0, R\/2)) w <= eta sup_(B(0,R)) w = eta omega(R).
$
  + 对 $R in (0, R_0)$ 知道一定存在 $i$ 使得 $R_0 \/ 2^i <= R < R_0\/2^(i-1)$，递归一直应用得到 $
  omega(R) <= eta^i omega(R_0\/2^(i-1)) <= eta^i 2 M_0.
  $ 由于 $i approx log_2(R_0 \/ R)$，从而 $ eta^i <= exp(i ln n) <= C (R / R_0)^alpha, quad alpha = - log_2 eta, $ 那么有 $
    omega(R) <= C(M_0 + 1)(R/R_0)^alpha.
  $
]

#ex[
  求解边值问题 $ cases(delim: "{", - Delta u = f (x , y) \,quad & (x , y) in Omega, u\|_(partial Omega) = phi) $ 的格林函数，其中

  + $Omega$ 是上半平面；
  + $Omega$ 是带形区域 ${ (x , y) \| - oo < x < oo , 0 < y < 1 }$。
]

#pf[
  + $
      G(x,y;x',y')
      &= 1 / (2pi)(ln 1 / sqrt((x-x')^2 + (y-y')^2) - ln 1 / sqrt((x-x')^2 + (y+y')^2))\
      &= 1 / (4pi) ln ((x-x')^2 + (y+y')^2) / ((x-x')^2 + (y-y')^2).
    $
  + 在 $y'$ 上下对称位置放置无穷镜像电荷，此时有 $
      G(x,y;x',y')
      &= sum_(k = -oo)^oo (-1)^k Phi(x - x', y - (y' + 2k)),
  $ 其中 $Phi$ 为二维 Laplace 方程基本解，容易看出该级数满足 $y = 0, y = 1$ 处的边界条件。
]
