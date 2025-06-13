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
  给定 $g : \[ 0 , oo \) arrow.r bb(R)$, $g (0) = 0$，推导初边值问题
  $
    cases(u_t (x , t) - u_(x x) (x , t) = 0\,quad quad & (x , t) in bb(R)_(+) times (0 , oo)\,, u (x , 0) = 0\, & x in bb(R)_(+)\,, u (0 , t) = g (t)\, & t gt.eq 0)
  $
  的解的公式：
  $ u (x , t) = x / sqrt(4 pi) integral_0^t 1 / (t - s)^(3 \/ 2) e^(frac(- x^2, 4 (t-s))) g (s) thin dd(s) $
  提示：令 $v (x , t) := u (x , t) - g (t)$，然后用奇反射延拓 $v$ 到 ${ x < 0 }$ 上。
]
#pf[
  令 $v(x, t) = u(x, t) - g(t)$，那么方程化成 $ v_t - v_(x x) = -g'(t), $ 初始条件为 $v(x, 0) = -g(0)= 0$，边界 $v(0, t) = u(0, t) - g(t) = 0$。

  将 $v(x, t)$ 延拓到 $x < 0$ 部分，令 $v(-x, t) = -v(x, t)$，热方程转化到全空间上，成为 $ v_t - v_(x x) = -g'(t) quad x in RR, t > 0, $ 直接解出 $ v(x, t)
  &= -integral_0^t integral_(-oo)^oo 1 / (4 pi(t- s)) exp(-(x-y)^2 / (4(t-s))) g'(s) dd(y, s)\
  &= x / sqrt(4pi) integral_0^t g(s) / (t-s)^(3\/2) exp(-x^2 / (4(t-s)))dd(s). $
]

#ex[
  若 $v in C_1^2 (Omega_T)$ 在 $Omega_T$ 中满足
  $v_t - Delta v lt.eq 0$，则称 $v$ 是热传导方程的下解。

  + 证明 $max_(overline(Omega)_T) v = max_(Gamma_T) v$。
  + 设 $phi.alt : bb(R) arrow.r bb(R)$ 是光滑且凸的，假设 $u$
    是热传导方程的解，证明 $v := phi.alt (u)$ 是下解。
  + 若 $u$ 是热传导方程的解，证明 $v := lr(|D u|)^2 + u_t^2$ 是下解。
]
#pf[
  + 设 $v$ 在内部点 $(x_0, t_0) in Omega_T$ 取得最大值，则 $v_t (x_0, t_0) >= 0, Delta v(x_0, t_0) <= 0$，代入方程得到 $v_t - Delta v >= 0$ 矛盾，故最大值在边界 $Gamma_T$ 上。

  + 令 $v = phi(u)$，那么 $ v_t = phi'(u)u_t, quad Delta v = phi''(u)|nabla u|^2 + phi'(u) nabla u, $ 代入方程得到 $ v_t - Delta v = phi'(u)(u_t - Delta u) - phi''(u)|nabla u|^2 <= 0, $ 而由题目条件和 $phi$ 的凸性，不等式成立。

  + 定义 $v = |nabla u|^2 + u_t^2$，那么 $ v_t = 2 nabla u dot nabla u_t + 2 u_t u_(t t), $ 代入热方程 $u_t = Delta u$ 化简得到 $ v_t - Delta v <= -2 |nabla^2 u|^2 - 2|nabla u_t|^2 <= 0, $ 说明 $v$ 是下解。
]

#ex[
  设 $u in C (Omega_T) inter C^(2 , 1) (Omega_T)$ 且满足
  $ u_t - u_(x x) + c (x , t) u lt.eq 0 , quad (x , t) in Omega_T , $
  其中 $c (x , t)$ 有界，且 $c (x , t) gt.eq 0$。试证明：如果 $u$ 在
  $overline(Omega)_T$ 上存在非负最大值，则 $u$ 必在抛物边界 $Gamma_T$ 上达到它在
  $overline(Omega)_T$ 上的非负最大值。
]
#pf[
  设 $u$ 在 $overline(Omega)_T$ 内某点取到非负最大值 $M$，令 $w = u e^(- lambda t)(lambda >||c||_oo)$，那么 $ w_t - w_(x x) + (c + lambda) w <= 0, $ 因为 $c + lambda > 0$，若 $w$ 在内部取得最大值，则 $w_t >=0, w_(x x) <= 0$ 从而矛盾。
]
