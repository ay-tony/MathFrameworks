#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#let ex = ex.with(base_level: 2)

#text(20pt)[#align(center)[
    *Probability: Theory and Examples*

    *概率论：理论与例子*
  ]]

#outline(indent: 2em)
#pagebreak(weak: true)

#set heading(numbering: "1.")

= 测度论

== 测度空间

#de([$sigma$-域、$sigma$-代数])[
  设 $sF$ 是集合 $Omega$ 上的集合系，称 *$sF$ 是 $Omega$ 上的 $sigma$-域或 $sigma$-代数*，如果
  + 对 $A in sF$ 有 $A^c in sF$；
  + 如果 ${A_i in sF}$ 是 $Omega$ 的可数个子集，那么 $union.big_i A_i in sF$。
]<sigma-域><sigma-代数>

#de("测度空间")[
  设 $Omega$ 是集合，$sF$ 是 $Omega$ 上的 $sigma$-域，称二元组 $(Omega, sF)$ 是一个*测度空间*。
]<测度空间>

#de("测度、概率测度")[
  设 $sF$ 是集合 $Omega$ 上的集合系。

  称 *$mu$ 是集合系 $sF$ 上的测度*，如果
  + $mu$ 是从 $sF$ 到 $overline(RR)$ 的函数；
  + $mu(A) >= mu(diameter) = 0$ 对 $forall A in sF$ 成立；
  + 对 $sF$ 中的可数无交集合列 ${A_i}$ 有 $
mu(union.big_i A_i) = sum_i mu(A_i).
  $

  称 *$mu$ 为集合系 $sF$ 上的概率测度*，如果 $mu$ 是集合系 $sF$ 的测度且 $mu(Omega) = 1$。
]<测度><概率测度>

#de("概率空间")[
  设 $Omega$ 是集合，$sF$ 是 $Omega$ 上的 $sigma$-域，$P$ 是 $sF$ 上的概率测度，称三元组 $(Omega, sF, P)$ 是一个*概率空间*。
]<概率空间>

#prop("测度的性质")[
  设 $mu$ 是测度空间 $(Omega, sF)$ 上的测度。
  + $mu$ 有单调性，即对 $A subset B$ 有 $mu(A) <= mu(B)$；
  + $mu$ 有次可数可加性，即对 $A subset union.big_(i=1)^oo A_i$ 有 $
  mu(A) <= sum_(i=1)^oo mu(A_i),
  $
  + $mu$ 有下连续性，即对 $A_i arrow.t A$ 有 $mu(A_i) arrow.t mu(A)$；
  + $mu$ 有上连续性，即对 $A_i arrow.b A$，如果 $mu(A_1) < oo$ 则有 $mu(A_i) arrow.b mu(A)$。
]<测度的性质>

#prop([$sigma$-域对交的封闭性])[
  设 ${sF_i}_(i in I)$ 是 $Omega$ 上的 $sigma$-域，那么 $sect.big_(i in I)sF$ 也是 $Omega$ 上的 $sigma$-域。
]<sigma-域对交的封闭性>

#de([生成的 $sigma$-域])[
  设 $Omega$ 是集合，$sA$ 是 $Omega$ 上的集合系，由@sigma-域对交的封闭性 知道 $
sect.big sF, quad sF "是包含" sA "的 "sigma"-域"
$ 也是 $sigma$-域，称为 *$sA$ 生成的 $sigma$-域*，记作 $sigma(sA)$。
]<生成的sigma-域>

#de([Borel 集])[
  称 $RR^d$ 上所有开集生成的 $sigma$-域为 *Borel 集*，记作 $sR^d$。
]<Borel集>

#de("半环、半代数")[
  设 $Omega$ 是集合，$sS$ 是 $Omega$ 上的集合系，称 *$sS$ 是 $Omega$ 上的半代数或半环*，如果
  + 对 $forall A, B in sS$ 有 $A sect B in sS$；
  + 对 $forall A in sS$ 那么 $A^c$ 可以表示成 $sS$ 中有限个元素的无交并。
]<半环><半代数>

#de("代数、域")[
  设 $Omega$ 是集合，$sF$ 是 $Omega$ 上的集合系，称 *$sF$ 是 $Omega$ 上的代数或域*，如果
  + 对 $forall A, B in sF$ 有 $A union B in sF$；
  + 对 $forall A in sF$ 有 $A^c in sF$。
]<代数><域>

#prop("代数对交的封闭性")[
  设 $sF$ 是 $Omega$ 上的代数，那么 $forall A, B in sF$ 有 $A sect B in sF$。
]

#prop([$sigma$-代数是代数])[
  设 $sF$ 是 $Omega$ 上的 $sigma$-代数，那么 $sF$ 是 $Omega$ 上的代数。
]

#prop([半环可以生成环])[
  设 $sS$ 是 $Omega$ 上的半环，那么 $
overline(sS) = { sS "上有限元素的无交并" }
$ 是 $Omega$ 上的环。
]

#de("生成的环")[
  设 $sS$ 是 $Omega$ 上的半环，那么 $overline(sS)$ 称为由 $sS$ 生成的环。
]<生成的环>

#de([$sigma$-有限])[
  设 $sA$ 是 $Omega$ 上的集合系，$mu$ 是 $sA$ 上的测度，称 $mu$ 是 $sigma$-有限的，如果存在可数集合列 ${A_i in sA}$ 使得 $mu(A_i) < oo$ 且 $union.big_i A_i = Omega$。
]

#prop([测度的扩张])[
  设 $sS$ 是半代数，$mu$ 是 $sS$ 上的函数，满足 $mu(diameter) = 0$. 如果
  + 对 $sS$ 中的有限个无交元素 $S_i in sS$ 满足 $union.sq.big_i S_i = S in sS$ 均有 $
  sum_i mu(S_i) = mu(S),
  $
  + 对 $sS$ 中的可数个无交元素 $S_i in sS$ 满足 $union.sq.big_i S_i = S in sS$ 均有 $
sum_i mu(S_i) <= mu(S),
  $ 那么 $mu$ 能够唯一地扩张到 $sS$ 生成的代数 $overline(sS)$ 上。如果 $overline(sS)$ 上的测度 $overline(mu)$ 还是 $sigma$-有限的，那么它还能够唯一地扩张到 $sigma(sS)$ 上。
]

#ex()[
  Let $Omega = bb(R)$, $scr(F) =$ all subsets so that $A$ or $A^c$ is countable, $P(A) = 0$ in the first case and $= 1$ in the second. show that $(Omega , scr(F) , P)$ is a probability space.
]
#pf[
  只要证明 $sF$ 是 $Omega$ 上的 $sigma$-域且 $P$ 是 $sF$ 上的测度。

  首先有 $diameter$ 可数，从而 $diameter, RR in sF$。考虑 $sF$ 中的集合列 ${A_i in sF}$。若存在 $k$ 使得 $A_k^c$ 可数，那么 $abs(union.big A_i) >= abs(A_k)$ 从而 $union.big A_i$ 的补集可数；若不存在上述 $A_k^c$，那么所有的 $A_i$ 均为可数集合，从而它们的可数并也可数。所以 $sF$ 是 $Omega$ 上的 $sigma$-域。

  设 ${A_i}$ 是 $sF$ 上的可数个不交集合列。容易看出 ${A_i}$ 中存在至多一个不可数集 $A_k$，那么若 $A_k$ 存在则 $P(union.big A_i) = sum P(A_i) = 1$；否则 $P(union.big A_i) = sum P(A_i) = 0$。
]

#ex()[
  Rescrl the definition of $scr(S)_d$ from example 1.1.5. show that $sigma (scr(S)_d) = scr(R)^d$, the borel subsets of $bb(R)^d$.
]
#pf[
  对于 $sR^d$ 的一组拓扑基 $
  {(x_1, y_1)times (x_2, y_2) ... times (x_d, y_d): x_i, y_i in RR}
  $ 中的一个开集 $
    (x_1, y_2) times ... times (x_d, y_d),
  $ 有 $
    (x_1, y_2) times ... times (x_d, y_d)
    &= union.big_j ((x_1, y_1 - 1 / j] times ... times (x_d, y_d - 1 / j]) in sS_d,
  $ 从而 $sigma(sS_d) subset sigma(sR^d)$。对 $sS_d$ 中的拓扑基 $
    (x_1, y_2] times ... times (x_d, y_d],
  $ 有 $
    (x_1, y_2] times ... times (x_d, y_d]
    &= sect.big_j ((x_1, y_1 + 1 / j) times ... times (x_d, y_d + 1 / j)) in sR_d,
  $ 从而 $sigma(sR^d) subset sigma(sS_d)$。
]

#ex()[
  A $sigma$-field $scr(F)$ is said to be countably generated if there is a countable collection $scr(C) subset scr(F)$ so that $sigma (scr(C)) = scr(F)$. Show that $scr(R)^d$ is countably generated.
]
#pf[
  只要证明 $scr(R)^d$ 可以由 ${(a, b] : a, b in QQ}$ 生成，那么只要证明 ${(a, b]: a, b in RR}$ 可以被它生成，而对于 $forall (a, b]$ 为实数区间，一定存在单调下降的有理数列 $b_n arrow.b b$，从而 $
(a, b] = sect.big_n (a_n, b_n].
  $ 那么 $(a, b]$ 可以被生成。
]

#ex()[
  + Show that if $scr(F)_1 subset scr(F)_2 subset dots.h$ are $sigma$-algebras, then $sect.big_i scr(F)_i$ is an algebra.
  + Give an example to show that $union.big_i scr(F)_i$ need not be $sigma$-algebra.
]
#pf[
  + 设 $sF_i$ 是 $Omega$ 上的 $sigma$-代数，那么一定有 $diameter, Omega in sF_i$ 对每个 $i$ 成立。对 $forall A in sect.big_i sF_i$, 一定有 $A^c in sect.big_i sF_i$。对 $forall {A_n} in sF_i$，一定有 $union.big_n A_n in sF_i$。
  + 设 $Omega = NN^+, sF_i$ 为由 $2^{1, 2, ..., i}$ 生成的 $sigma$-代数。那么这时有 $union.big_i sF_i = 2^NN$。令 $A_i$ 为 $[1, i]$ 中所有偶数的集合，那么 $A_i in sF_i$ 对所有 $i in NN^+$ 成立，从而 $A_i in union.big_n sF_n$。这时 $union.big_i A_i$ 为 $NN*+$ 中所有偶数的集合，但是其并不包含于 $union.big_i sF_i$，因为它是无限集，而后者的所有元素都是有限集。
]

#ex()[
  A set $A subset { 1 , 2 , dots.h }$ is said to have asymptotic density $theta$ if $
  lim_(n arrow.r oo) lr(|A sect { 1 , 2 , dots.h , n }|) / n = theta.
  $ Let $scr(A)$ be the collection of sets for which the asymptotic density exists. Is $scr(A)$ a $sigma$-algebra? an algebra?
]
#pf[
  $sA$ 不是代数。令集合 $A$ 为 $N^+$ 中所有奇数的集合，那么显然有 $A$ 具有渐进密度 $1\/2$。再构造具有渐进密度为 $1\/2$ 的集合 $B$ 如下：$
    B = {1, 4, 5, 7, 10, 12, 14, 16, 17, 19, 21, 23, ...},
  $ $B$ 在所有形如 $(2^(2k-1), 2^(2k)]$ 的区间上取所有奇数，在所有形如 $(2^(2k), 2^(2k+1)]$ 的区间上取所有偶数。这时可以证明 $A union B$ 不具有渐进密度，因为在前 $2^(2k-1)$ 个数上的密度小于 $3\/4$，而在前 $2^(2k)$ 个数上的密度大于 $3\/4$。
]

== 分布

#ex()[
  Suppose $X$ and $Y$ are random variables on $(Omega , scr(F) , P)$ and let $A in scr(F)$. Show that if we let $Z (omega) = X (omega)$ for $omega in A$ and $Z (omega) = Y (omega)$ for $omega in A^c$, then $Z$ is a random variable.
]
#pf[
  对任意 Borel 集 $B in sR$，$
    Z^(-1)(B)
    &= (Z^(-1)(B) sect A) union (Z^(-1)(B) sect A^c)\
    &= (X^(-1)(B) sect A) union (Y^(-1)(B) sect A^c)\
    &in sF.
    $ 从而 $Z$ 也是随机变量。
]

#ex()[
  Let $chi$ have the standard normal distribution. Use Theorem 1.2.6 to get upper and lower bounds on $P (chi gt.eq 4)$.
]
#pf[
  $
    P(chi >= 4)
    &= 1 / sqrt(2pi) integral_4^oo exp(x^2 / 2) dd(x)
    <= 1 / (4sqrt(2pi)) exp(8),\
    P(chi >= 4)
    &= 1 / sqrt(2pi) integral_4^oo exp(x^2 / 2) dd(x)
    >= (1 / 4 - 1 / 64) 1 / (sqrt(2pi)) exp(8).
  $
]

#ex()[
  Show that a distribution function has at most countably many discontinuities.
]
#pf[
  由于分布函数是单调有界函数，从数学分析相关知识知道其不连续点一定都是跳跃间断点，且不连续点至多可数。
]

#ex()[
  Show that if $F (x) = P (X lt.eq x)$ is continuous then $Y = F (X)$ has a uniform distribution on $(0 , 1)$, that is, if $y in [0 , 1] , P (Y lt.eq y) = y$.
]
#pf[
  对 $forall y in [0, 1]$，$
P(Y <= y)
&= P(F(X) <= y)
&= P(X <= F^(-1)(y))
&= F(F^(-1)(y)) = y.
$
]

#ex()[
  Suppose $X$ has continuous density $f$, $P (alpha lt.eq X lt.eq beta) = 1$ and $g$ is a function that is strictly increasing and differentiable on $(alpha , beta)$. Then $g (X)$ has density $
  (f (g^(- 1) (y))) / (g prime (g^(- 1) (y)))
  $ for $y in (g (alpha) , g (beta))$ and $0$ otherwise. When $g (x) = a x + b$ with $a > 0$, $
  g^(- 1) (y) = (y - b) / a
  $ so the answer is $
  1 / a f ((y - b) / a).
  $
]
#pf[
  对 $forall y in [alpha, beta]$，有 $
    P(g(X) <= x) = P(X <= g^(-1)(x)) = integral_alpha^(g^(-1)(x)) f(t) dd(t).
  $ 令 $s = g^(-1)(t)$ 换元得到 $
    P(g(X) <= x) = integral_alpha^(g^(-1)(x)) f(t) dd(t) = integral_g(alpha)^x f(g^(-1)(s)) / (g'(g^(-1)(s))) dd(s).
  $
]

#ex()[
  Suppose $X$ has a normal distribution. Use the previous exercise to compute the density of $exp (X)$. \(The answer is scrled the lognormal distribution.)
]
#pf[
  令 $g(X) = exp(X), g'(X) = exp(X), g^(-1)(y) = log(y)$ 得到 $exp(X)$ 的概率密度函数 $
f(g^(-1)(y))/(g'(g^(-1)(y)))
&= 1 / sqrt(2pi) (exp(-1/2 (log y)^2)) / (exp(log(y)))
&= 1 / (sqrt(2pi)y) exp(-1/2 log^2 y).
$
]

#ex()[
  + Suppose $X$ has density function $f$. Compute the distribution function of $X^2$ and then differentiate to find its density function.

  + Work out the answer when $X$ has a standard normal distribution to find the density of the chi-square distribution.
]
#pf[
  + 记 $X^2$ 的分布函数为 $G(x)$，那么 $
      G(x) = P(X^2 <= x)
      &= P(- sqrt(x) <= X <= sqrt(x))
      &= integral_(-sqrt(x))^sqrt(x) f(t) dd(t).
    $ 即为其分布函数。记其概率密度函数为 $g$，则 $
        g(x) = dv(G, x) = (f(sqrt(x)) + f(-sqrt(x))) / (2sqrt(x)).
    $
  + 代入正态分布概率密度函数得到 $
      f_(chi^2)(x) = 1 / sqrt(2 pi x) exp(-x/2).
  $
]

== 随机变量

#ex[
  Show that if $scr(A)$ generates $scr(S)$, then $X^(- 1) (scr(A)) equiv { { X in A } : A in scr(A) }$ generates $
sigma (X) = { { X in B } : B in scr(S) }.
$
]
#pf[
  因为 $X^(-1)(sA) subset sigma(X)$，从而 $sigma(X^(-1)(sA)) subset sigma(X)$。对于任意包含 $X^(-1)(sA)$ 的 $sigma$-域 $sB$，$X(sB)$ 是包含 $sA$ 的 $sigma$-域，从而 $sA subset sS subset X(sB)$，那么 $X^(-1)(sA) subset sigma(X) subset  sB$，那么 $sigma(X^(-1)(sA)) subset sigma(X) subset sB$，那么 $sigma(X)$ 是包含 $X^(-1)(sA)$ 的最小 $sigma$-域，从而 $sigma(X) = sigma(X^(-1)(sA))$.
]

#ex[
  Prove Theorem 1.3.6 when $n = 2$ by checking $
{ X_1 + X_2 < x } in scr(F).
$
]
#pf[
  因为 ${(-oo, x): x in RR}$ 可以生成 $sR$，所以只要证明 ${X_1 + X_2 < x} in sF$。容易看出 ${x' = (x_1, x_2) in RR^2: x_1 + x_2 < x} in sR^2$，从而 $f(x_1, x_2) = x_1 + x_2$ 是可测函数，那么 ${X_1 + X_2 < x} in sF$。
]

#ex[
  Show that if $f$ is continuous and $X_n arrow.r X$ almost surely then $f (X_n) arrow.r f (X)$ almost surely.
]
#pf[
  设 $X_n -> X$ 在 $Omega'$ 上满足，其中 $P(Omega') = 1$。那么对 $forall omega in Omega'$ 有 $X_n (omega) -> X(omega)$，又知道 $f$ 连续，从而 $f(X_n (omega)) -> f(x(omega))$。那么 $f(X_n) -> f(X)$ 在 $Omega'$ 上成立。
]

#ex[
  + Show that a continuous function from $bb(R)^d arrow.r bb(R)$ is a measurable map from $(bb(R)^d , scr(R)^d)$ to $(bb(R) , scr(R))$.
  + Show that $scr(R)^d$ is the smallest $sigma$-field that makes all the continuous functions measurable.
]
#pf[
  + 设 $f: RR^n -> RR$ 是连续函数，那么因为 ${(-oo, x)}$ 生成 $sR$，只要对 $forall x in RR$，证明 $f^(-1)((-oo, x)) in sR^d$ 即可。因为 $f$ 连续，那么 $f^(-1)((-oo, x))$ 为开集，从而是 Borel 集。
  + 只要证明 $
    sR^d = sigma({f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}).
  $ 由上一问已经知道 $
    sigma({f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}) subset sR^d.
  $ 考虑任意包含 ${f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}$ 的 $sigma$-域 $sA$。取定 $sR^d$ 的一组生成元 ${(-oo, x_1) times ... times (-oo, x_d) : x_1, ..., x_d in RR}$，取其中的一个元素为 $(-oo, x_1) times ... times (-oo, x_d)$。那么可以构造连续函数 $
    f(vx) = "dis"(vx, (-oo, x_1) times ... times (-oo, x_d)),
  $ 其中 $"dis"$ 表示距离函数。那么有 $f^(-1)((-oo, 0)) = (-oo, x_1) times ... times (-oo, x_d)$，从而 $sR^d subset sA$。那么命题得证。
]

#ex[
  A function $f$ is said to be lower semicontinuous or l.s.c. if $
  liminf_(y arrow.r x) f (y) gt.eq f (x)
  $ and upper semicontinuous (u.s.c.) if $- f$ is l.s.c. Show that $f$ is l.s.c. if and only if ${ x : f (x) lt.eq a }$ is closed for each $a in bb(R)$ and conclude that semicontinuous functions are measurable.
]
#pf[
  先证必要性，假设 $f$ 是下半连续的，只要对 $forall a in RR$，证 ${x: f(x) > a}$ 是开集。从中任取 $x$，那么有 $
    liminf_(y -> x)f(y) >= f(x) > a，
  $ 从而存在 $x$ 的邻域 $U(x, delta(x))$ 使得对 $forall y in (x, delta(x))$ 有 $
    f(y) >= (f(x) + a) /  2 > a,
  $ 从而 $x$ 是 ${x: f(x) > a}$ 的内点，那么 ${x: f(x) > a}$ 是开集。

  再证充分性。假设对 $forall a in RR$，${x: f(x) <= a}$ 是闭集，从而 ${x: f(x) > a}$ 是开集。$forall x_0 in RR$，考虑令 $y -> x_0$。对 $forall a < f(x_0)$，知道 $f(x_0)$ 附近存在邻域 $U$ 使得 $forall y in U$ 有 $f(y) > a$。令 $a arrow.t f(x_0)$ 即得到 $liminf f(y) >= f(x_0)$。

  从而上半连续函数都是可测函数，类似可以证明下半连续函数都是可测函数。
]

#ex[
  Let $f : bb(R)^d arrow.r bb(R)$ be an arbitrary function and let $
  f^delta (vx) = sup { f (vy) : lr(|vy - vx|) < delta }
  $ and $
  f_delta (vx) = inf { f (vy) : lr(|vy - vx|) < delta }
  $ where $
  lr(|vz|) = sqrt(vz_1^2 + dots.h + vz_d^2).
  $

  Show that $f^delta$ is l.s.c. and $f_delta$ is u.s.c. Let $f^0 = lim_(delta arrow.b 0) f^delta$, $f_0 = lim_(delta arrow.b 0) f_delta$, and conclude that the set of points at which $f$ is discontinuous $= { f^0 eq.not f_0 }$ is measurable.

  follows from the fact that $f^0 − f_0$ is.
]
#pf[
  直接按定义验证得到 $f^delta$ 是上半连续函数而 $f_delta$ 是下半连续函数。接下来只要证明 $f$ 的不连续点集就是 ${f^0 != f_0}$。

  假设 $vx in RR^d$ 是 $f$ 的不连续点，那么存在 $epsilon_0 > 0$，存在收敛到 $vx$ 的点列 ${vx'_n}$ 和 ${vx''_n}$ 使得 $|lim f(vx'_n) - lim f(vx''_n)| < epsilon_0$。不妨设 $
  lim f(vx'_n) > lim f(vx''_n) + epsilon_0.
  $ 对 $forall delta > 0$，总能找到 $vx'_n_0, vx''_n_0$ 使得 $
  |vx'_n_0 - vx|, |vx''_n_0 - vx| < delta
  $ 且 $
  f(vx'_n_0) >= f(vx''_n_0) + epsilon_0 / 2,
  $ 从而一定有 $
  f^delta (vx) >= f(vx'_n_0) >= f(vx''_n_0) + epsilon_0 / 2 >= f_delta (vx).
  $ 令 $delta arrow.b 0$ 得到 $f^0 (vx) >= f_0 (vx) + epsilon_0 \/ 2$。

  再假设 $vx_0$ 是 $f$ 的连续点，那么对 $forall epsilon > 0$，存在 $delta > 0$ 使得 $forall vx in U(vx_0, delta)$ 有 $abs(f(vx) - f(vx_0)) < epsilon$，从而 $
  abs(f^(delta) - f_delta) <= abs(f^delta - f(vx_0)) + abs(f_delta - f(vx_0)) < 2 epsilon.
  $ 令 $epsilon -> 0$ 即可知道 $f^0 = f_0$。
]

#ex[
  A function $phi : Omega arrow.r bb(R)$ is said to be simple if $
phi (omega) = sum_(m = 1)^n c_m 1_(A_m) (omega)
$ where the $c_m$ are real numbers and $A_m in scr(F)$. Show that the class of $scr(F)$ measurable functions is the smallest class containing the simple functions and closed under pointwise limits.
]
#pf[
  设 $P$ 是由从 $Omega$ 到 $RR$ 上的部分函数构成的集合，满足所有的简单函数都属于 $P$ 且对点态极限运算封闭。那么只要证明所有的 $sF$ 可测函数都在 $P$ 中。对 $forall f: Omega -> RR$ 为 $sF$ 可测函数，由 $f = f^+ - f^-$ 可以不妨设 $f>=0$。那么直接构造简单函数列 $
    quad phi_n (omega) = cases(
        n\, quad thin &f(omega) >= n,
        , display(k / 2^n\, &k / 2^n <= f(omega) < (k+1) / 2^n\, k = 0\, 1\, ...\, n 2^n-1)
    ).
  $ 容易看出 $phi_n$ 点态收敛于 $f$，从而 $f in P$。
]

#ex[
  Use the previous exercise to conclude that $Y$ is measurable with respect to $sigma (X)$ if and only if $Y = f (X)$ where $f : bb(R) arrow.r bb(R)$ is measurable.
]
#pf[
  充分性是显然的，下证明必要性。设 $Y$ 在 $sigma(X)$ 上可测。那么由上一问题知道 $Y$ 可以写成 $sigma(X)$ 上的简单函数的点态极限，记为 $Y = lim phi_n$。同样可以将 $X$ 写为 $X = lim psi_n$。记 $
    phi_n = sum_(m=1)^(a_n) c_(n, m) 1_(A_(n, m)), \
    psi_n = sum_(m=1)^(a_n) d_(n, m) 1_(A_(n, m)), \
  $ 可以不妨设 ${d_(n, m)}_m$ 两两不同。那么令 $
    f_n: RR -> RR, f(d_(n, m)) = c_(n, m), "否则" f = 0.
  $ 那么就有 $f_n (psi_n) = phi_n$。令 $n -> oo$，则有 $f(X) = Y$，且 $f$ 为可测函数。
]

#ex[
  To get a constructive proof of the last result, note that $
{ omega : m 2^(- n) lt.eq Y < (m + 1) 2^(- n) } = { X in B_(m , n) }
$ for some $B_(m , n) in scr(R)$ and set $f_n (x) = m 2^(- n)$ for $x in B_(m , n)$ and show that as $n arrow.r oo$ $f_n (x) arrow.r f (x)$ and $Y = f (X)$.
]
#pf[
  同上题。
]

== 积分

#ex()[
  Show that if $f gt.eq 0$ and $integral f thin d mu = 0$ then $f = 0$
  a.e.
]
#pf[
  设 $A = {f > 0} = union.big_n {f > 1 \/ n}$。若 $mu(A) > 0$，那么由测度的连续性知道，存在足够大的 $n_0 in NN^*$ 使得 $mu({f > 1\/n}) > 0$。那么 $
    integral f dd(mu)
    &= integral_A f dd(mu) + integral_(A^c) f dd(mu)\
    &= integral_A f dd(mu) \
    &= integral_{f > 1/n} f dd(mu) \
    &>= integral_{f > 1/n} 1/n dd(mu) \
    &= 1/n mu({f > 1 / n}) \
    &> 0,
  $ 从而矛盾。
]

#ex()[
  Let $f gt.eq 0$ and
  $
    E_(n , m) = { x : m / 2^n lt.eq f (x) < (m + 1) / 2^n }.
  $ As
  $n arrow.t oo$, $
  sum_(m = 1)^oo m / 2^n mu (E_(n , m)) arrow.t integral f thin d mu.
  $
]
#pf[
  不妨设 $lambda = sum_m mu(E_(n, m))$ 有限，否则命题化为 $oo arrow.t oo$ 显然成立。那么有 $
    & quad integral f dd(mu) - sum_(m=1)^oo m / 2^n mu(E_(n, m))\
    &= sum_(m=1)^oo integral_(E_(n, m)) (f - m / 2^n) dd(mu)\
    &<= sum_(m=1)^oo integral_(E_(n, m)) 1 / 2^n dd(mu)\
    &<= sum_(m=1)^oo mu(E_(n, m)) / 2^n \
    &= lambda / 2^n arrow.b 0 quad (n -> oo).
  $ 从而命题得证。
]

#ex()[
  Let $g$ be an integrable function on $bb(R)$ and $epsilon > 0$.
  + Use the definition of the integral to conclude there is a simple
    function $phi = sum_k b_k 1_(A_k)$ with $
    integral lr(|g - phi|) thin d mu < epsilon.
    $
  + Use Exercise A.2.1 to approximate the $A_k$ by finite unions of
    intervals to get a step function
    $ q = sum_(j = 1)^k c_j 1_((a_(j - 1) , a_j)) $ with
    $a_0 < a_1 < dots.h < a_k$, so that $
      integral lr(|phi - q|) < epsilon.
    $
  + Round the corners of $q$ to get a continuous function $r$ so that $
      integral lr(|q - r|) thin d mu < epsilon.
    $

  To make a continuous function replace each $c_j 1_((a_(j - 1) , a_j))$
  by a function that is $0$ on $(a_(j - 1) , a_j)^c$, $c_j$ on
  $[a_(j - 1) + delta_j , a_j - delta_j]$, and linear otherwise. If the
  $delta_j$ are small enough and we let $
  r (x) = sum_(j = 1)^k r_j (x)
  $ then
  $ integral lr(|q (x) - r (x)|) thin d mu = sum_(j = 1)^k delta_j c_j < epsilon. $
]
#pf[
  + 由于 $g = g^+ - g^-$ 不妨先证明 $g^+$，然后类似证明 $g^-$。由积分的定义知道存在可测函数 $h^+$，使得 $0 <= h^+ <= g$，$h^+$ 有界，且支集测度有限，且 $
    integral abs(g - h^+) dd(mu) < epsilon / 4.
  $ 对 $h^+$，再由积分定义知道存在非负简单函数 $phi^+ <= h^+$，使得 $
    integral abs(h^+ - phi^+) dd(mu) < epsilon / 4.
  $ 那么 $
    integral abs(g^+ - phi^+) dd(mu) <
    integral abs(g^+ - h^+) dd(mu) + integral abs(h^+ - phi^+) dd(mu) < epsilon / 2.
  $ 类似得到 $phi^-$ 满足 $
    integral abs(g^- - phi^-) dd(mu) <
    integral abs(g^- - h^-) dd(mu) - integral abs(h^- - phi^-) dd(mu) < epsilon / 2.
  $ 令 $phi = phi^+ - phi^-$ 直接得到结果。
  + 记 $
    phi = sum_(i=1)^n b_i 1_A_i.
  $ 对每个 $A_i$，由测度近似定理知道存在有限个开区间 $B_(i, 1), ..., B_(i, b_i)$ 使得对 $B_i = union.big_j B_(i, j)$ 有 $A_i subset B_i$ 且 $
  mu(B_i \\ A_i) < epsilon / (b_i n).
  $ 那么就有 $
    phi = sum_(i=1)^n sum_(j=1)^b_i b_i 1_B_(i, j),
  $ 重新排列就能够得到欲证命题。
]

#ex()[
  Prove the Riemann-Lebesgue lemma. If $g$ is integrable then $
  lim_(n arrow.r oo) integral g (x) cos  n x  thin dd(x) = 0.
  $

  Hint: If $g$ is a step function, this is easy. Now use the previous exercise.
]
#pf[
  先证明对于任意开区间 $(l, r)$ 成立 $
  lim_(n arrow.r oo) integral_((l, r)) cos  n x  thin dd(x) = 0.
  $ 考虑到 $cos n x $ 是以 $2\/n$ 为周期的周期函数，且在一个周期内的积分是 $0$，从而知道 $
  abs(integral_((l, r)) cos  n x  thin dd(x)) = abs(integral_((l, l + delta)) cos n x  dd(x)) <= integral_((l, l+delta)) abs(cos n x) dd(x) <= delta,
  $ 其中 $delta < 2 \/ n$. 令 $n -> oo$ 就得到积分趋近于 $0$. 那么对任意的 step function $g$，记 $
  g = sum_(i=1)^k c_i 1_((a_i, b_i)),
  $ 那么就有 $
  lim_(n arrow.r oo) integral g (x) cos  n x  thin dd(x)
  &=  sum_(i=1)^k c_i lim_(n -> oo) integral_((a_i, b_i)) cos n x dd(x)
  &= 0.
  $ 从而原命题在 $g$ 为 step function 时成立。对于 $g$ 为任意可积函数，$n in NN^*$ 的情况，存在 step function 构成的函数列 ${h_k}$ 使得 $
    &quad integral abs(g(x)cos n x - h_k (x) cos n x) dd(x)\
    &<= integral abs(g(x) - h_k (x)) dd(x)\
    &-> 0 quad (k -> oo).
  $ 从而有 $
  &quad abs(lim_(n arrow.r oo) integral g(x) cos  n x  thin dd(x))\
  &<= lim_(n arrow.r oo) integral abs(g(x) cos  n x ) thin dd(x)\
  &<= lim_(n arrow.r oo) lim_(k -> oo) integral abs(g(x) cos  n x  - h_k (x) cos n x ) + lim_(n arrow.r oo) lim_(k -> oo) integral abs(h_k (x) cos  n x ) thin dd(x)\
  &<= 0 + 0\
  &= 0.
  $
]

== 积分的性质

#ex[
  Let
  $ ||f||_oo = inf { M : mu({ x : lr(|f (x)|) > M }) = 0 }. $
  Prove that
  $ integral lr(|f g|) thin dd(mu) lt.eq ||f||_1 ||g||_oo. $
]
#pf[
  $
    integral |f g| dd(mu)
    &<= integral |f| |g| dd(mu)\
    &<= integral |f| ||g||_oo dd(mu)\
    &= ||g||_oo mu(Omega) integral |f| dd(mu)\
    &= ||f||_1 ||g||_oo.
  $
]

#ex[
  Show that if $mu$ is a probability measure then
  $ ||f||_oo = lim_(p arrow.r oo) ||f||_p. $
]
#pf[
  对任意的 $epsilon > 0$，有 $
    ||f||_p
    &= [integral |f|^p dd(mu)]^(1/p)\
    &= [integral_{|f|^p > ||f||_oo - epsilon} |f|^p dd(mu)]^(1/p)\
    &>= [mu({|f|^p > ||f||_oo - epsilon}) (||f||_oo - epsilon)^p]^(1/p)\
    &= [mu({|f|^p > ||f||_oo - epsilon})]^(1/p) (||f||_oo - epsilon).
  $ 令 $p -> oo$，再令 $epsilon -> 0$ 得到 $||f||_p >= ||f||_oo$。

  另一方面有 $
    ||f||_p
    &= [integral_{|f|^p > ||f||_oo} |f|^p dd(mu) + integral_{|f|^p <= ||f||_oo} |f|^p dd(mu)]^(1/p)\
    &= [integral_{|f|^p <= ||f||_oo} |f|^p dd(mu)]^(1/p)\
    &<= [integral_{|f|^p <= ||f||_oo} ||f||^oo dd(mu)]^(1/p)\
    &= ||f||^oo.
  $
]

#ex[
  + Suppose $p in (1 , oo)$. The inequality
    $ lr(|f + g|)^p lt.eq 2^p (lr(|f|)^p + lr(|g|)^p) $ shows that if
    $||f||_p$ and $||g||_p$ are $< oo$ then
    $ ||f+g||_p < oo. $ Apply Hölder’s inequality to
    $ lr(|f|) lr(|f + g|)^(p - 1) $ and $ lr(|g|) lr(|f + g|)^(p - 1) $ to
    show
    $ ||f+g||_p lt.eq ||f||_p + ||g||_p. $
  + Show that the last result remains true when $p = 1$ or $p = oo$.
]
#pf[
  直接用 Hölder 不等式知道 $
    integral |f| |f+g|^(p-1) dd(mu) &<= ||f||_p ||(f+g)^(p-1)||_q,\
    integral |g| |f+g|^(p-1) dd(mu) &<= ||g||_p ||(f+g)^(p-1)||_q.
  $ 那么有 $
    integral lr(|f + g|)^p dd(mu) &<= integral (lr(|f|)lr(|f+g|)^(p-1) + lr(|g|)lr(|f+g|)^(p-1)) dd(mu)\
    &<= (||f||_p + ||g||_p)||(f+g)^(p-1)||_q.
  $ 从而有 $
    ||f||_p + ||g||_p
    &>= (integral |f + g|^p dd(mu)) / ((integral |f + g|^((p-1)q))^(1/q))
    &= (integral |f + g|^p dd(mu)) / ((integral |f + g|^p)^(1 - 1 / p))
    &= ||f + g||_p.
  $ 再由之前练习，Hölder 不等式在 $p = 1$ 或 $p = oo$ 时也成立，所以可以将 $p$ 扩展到 $[1, oo]$。
]

#ex[
  If $f$ is integrable and $E_m$ are disjoint sets with union $E$ then
  $ sum_(m = 0)^oo integral_(E_m) f thin dd(mu) = integral_E f thin dd(mu). $
  So if $f gt.eq 0$, then $nu (E) = integral_E f thin dd(mu)$ defines a
  measure.
]
#pf[
  由于可以将 $f$ 分解为 $f^+ - f^-$，故可以不妨设 $f >= 0$。令 $
    g = f dot 1_E, quad g_n =  f dot sum_(i=0)^n 1_(E_i),
  $ 那么只要证明 $
    lim_(n -> oo)integral g_n dd(mu) = integral g dd(mu).
  $ 注意到 $g_n arrow.t g$ 且 $g = f dot 1_E$ 可积，由单调收敛定理直接推导出以上结论。
]

#ex[
  If $g_n arrow.t g$ and $integral g_1^(-) thin dd(mu) < oo$ then
  $ integral g_n thin dd(mu) arrow.t integral g thin dd(mu). $
]
#pf[
  令 $g'_n = g_n + g_1^-$，那么有 $g'_n >= g'_1 = g^+_1 >= 0$ 且 $g'_n arrow.t (g - g_1^-)$，由单调收敛定理知道 $
    lim integral g_n dd(mu) - integral g_1^- dd(mu) = lim integral g'_n dd(mu) = integral (g - g_1^-) dd(mu) = integral g dd(mu) - integral g_1^- dd(mu),
  $ 即 $
  integral g_n thin dd(mu) arrow.t integral g thin dd(mu).
  $
]

#ex[
  If $g_m gt.eq 0$ then
  $ integral sum_(m = 0)^oo g_m thin dd(mu) = sum_(m = 0)^oo integral g_m thin dd(mu). $
]
#pf[
  记 $
    f_n = sum_(m=1)^n g_m, quad f = lim_(n -> oo) f_n.
  $ 那么有 $f_n >= 0$ 且 $f_n arrow.t f$，从而由单调收敛定理知道 $
    sum_(m = 0)^oo integral g_m thin dd(mu) = lim integral f_n dd(mu) arrow.t integral f dd(mu) = integral sum_(m = 0)^oo g_m thin dd(mu).
  $
]

#ex[
  Let $f gt.eq 0$.
  + Show that $
    integral f and n thin dd(mu) arrow.t integral f thin dd(mu)
    $ as $n arrow.r oo$.
  + Use (1) to conclude that if $g$ is integrable and $epsilon > 0$
    then we can pick $delta > 0$ so that $mu (A) < delta$ implies $
    integral_A lr(|g|) thin dd(mu) < epsilon.
    $
]
#pf[
  + 由于 $f and n >= 0$ 且 $f and n arrow.t f$ 直接应用单调收敛定理知道 $
    integral f and n dd(mu) arrow.t integral f dd(mu).
  $
  + 由上一问结论知道存在足够大的 $N in NN^*$ 使得 $
    integral_(|g| >= N) |g| dd(mu) = integral |g| dd(mu) - integral |g| and N dd(mu) < epsilon / 2.
  $ 那么令 $delta = epsilon \/ (2 N)$ 直接对 $forall A subset Omega$ 且 $mu(A) < delta$ 有 $
    integral_A |g| dd(mu)
    &= integral_(A sect {|g| >= N}) |g| dd(mu) + integral_(A sect {|g| < N}) |g| dd(mu)\
    &<= integral_({|g| >= N}) |g| dd(mu) + integral_(A) N dd(mu)\
    &<= epsilon / 2 + epsilon / (2 N) dot N\
    &= epsilon.
  $
]

#ex[
  Show that if $f$ is integrable on $[a , b]$,
  $
    g (x) = integral_([a , x]) f (y) thin dd(y)
  $ is continuous on $(a , b)$.
]
#pf[
  $forall x_0 in (a, b)$. 考虑 $forall x in (x_0, b)$，有 $
    abs(g(x) - g(x_0))
    &= integral_((x_0, x]) f(y) dd(y) -> 0 quad (x arrow.b x_0)
  $ 其中趋近的结论由上一题目得出。类似可以证明 $x arrow.t x_0$ 的情况。
]

#ex[
  Show that if $f$ has $
  ||f||_p = (integral lr(|f|)^p thin dd(mu))^(1 / p) < oo,
  $ then there are simple functions $phi_n$ so that
  $
    ||phi_n - f||_p arrow.r 0.
  $
]
#pf[
  由于 $
    ||phi_n - f||_p <= ||phi_n^+ - f^+||_p + ||phi_n^- - f^-||_p,
  $ 故可以不妨设 $f >= 0$。由简单逼近定理，存在简单函数列 $phi_n$ 使得 $phi_n <= f$ 并且有 $phi_n arrow.t f$ 几乎处处。那么 $
    integral |phi_n - f|^p dd(mu) <= integral |2 f|^p dd(mu) <= 2^p integral |f|^p dd(mu) < oo,
  $ 由 Lebesgue 逼近定理知道 $
    lim integral |phi_n - f|^p dd(mu) = integral lim |phi_n - f|^p dd(mu) = 0,
  $ 两边同时开 $p$ 次方就得到结论。
]

#ex[
  Show that if $
  sum_n integral lr(|f_n|) thin dd(mu) < oo
  $ then $
  sum_n integral f_n thin dd(mu) = integral sum_n f_n thin dd(mu).
  $
]
#pf[
  因为可以将 $f_n$ 分解为 $f_n^+ - f_n^-$ 并分别证明，所以可以直接不妨设 $f_n >= 0$. 令 $
    g_n = sum_(m = 1)^n f_m, quad g = sum_m f_m.
  $ 那么相当于已知 $
    sum_n integral lr(|f_n|) thin dd(mu) = lim sum_(m=1)^n integral f_n dd(mu) = lim integral g_n dd(mu) < oo,
  $ 只要求证 $
  lim integral g_n dd(mu) = sum_n integral f_n thin dd(mu) = integral sum_n f_n thin dd(mu) = integral g dd(mu).
  $ 由于 $f_n >= 0$，从而 $g_n arrow.t g$，从而直接应用单调收敛定理知道 $
  lim integral g_n dd(mu) = integral g dd(mu) < oo.
  $
]

== 期望

#ex[
  Suppose $phi$ is strictly convex, i.e., $>$ holds for
  $lambda in (0 , 1)$. Show that, under the assumptions of Theorem 1.6.2,
  $phi (uE X) = uE phi (X)$ implies $X = uE X$ a.s. .
]
#pf[
  使用反证法。设 $phi$ 严格凸，$phi(uE X) = uE phi(X)$ 且 $P(A = {X != uE X}) > 0$。那么对 $forall omega in A$ 由严格凸函数性质有 $
    phi(X(omega)) > phi(uE X) + phi'(uE X)(X(omega) - uE X),
  $ 也即 $
    phi(X) 1_A > (phi(uE X) + phi'(uE X)(X - uE X)) 1_A,
  $ 左右同时取期望得到 $
    LHS
    &= uE(phi(X) 1_A)\
    &= uE(phi(X)) - uE(phi(X)1_(A^c))\
    &= uE(phi(X)) - uE(phi(uE X)1_(A^c))\
    &= uE(phi(X)) - phi(uE X) P(A^c)\
    > RHS &\
    &= uE((phi(uE X) + phi'(uE X)(X - uE X)) 1_A)\
    &= uE(phi(uE X) + phi'(uE X)(X - uE X)) - uE((phi(uE X) + phi'(uE X)(X - uE X)) 1_(A^c))\
    &= uE(phi(uE X) + phi'(uE X)(X - uE X)) - uE(phi(uE X) 1_(A^c))\
    &= uE(phi(uE X) + phi'(uE X)(X - uE X)) - phi(uE X)P(A^c),
  $ 从而得到 $
    uE(phi(X))
    &> uE((phi(uE X) + phi'(uE X)(X - uE X)))\
    &= phi(uE X) + phi'(uE X)(uE X - uE X)\
    &= phi(uE X)\
    &= uE(phi(X)),
  $ 矛盾。
]

#ex[
  Suppose $phi : bb(R)^n arrow.r bb(R)$ is convex. Imitate the proof of
  Theorem 1.5.1 to show
  $ uE phi (X_1 , dots.h , X_n) gt.eq phi (uE X_1 , dots.h , uE X_n) $
  provided $uE lr(|phi (X_1 , dots.h , X_n)|) < oo$ and $uE lr(|X_i|) < oo$
  for all $i$.
]
#pf[
  由凸函数性质知道 $
    phi(X_1, ..., X_n) >= phi(uE X_1, ..., uE X_n) + phi'(uE X_1, ..., uE X_n) dot (X_1 - uE X_1, ..., X_n - uE X_n),
  $ 其中 $x dot y$ 为向量点积。直接取期望得到 $
    uE phi(X_1, ..., X_n)
    &>= phi(uE X_1, ..., uE X_n) +\
    & quad phi'(uE X_1, ..., uE X_n) dot (uE X_1 - uE X_1, ..., uE X_n - uE X_n)\
    &>= phi(uE X_1, ..., uE X_n).
  $
]

#ex[
  Chebyshev’s inequality is and is not sharp.
  + Show that Theorem 1.6.4 is sharp by showing that if $0 < b lt.eq a$
    are fixed there is an $X$ with $uE X^2 = b^2$ for which
    $ P (lr(|X|) gt.eq a) = b^2 / a^2. $
  + Show that Theorem 1.6.4 is not sharp by showing that if $X$ has
    $0 < uE X^2 < oo$ then
    $ lim_(a arrow.r oo) (a^2 P(lr(|X|) gt.eq a)) / (uE X^2) = 0 $
]
#pf[
  + 令 $X$ 为离散分布，其中 $P(X = 0) = 1 - b^2 \/ a^2, P(X = a) = b^2 \/ a^2$。这时有 $
    P(|X| >= a) = P(X = a) = b^2 / a^2,
  $ 且 $
    uE X^2 = b^2 / a^2 dot a^2 = b^2.
  $
  + 只要证明 $a^2 P(|X| >= a) -> 0$。有 $
    a^2 P(|X| >= a)
    &= a^2 P(X^2 >= a^2)\
    &= integral_{X^2 >= a^2} a^2 dd(P)\
    &<= integral_{X^2 >= a^2} X^2 dd(P)\
    &-> 0 quad (a -> oo) quad quad ("因为" uE X^2 < oo).
  $
]

#ex[
  + Let $a > b > 0$, $0 < p < 1$ and let $X$ have $P (X = a) = p$ and
    $P (X = - b) = 1 - p$. Apply Theorem 1.6.4 to $phi (x) = (x + b)^2$
    and conclude that if $Y$ is any random variable with $uE Y = uE X$ and
    $upright("var") (Y) = upright("var") (X)$, then
    $P (Y gt.eq a) lt.eq p$ and equality holds when $Y = X$.
  + Suppose $uE Y = 0$, $upright("var") (Y) = sigma^2$, and $a > 0$. Show
    that $ P (Y gt.eq a) lt.eq sigma^2 / (a^2 + sigma^2), $ and there is a
    $Y$ for which equality holds.
]
#pf[
  + 直接将 $A = {Y >= a}, phi(Y) = (Y + b)^2$ 代入 Chebychev 不等式得到 $
    uE((Y + b)^2\; Y >= a) <= uE(Y + b)^2.
  $ 其中又有 $
    uE(Y + b)^2
    &= uE Y^2 + 2b uE Y + b^2\
    &= var Y + uE Y + 2b uE Y + b^2\
    &= var X + uE X + 2b uE X + b^2\
    &= uE X^2 + 2b uE X + b^2\
    &= p a^2 + (1 - p)b^2 + 2b(p a + (1 - p)(-b)) + b^2\
    &= p(a+b)^2,
  $ 而 $
    uE((Y + b)^2\; Y >= a) >= (a + b)^2 P(Y >= a).
  $ 从而直接代入 Chebychev 不等式就得到结论。容易验证 $Y = X$ 的时候取等。
  + 代入 $p = sigma^2 \/ (a^2 + sigma^2), b = sigma^2 \/ a$ 直接得出结论。
]

#ex[
  Show that:
  + if $epsilon > 0$,
    $inf { P (lr(|X|) > epsilon) : uE X = 0 , upright("var")(X) = 1 } = 0$.
  + if $y gt.eq 1$, $sigma^2 in (0 , oo)$,
    $ inf { P (lr(|X|) > y) : uE X = 1 , upright("var")(X) = sigma^2 } = 0. $
]
#pf[
  + 令 $X_n$ 满足 $P(X_n = n) = P(X_n = -n) = 1 \/ (2n^2), P(X_n = 0) = 1 - 1 \/ (2n^2)$. 这时容易验证 $var X_n = 1, uE X_n = 0$。且在 $n -> oo$ 时有 $P(|X_n| > epsilon) -> 0$ 对 $forall epsilon > 0$ 成立。
  + 令 $X_n$ 满足 $
    P(X_n = 1 + n) = P(X_n = 1 - n) = sigma^2 / (2 n^2), quad P(X_n = 1) = 1 - sigma^2 / n^2.
  $ 这时 $uE X_n = 1, var X_n = sigma^2$，且 $P(|X_n| > y) -> 0$ 在 $n -> oo$ 时对 $forall y >= 1$ 成立。
]

#ex[
  A useful lower bound. Let $Y gt.eq 0$ with $uE Y^2 < oo$. Apply the
  Cauchy -- Schwarz inequality to $Y 1_((Y > 0))$ and conclude
  $ P (Y > 0) gt.eq (uE Y)^2 / (uE Y^2). $
]
#pf[
  由于 $Y >= 0$ 从而 $Y 1_{Y > 0} = Y$。直接使用 Cauchy-Schwarz 不等式得到 $
    uE Y
    &= uE Y 1_{Y > 0}
    &<= sqrt(integral Y^2 dd(P) integral 1_{Y > 0}^2 dd(P))
    &<= sqrt(uE Y^2 P(Y > 0)),
  $ 即 $
    P (Y > 0) gt.eq (uE Y)^2 / (uE Y^2).
  $
]

#ex[
  Let $Omega = (0 , 1)$ equipped with the Borel sets and Lebesgue measure.
  Let $alpha in (1 , 2)$ and
  $ X_n = n^alpha 1_((1 / (n + 1) , 1 / n)) arrow.r 0 quad "a.s. ." $ Show that
  Theorem 1.6.8 can be applied with $h (x) = x$ and
  $g (x) = lr(|x|)^(2 \/ alpha)$, but the $X_n$ are not dominated by an
  integrable function.
]
#pf[
  首先验证三个条件。
  + $g(x) >= 0$ 显然，而且当 $|x| -> oo$ 时容易看出 $g(x) -> oo$；
  + $
      (|h(x)|) / g(x) = |x| dot |x|^(-2 / alpha) = |x|^(1 - 2 / alpha) -> 0 quad (x -> oo);
    $
  + $
      uE g(X_n)
      &= n^2 uE (1_((1 / (n+1), 1 / n)))^(2 / alpha)\
      &<= n^2 uE(1/n^2)^(2 / alpha)\
      &= n^(2-4 / alpha) -> 0 quad (n -> oo),
    $ 从而一定有 $uE g(X_n) <= K < oo$.
  那么由定理就知道 $
    uE X_n -> uE X = 0.
  $

  从另一方面看，$X_n$ 不能被任何可积函数控制，这是因为如果要 $|X_n| <= Y$ 对 $forall n = 1, 2, ...$ 成立，那么有 $Y$ 在 ${Y in (1 / (n+1), 1 / n)}$ 上取值大于等于 $X_n = n^alpha$. 这时 $
    uE Y
    &>= uE sum_n n^alpha 1_((1 / (n+1), 1 / n ))\
    &= sum_n n^alpha uE 1_((1 / (n+1), 1 / n )) quad ("单调收敛定理")\
    &>= sum_n n^alpha / (2n^2)\
    &= 1/2 sum_n n^(alpha - 2)
  $ 不收敛。
]

#ex[
  Suppose that the probability measure $mu$ has
  $mu (A) = integral_A f (x) d x$ for all $A in scr(R)$. Use the proof
  technique of Theorem 1.6.9 to show that for any $g$ with $g gt.eq 0$ or
  $ integral lr(|g (x)|) mu (d x) < oo $ we have
  $ integral g (x) mu (d x) = integral g (x) f (x) d x. $
]
#pf[
  + 当 $g$ 是指示函数时，设 $g(x) = 1_A$，其中 $A in sR$。这时 $
    integral g(x) mu(dd(x))
    &= integral 1_A mu(dd(x))
    &= mu(A)
    &= integral 1_A f(x) dd(x)
    &= integral g(x) f(x) dd(x);
  $
  + 当 $g$ 是简单函数时，设 $g(x) = sum_(i=1)^n a_i 1_A_i$，其中 $A_i in sR$。这时 $
    integral g(x) mu(dd(x))
    &= integral sum_(i=1)^n a_i 1_A_i mu(dd(x))\
    &= sum_(i=1)^n a_i integral 1_A_i mu(dd(x))\
    &= sum_(i=1)^n a_i integral 1_A_i f(x) dd(x)\
    &= integral (sum_(i=1)^n a_i 1_A_i) f(x) dd(x)\
    &= integral g(x) f(x) dd(x);
  $
  + 当 $g$ 是非负函数时，令 $
    g_n (x) = [2^n g(x)] / (2^n) and n,
  $ 那么 $g_n (x)$ 是简单函数且 $g_n arrow.t g, g_n f arrow.t g f$，从而由单调收敛定理知道 $
    integral g(x) mu(dd(x))
    &= lim integral g_n (x) mu(dd(x))\
    &= lim integral g_n (x) f(x) dd(x)\
    &= integral g(x) f(x) dd(x)\;
  $
  + 当 $g$ 为任意可积函数时，有 $
    integral g(x) mu(dd(x))
    &= integral (g^+(x) - g^-(x)) mu(dd(x))\
    &= integral g^+(x) mu(dd(x)) - integral g^-(x) mu(dd(x))\
    &= integral g^+(x) f(x) dd(x) - integral g^-(x) f(x) dd(x)\
    &= integral (g^+(x) - g^-(x)) f(x) dd(x)\
    &= integral g(x) f(x) dd(x).
  $
]

#ex[
  Inclusion - exclusion formula. Let $A_1 , A_2 , dots.h A_n$ be events
  and $A = union.big_(i = 1)^n A_i$. Prove that
  $1_A = 1 - product_(i = 1)^n (1 - 1_(A_i))$. Expand out the right hand
  side, then take expected value to conclude
  $
    P (union.big_(i = 1)^n A_i) & = sum_(i = 1)^n P (A_i) - sum_(i < j) P (A_i sect A_j)\
    & + sum_(i < j < k) P (A_i sect A_j sect A_k) - dots.h + (- 1)^(n - 1) P (sect.big_(i = 1)^n A_i).
  $
]
#pf[
  $
    1 - product_(i=1)^n (1 - 1_A_i)
    &= 1 - product_(i=1)^n 1_(A_i^c)\
    &= 1 - sect.big_(i=1)^n 1_(A_i^c)\
    &= 1 - 1_(sect.big_(i=1)^n A_i^c)\
    &= 1_((sect.big_(i=1)^n A_i^c)^c)\
    &= 1_(union.big_(i=1)^n A_i)\
    &= 1_A.
  $ 又知道 $
    P(union.big_(i=1)^n A_i)
    &= uE(1_(union.big_(i=1)^n A_i))\
    &= uE(1 - product_(i=1)^n (1 - 1_A_i))\
    &= 1 - product_(i=1)^n (1 - uE 1_A_i)\
    &= sum_(i=1)^n uE A_i - sum_(i < j) uE A_i uE A_j + ... + (-1)^(n-1) uE(sect.big_(i=1)^n A_i).
  $
]

#ex[
  Bonferroni inequalities. Let $A_1 , A_2 , dots.h A_n$ be events and
  $A = union.big_(i = 1)^n A_i$. Show that $1_A lt.eq sum_(i = 1)^n 1_(A_i)$,
  etc. and then take expected values to conclude
  $
    P (union.big_(i = 1)^n A_i) & lt.eq sum_(i = 1)^n P (A_i)\
    P (union.big_(i = 1)^n A_i) & gt.eq sum_(i = 1)^n P (A_i) - sum_(i < j) P (A_i sect A_j)\
    P (union.big_(i = 1)^n A_i) & lt.eq sum_(i = 1)^n P (A_i) - sum_(i < j) P (A_i sect A_j) + sum_(i < j < k) P (A_i sect A_j sect A_k).
  $
  In general, if we stop the inclusion -- exclusion formula after an even
  (odd) number of sums, we get an lower (upper) bound.
]
#pf[
  先证明 $1_A <= sum 1_A_i$。这很容易证明，因为对 $forall w in {1_A = 1}$ 一定有 $omega in A$，从而至少存在一个 $A_i_0$ 使 $omega in A_i_0$，从而 $
    sum_(i=1)^n 1_A_i (omega) >= 1_A_i_0 (omega) = 1 = 1_A (omega).
  $ 对不等式两侧直接取期望就得到 $
    P (union.big_(i = 1)^n A_i) & lt.eq sum_(i = 1)^n P (A_i).
  $ 剩余不等式可以类似证明。
]

#ex[
  If $uE lr(|X|)^k < oo$ then for $0 < j < k$, $uE lr(|X|)^j < oo$, and
  furthermore $ uE lr(|X|)^j lt.eq (uE lr(|X|)^k)^(j / k). $
]
#pf[
  令 $phi(x) = x^(j/k)$ 为凹函数，那么利用 Jensen 不等式直接得到 $
     uE lr(|X|)^j lt.eq (uE lr(|X|)^k)^(j / k) < oo.
  $
]

#ex[
  Apply Jensen’s inequality with $phi (x) = e^x$ and
  $P (X = log y_m) = p (m)$ to conclude that if $ sum_(m = 1)^n p (m) = 1 $
  and $p (m) , y_m > 0$ then
  $ sum_(m = 1)^n p (m) y_m gt.eq product_(m = 1)^n y_m^(p (m)). $ When
  $p (m) = 1 \/ n$, this says the arithmetic mean exceeds the geometric
  mean.
]
#pf[
  有 $
    phi(uE X)
    &= product_(m=1)^n y_m^p(m),\
    uE phi(X)
    &= sum_(m=1)^n y_m p(m),
  $ 从而直接用 Jensen 不等式得出结论。
]

#ex[
  If $uE X_1^(-) < oo$ and $X_n arrow.t X$ then $uE X_n arrow.t uE X$.
]
#pf[
  直接令 $X'_n = X_n + X_1^- >= X_n + X_n^- = X_n^+$，还有 $X'_n arrow.t X^+$，那么就由单调收敛定理知道 $uE X'_n arrow.t uE X^+$. 对于 $X_n^-$，注意到 $X_n^- <= X_1^-$，用 Lebesgue 收敛定理知道 $X_n^- arrow.b X^-$。两个式子相减就得到结论。
]

#ex[
  Let $X gt.eq 0$ but do NOT assume $uE (1 \/ X) < oo$. Show
  $ lim_(y arrow.r oo) y uE (1 / X ; X > y) = 0 , quad lim_(y arrow.b 0) y uE (1 / X ; X > y) = 0. $
]
#pf[
  $
    y uE(1/X\; X > y)
    &<= y uE(1/y\;X > y)\
    &<= y dot 1 / y dot P(X > y)\
    &<= P(X > y) -> 0 quad (y -> oo).
  $ 另一方面，对 $forall epsilon > y$，有 $
    y uE(1/X\;X > y)
    &= uE(y / X\;y < X < epsilon) + uE(y/X\;X >= epsilon)\
    &<= P(y < X < epsilon) + uE(y/X\;X >= epsilon).
  $ 令 $y -> 0$，由有界收敛定理知道 $uE(y\/X\;X >= epsilon) -> 0$；再令 $epsilon -> 0$，得到 $P(y < X < epsilon) -> 0$，从而得到不等式的右侧均收敛于 $0$。
]

#ex[
  If $X_n gt.eq 0$ then $ uE (sum_(n = 0)^oo X_n) = sum_(n = 0)^oo uE X_n. $
]
#pf[
  令 $Y_n = sum_(i=0)^n X_n$，那么 $Y_n arrow.t Y = sum_(i=0)^oo X_n$，只要证明 $
    uE(Y) = lim uE (Y_n),
  $ 这可以显然由单调收敛定理得出。
]

#ex[
  If $X$ is integrable and $A_n$ are disjoint sets with union $A$ then
  $ sum_(n = 0)^oo uE (X ; A_n) = uE (X ; A) quad "i.e. ," $ the sum converges
  absolutely and has the value on the right.
]
#pf[
  对 $X^+ 1_A_n$ 和 $X^- 1_A_n$ 分别使用上一题的结论，然后相减（因为 $X$ 可积所以可以相减）直接得出。
]

== 乘积测度和 Fubini 定理

#ex[
  If $
  integral_X integral_Y lr(|f (x , y)|) mu_2 (dd(y)) mu_1 (dd(x)) < oo
  $
  then
  $
    integral_X integral_Y f (x , y) mu_2 (dd(y)) mu_1 (dd(x)) = integral_(X times Y) f med dd((mu_1 times mu_2)) = integral_Y integral_X f (x , y) mu_1 (dd(x)) mu_2 (dd(y)).
  $

  / Corollary: Let $X = { 1 , 2 , dots.h }$, $scr(A) =$ all subsets of $X$, and $mu_1 =$ counting measure. If $
  sum_n integral lr(|f_n|) dd(mu) < oo
  $ then $
  sum_n integral f_n dd(mu) = integral sum_n f_n dd(mu).
  $
]
#pf[
  因为 $|f| >= 0$，所以直接对 $|f|$ 用 Fubini 定理知道 $
    integral_X integral_Y |f(x, y)| mu_2 (dd(y))mu_1(dd(x)) = integral_(X times Y) |f(x, y)|dd((mu_1 times mu_2)) < oo,
  $ 从而 $f$ 满足 Fubini 定理条件，再对 $f$ 用 Fubini 定理直接得到结论。
]

#ex[
  Let $g gt.eq 0$ be a measurable function on $(X , scr(A) , mu)$. Use
  Theorem 1.7.2 to conclude that
  $
    integral_X g med dd(mu) = (mu times lambda) ({ (x , y) : 0 lt.eq y < g (x) }) = integral_0^oo mu ({ x : g (x) > y }) dd(y).
  $
]
#pf[
  注意到 $f(x, y) = 1_{g(x) > y} >= 0$ 符合 Fubini 定理条件，从而有 $
    integral_X integral_0^oo 1_{g(x) > y} dd(lambda, mu) = integral_(X times [0, oo)) 1_{g(x) > y} dd((mu times lambda)) = integral_0^oo integral_X 1_{g(x) > y} dd(mu, lambda).
  $ 容易验证这就是要证的等式。
]

#ex[
  Let $F , G$ be Stieltjes measure functions and let $mu , nu$ be the
  corresponding measures on $(bb(R) , scr(R))$. Show that
  + $
      integral_(\( a , b \]) { F (y) - F (a) } dd(G) (y) = (mu times nu) ({ (x , y) : a < x lt.eq y lt.eq b });
    $
  + $
      integral_(\( a , b \]) F (y) dd(G) (y) + integral_(\( a , b \]) G (y) dd(F) (y)\
      = F (b) G (b) - F (a) G (a) + sum_(x in \( a , b \]) mu ({ x }) nu ({ x });
    $
  + If $F = G$ is continuous then $
  integral_(\( a , b \]) 2 F (y) dd(F) (y) = F^2 (b) - F^2 (a).
  $
  To see the second term in (2) is needed, let
  $F (x) = G (x) = 1_(\[ 0 , oo \)) (x)$ and $a < 0 < b$.
]
#pf[
  + 注意到 $f(x, y) = 1_{x <= y} >= 0$ 符合 Fubini 定理条件，从而有 $
    integral_((a, b]) integral_((a, b]) 1_{x <= y} dd(F, G) = integral_((a, b]^2) 1_{x <= y} dd((mu times nu)),
  $ 也即欲证的等式。
  + 由于 $F, G$ 是 Stieltjes 测度函数，所以 $F, G$ 均只在至多可数个点处不连续，所以 $
    sum_(x in (a, b]) mu({x})nu({x})
  $ 为至多可数个点相加，从而有意义。设 $F, G$ 分别对应定义在 $(Omega, sF, gamma)$ 上的随机变量 $X, Y$。设 $F, G$ 在 $(a, b]$ 上共同的不连续点集为 $A$，那么在 $(a, b] \\ A$ 上有 $
    integral_((a, b] \\ A) F dd(G) + integral_((a, b] \\ A) G dd(F) = integral_((a, b] \\ A) dd((F G)).
  $ 再考虑在 $A$ 上的积分情况。有 $
    integral_A F dd(G)
    &= integral_(G^(-1)(A)) F circ G dd(gamma)\
    &= sum_(omega in G^(-1)(A)) gamma({omega}) dot F circ G (omega)\
    &= sum_(x in A) nu({x}) dot mu({x}).
  $ 同理对 $integral_A G dd(F)$ 得到相同的结果。那么相加就得到所求结论。
  + 因为 $F=G$ 连续所以它们 Riemann 可积，那么直接应用 Riemann 积分结论直接得出。
]

#ex[
  Let $mu$ be a finite measure on $bb(R)$ and
  $F (x) = mu \( (- oo , x \])$. Show that
  $ integral (F (x + c) - F (x)) dd(x) = c mu (bb(R)). $
]
#pf[
  注意到 $1_{x < y <= x + c} >= 0$ 满足 Fubini 定理的条件，从而直接应用 Fubini 定理得到 $
    integral_RR integral_RR 1_{x < y <= x + c} mu(dd(y)) lambda(dd(x)) = integral_RR integral_RR 1_{x < y <= x + c} lambda(dd(x)) mu(dd(y)),
  $ 其中 $lambda$ 为 $(R, sR)$ 上的 Lebesgue 测度。上式中 $
    LHS
    &= integral_RR integral_((x, x + c]) dd(F) lambda(dd(x))\
    &= integral_RR (F(x + c) - F(x)) dd(x),\
    RHS
    &= integral_RR integral_([y-c, y)) dd(x) mu(dd(y))\
    &= c integral_RR mu(dd(y))\
    &= c integral_RR dd(F)\
    &= c mu(RR).
  $
]

#ex[
  Show that $e^(- x y) sin x$ is integrable in the strip
  $0 < x < a , 0 < y$. Perform the double - integral in the two orders to
  get:
  $
    integral_0^a frac(sin x, x) dd(x) = arctan (a) - (cos a) integral_0^oo frac(e^(- a y), 1 + y^2) dd(y) - (sin a) integral_0^oo frac(y e^(- a y), 1 + y^2) dd(y)
  $
  and replace $1 + y^2$ by $1$ to conclude $
  lr(|integral_0^a (sin x) / x dd(x) - arctan (a)|) lt.eq 2 / a
  $ for $a gt.eq 1$.
]
#pf[
  有 $
    integral_0^a integral_0^oo e^(-x y) sin x dd(y, x)
    &= - integral_0^a (sin x) / x integral_0^oo e^(-x y)  dd((-x y), x)\
    &= integral_0^a (sin x) / x dd(x).
  $ 由于 $
    integral_0^a sin x dd(x) "有界", quad 1 / x arrow.b 0,
  $ 由 Dirichlet 判别法知道 $
    integral_0^a sin(x)/x dd(x)
  $ Riemann 可积，从而 Lebesgue 可积。那么可以对 $e^(-x y) sin x$ 使用 Fubini 定理得到 $
    integral_0^a integral_0^oo e^(-x y) sin x dd(y, x)
    &= integral_0^oo integral_0^a e^(-x y) sin x dd(x, y).
  $ 上式中 $
    LHS
    &= integral_0^a (sin x) / x dd(x),\
    RHS
    &= integral_0^oo eval((-e^(-x y) (cos x + y sin x)) / (1 + y^2))_0^a dd(y)\
    &= integral_0^oo (1 / (1 + y^2) - (e^(-a y) cos a) / (1 + y^2) - (e^(-a y) y sin a)/(1 + y^2)) dd(y)
  $ 即为欲证之结论。
]

= 大数定律

== 独立性

#de("独立")[
  + 称*事件 $A, B$ 独立*，如果 $P(A sect B) = P(A)P(B)$。
  + 称*随机变量 $X, Y$ 独立*，如果对 $forall C, D in sR$ 有 $
P(X in C, Y in D) = P(X in C)P(Y in D).
$
  + 称 *$sigma$-域 $sF, sG$ 独立*，如果对 $forall A in sF$ 和 $B in sG$ 事件 $A, B$ 独立。
]

#ex[
  Suppose $(X_1 , dots.h , X_n)$ has density
  $f (x_1 , x_2 , dots.h , x_n)$, that is
  $ P ((X_1 , X_2 , dots.h , X_n) in A) = integral_A f (x) dd(x) med quad "for" med A in scr(R)^n. $
  If $f (x)$ can be written as $g_1 (x_1) dots.h.c g_n (x_n)$ where the
  $g_m gt.eq 0$ are measurable, then $X_1 , X_2 , dots.h , X_n$ are
  independent. Note that the $g_m$ are not assumed to be probability
  densities.
]
#pf[
  对 $Omega = Omega_1 times ... times Omega_n$ 中的一个长方体 $A = A_1 times ... times A_n$，有 $
    P(X_1 in A_1, ..., X_n in A_n)
    &= integral_(A) f(x_1, ..., x_n) dd(x_1)...dd(x_n)\
    &= integral_(A) product_(i=1)^n g_i (x_i) dd(x_1)...dd(x_n)\
    &= product_(i=1)^n integral_A_ i g_i (x_i) dd(x_i) quad ("Fubini 定理").
  $ 对 $forall k in {1, 2, ..., n}$ 有 $
    P(X_k in A_k)
    &=P(X_1 in Omega_1, ..., X_k in A_k, ..., X_n in Omega_n)\
    &= (integral_A_k g_k (x_k) dd(x_k)) dot product_(i!= k) integral_Omega_i g_i (x_i) dd(x_i).
  $ 又知道 $
    1 = integral_Omega f dd(x_1)...dd(x_n) = product_(i=1)^n integral_Omega_i g_i (x_i) dd(x_i),
  $ 那么 $
    product_(i=1)^n P(X_i in A_i)
    &= (product_(i=1)^n integral_(A_i) g_i (x_i) dd(x_i)) dot (product_(i=1)^n integral_Omega_i g_i (x_i) dd(x_i))^(n-1)\
    &= (product_(i=1)^n integral_(A_i) g_i (x_i) dd(x_i)) dot 1^(n-1)\
    &= product_(i=1)^n integral_(A_i) g_i (x_i) dd(x_i)\
    &= P(X_1 in A_1, ..., X_n in A_n).
  $
]

#ex[
  Suppose $X_1 , dots.h , X_n$ are random variables that take
  values in countable sets $S_1 , dots.h , S_n$. Then in order for
  $X_1 , dots.h , X_n$ to be independent, it is sufficient that whenever
  $x_i in S_i$,
  $ P (X_1 = x_1 , dots.h , X_n = x_n) = product_(i = 1)^n P (X_i = x_i). $
]
#pf[
  令 $sA_i$ 为 $S_i$ 中所有单元素集和 $diameter$ 构成的集合。那么 $sA_i$ 是 $pi$-系，只要证明 $sA_1, sA_2, ..., sA_n$ 独立，那么 $sigma(sA_1), ..., sigma(sA_n)$ 自然互相独立，从而得证。而从题目条件自然得出 $sA_i$ 是独立的。
]

#ex[
  Let $rho (x , y)$ be a metric.
  + Suppose $h$ is differentiable with $h (0) = 0$, $h^prime (x) > 0$ for $x > 0$ and $h^prime (x)$ decreasing on $\[ 0 , oo \)$. Then $h (rho (x , y))$ is a metric.
  + $h (x) = x \/ (x + 1)$ satisfies the hypotheses in (1).
]
#pf[
  + 条件说明 $h$ 为单调增的凹函数。$forall x, y, z$，只要证明 $
    h(rho(x, y)) + h(rho(y, z)) >= h(rho(x, z)).
  $ 这是因为 $
    h(rho(x, y)) + h(rho(y, z))
    &>= h(rho(x, y) + rho(y, z))\
    &>= h(rho(x, z)).
  $
  + 直接验证即可。
]

#ex[
  Let $Omega = (0 , 1)$, $scr(F) =$ Borel sets, $P =$ Lebesgue
  measure. Then $
  X_n (omega) = sin (2 pi n omega) , quad n = 1 , 2 , dots.h
  $ are
  uncorrelated but not independent.
]
#pf[
  对 $forall n, m in NN^+$ 且 $n != m$ 有 $
    uE X_n &= integral_0^1 sin(2 pi n x) dd(x) = 0,\
    uE X_m &= 0,\
    uE X_n X_m &= integral_0^1 sin(2 pi n x) sin(2 pi m x) dd(x)\
    &= integral_0^1 (cos(2pi(n-m)x) + cos(2pi(n+m)x))/2 dd(x) = 0.
  $ 所以有 $uE X_n X_m = uE X_n uE X_m$，从而它们无关。但是又考虑 $X_2, X_3$ 在 $A = (0, 1 \/ 3)$ 上的期望有 $
    uE(X_2\; A) &= 3/(8 pi),\
    uE(X_3\; A) &= 0,\
    uE(X_2 X_3\; A) &= (3 sqrt(3)) / (20 pi),
  $ 从而它们无关。
]

#ex[
  + Show that if $X$ and $Y$ are independent with distributions $mu$ and $nu$ then $ P (X + Y = 0) = sum_y mu ({ - y }) nu ({ y }). $
  + Conclude that if $X$ has continuous distribution $P (X = Y) = 0$.
]
#pf[
  + $
      P(X + Y = 0)
      &= integral.double 1_{X + Y = 0} mu(dd(x)) nu(dd(y))\
      &= integral mu({-y}) nu(dd(y))\
      &= sum_y mu({-y}) nu({y}).
    $
  + 与上一问同理可以证明 $
    P(X = Y) = sum_y mu({y}) nu({y}),
  $ 等式右侧只有在 $mu, nu$ 都不为 $0$，即 $X, Y$ 的分布都不连续的地方才不等于 $0$，而这永不成立，因为 $X$ 的分布是连续的。
]

#ex[
  Prove directly from the definition that if $X$ and $Y$ are
  independent and $f$ and $g$ are measurable functions then $f (X)$ and
  $g (Y)$ are independent.
]
#pf[
  对 $forall A, B in sR$，有 $
  P(f(X) in A)P(g(Y) in B)
  &= P(X in f^(-1)(A))P(Y in g^(-1)(B))\
  &= P(X in f^(-1)(A), Y in g^(-1)(B))\
  &= P(f(X) in A, g(Y) in B).
  $
]

#ex[
  Let $K gt.eq 3$ be a prime and let $X$ and $Y$ be independent
  random variables that are uniformly distributed on
  ${ 0 , 1 , dots.h , K - 1 }$. For $0 lt.eq n < K$, let $
  Z_n = X + n Y med mod med K.
  $ Show that
  $Z_0 , Z_1 , dots.h , Z_(K - 1)$ are pairwise independent, i.e., each
  pair is independent. They are not independent because if we know the
  values of two of the variables then we know the values of all the
  variables.
]
#pf[
  由数论相关知识知道对于 $forall 0 <= n < K$ 有 $Z_n = X + n Y = p$ 当且仅当 $Y = q(X)$ 存在 $q(X)$，即此时的 $q$ 是唯一的，所以 $
  P(Z_n = p)
  &= sum_x P(X = x, Y = q(x))\
  &= sum_x P(X = x)P(Y = q(x))\
  &= sum_x 1 / K^2 = 1 / K
  $ 对 $forall p in {0, 1, ..., K - 1}$ 成立。那么对 $forall a, b in {0, 1, ..., K - 1}$ 且 $a != b$，考虑 $Z_a$ 和 $Z_b$ 之间的独立性。有 $
    P(Z_a = p) = P(Z_b = q) = 1 / K, quad P(Z_a = p, Z_b = q) = 1 / K^2
  $ 从而 $Z_a, Z_b$ 独立。
]

#ex[
  Find four random variables taking values in ${ - 1 , 1 }$ so that
  any three are independent but all four are not. Hint: Consider products
  of independent random variables.
]
#pf[
  记 $X, Y, Z, W$ 为满足题意的随机变量，且 $A = {X = 1}, B = {Y=1}, C = {Z=1}, D = {W = 1}, P(A) = a, P(B) = b, P(C) = c, P(D) = d$。以下推导所有符合题意的随机变量。

  设 $P(A sect B sect C sect D) = x$，那么有
  + $
      P(A^c sect B sect C sect D) &= b c d - x;\
    $
  + $
      P(A sect B^c sect C sect D) &= a c d - x,\
      P(A^c sect B^c sect C sect D) &= (1-a) c d - b c d + x;\
    $
  + $
      P(A sect B sect C^c sect D) &= a b d - x,\
      P(A sect B^c sect C^c sect D) &= a(1-b)d - a c d + x,\
      P(A^c sect B sect C sect D) &= (1-a) b d - b c d + x,\
      P(A^c sect B^c sect C sect D) &= (1-a)(1-b)d - (1-a) c d + b c d - x;\
    $
  + 类似推导所有带有 $D^c$ 的情况。这样只要令 $x != a b c d$ 的值即可保证 $
    P(A sect B sect C sect D) = x != a b c d = P(A) P(B) P(C) P(D),
  $ 但是任意三个集合是相互独立的。
]

#ex[
  Let $Omega = { 1 , 2 , 3 , 4 }$, $scr(F) =$ all subsets of
  $Omega$, and $P ({ i }) = 1 \/ 4$. Give an example of two collections of
  sets $scr(A)_1$ and $scr(A)_2$ that are independent but whose generated
  $sigma$-fields are not.
]
#pf[
  令 $sA_1 = {{1, 2}, {1, 3}}, sA_2 = {{2, 3}}$，那么 $
    P({1, 2} sect {2, 3}} = 1 / 2 = P({1, 2}) P({2, 3}),\
    P({1, 3} sect {2, 3}} = 1 / 2 = P({1, 3}) P({2, 3}),
  $ 从而 $sA_1$ 和 $sA_2$ 独立。但是有 ${2, 3} in sigma(sA_1)$，这时 $
    P({2, 3} sect {2, 3}) = P({2, 3}) = 1 / 2 != P({2, 3})^2,
  $ 从而 $sigma(sA_1)$ 和 $sigma(sA_2)$ 不独立。
]

#ex[
  Show that if $X$ and $Y$ are independent, integer-valued
  random variables, then $ P (X + Y = n) = sum_m P (X = m) P (Y = n - m). $
]
#pf[
  因为 $1_{X + Y = n} >= 0$，所以可以直接应用 Fubini 定理，从而有 $
    P(X + Y = n)
    &= integral.double 1_{x + y = n} dd(mu, nu)\
    &= integral (integral 1_{x + y = n} dd(mu))dd(nu)\
    &= integral mu(n - y) dd(nu)\
    &= sum_m mu(n - m) nu(m)\
    &= sum_m P(X = m) P(Y = n - m).
  $
]

#ex[
  In Example 1.6.13, we introduced the Poisson distribution with
  parameter $lambda$, which is given by
  $
    P (Z = k) = (e^(- lambda) lambda^k) / (k !)
  $ for $k = 0 , 1 , 2 , dots.h$.
  Use the previous exercise to show that if
  $X = upright("Poisson")(lambda)$ and $Y = upright("Poisson")(mu)$ are
  independent then $X + Y = upright("Poisson")(lambda + mu)$.
]
#pf[
  $forall n in NN$，则有 $
    P(X + Y = n)
    &= sum_m P(X = m)P(Y = n - m)\
    &= sum_(m=0)^n (e^(-lambda)lambda^m)/(m!)(e^(-mu)mu^(n-m))/((n-m)!)\
    &= e^(-(lambda + mu))sum_(m=0)^n (lambda^m mu^(n-m))/(m! (n-m)!)\
    &= e^(-(lambda + mu))(lambda+mu)^n / n!.
  $ 最后一步利用了二项式定理。
]

#ex[
  $X$ is said to have a $upright("Binomial")(n , p)$ distribution
  if $ P (X = m) = binom(n, m) p^m (1 - p)^(n - m). $
  + Show that if $X = upright("Binomial")(n , p)$ and $Y = upright("Binomial")(m , p)$ are independent then $X + Y = upright("Binomial")(n + m , p)$.
  + Look at Example 1.6.12 and use induction to conclude that the sum of $n$ independent $upright("Bernoulli")(p)$ random variables is $upright("Binomial")(n , p)$.
]
#pf[
  + $
      P(X + Y = x)
      &= sum_(y=0)^x P(X = y)P(Y = x - y)\
      &= sum_(y=0)^x mat(n; y)p^y (1-p)^(n-y) mat(m; x-y)p^(x-y)(1-p)^(m-x+y)\
      &= p^x (1-p)^(n+m-x) sum_(y=0)^x mat(n; y)mat(m; x-y)\
      &= mat(n+m; x)p^x (1-p)^(n+m-x).
    $
  + $n = 1$ 的情况是显然的。对 $n > 1$ 的情况，记 $X = X_1 + ... + X_(n-1)$ 为 $(n-1)$ 个 Bernoulli$(p)$ 分布的随机变量的和，归纳假设 $X$ 服从 $"Binomial"(n - 1, p)$. 设 $X_n$ 也服从 $"Bernoulli"(p)$ 分布，只要证明 $X + X_n$ 服从 $"Binomial"(n, p)$ 分布。有 $
    P(X_n + X = x)
    &= P(X = x)P(X_n = 0) + P(X = x-1)P(X_n=1)\
    &= mat(n-1; x)p^x (1-p)^(n-x-1) (1-p) + mat(n-1; x-1)p^(x-1)(1-p)^(n-x) p\
    &= (mat(n-1; x) + mat(n-1; x-1))p^x (1-p)^(n-x)\
    &= mat(n; x)p^x (1-p)^(n-x).
  $
]

#ex[
  It should not be surprising that the distribution of $X + Y$ can
  be $F * G$ without the random variables being independent. Suppose
  $X , Y in { 0 , 1 , 2 }$ and take each value with probability $1 \/ 3$.
  + Find the distribution of $X + Y$ assuming $X$ and $Y$ are independent.
  + Find all the joint distributions $(X , Y)$ so that the distribution of $X + Y$ is the same as the answer to (1).
]
#pf[
  #show table.cell.where(x: 0): it => strong(it)
  #show table.cell.where(y: 0): it => strong(it)
  #show math.equation.where(block: false): math.display
  + $
      P(X + Y = 0) &= P(X=0)P(Y=0) = 1 / 9,\
      P(X + Y = 1) &= P(X=0)P(Y=1) + P(X = 1)P(Y=0) = 2 / 9,\
      P(X + Y = 2) &= 3 / 9,\
      P(X + Y = 3) &= 2 / 9,\
      P(X + Y = 4) &= 1 / 9.
    $ 分布函数略。
  + 直接设 $P(X = 1, Y = 0) = x <= 2 / 9$，然后根据题意和上一问列方程求解得到 #figure(table(
    columns: 4,
    inset: .7em,
    align: center + horizon,
    $X \\ Y$, $0$, $1$, $2$,
    $0$, $1/9$, $2/9-x$, $x$,
    $1$, $x$, $1/9$, $2/9-x$,
    $2$, $2/9-x$, $x$, $1/9$
  )) 即为所求的所有联合分布。
]

#ex[
  Let $X , Y gt.eq 0$ be independent with distribution functions
  $F$ and $G$. Find the distribution function of $X Y$.
]
#pf[
  有 $
    P(X Y <= p)
    &= integral.double 1_{x y <= p} dd(F, G)\
    &= integral_0^oo integral_0^(p\/y) dd(F, G)\
    &= integral_0^oo F(p/y) dd(G).
  $
]

#ex[
  If we want an infinite sequence of coin tossings, we do not have
  to use Kolmogorov’s theorem. Let $Omega$ be the unit interval $(0 , 1)$
  equipped with the Borel sets $scr(F)$ and Lebesgue measure $P$. Let
  $Y_n (omega) = 1$ if $[2^n omega]$ is odd and $0$ if $[2^n omega]$ is
  even. Show that $Y_1 , Y_2 , dots.h$ are independent with
  $P (Y_k = 0) = P (Y_k = 1) = 1 \/ 2$.
]
#pf[
  $P(Y_k = 0) = 1\/2$ 容易证明。下证明 $Y_1, Y_2, ...$ 独立。对 $forall A in {1, 2, ...}$，其中 $A$ 为有限集，只要证明 ${Y_a : a in A}$ 独立。记 $A = {a_1, ..., a_m}$，其中 $a_1 < ... < a_m$，那么只要证明 $
    P(Y_a_1 = 1, Y_a_2 = 1, ..., Y_a_m = 1)
    = P(Y_a_1 = 1)P(Y_a_2 = 1, ..., Y_a_m = 1),
  $ 然后归纳即可。而 $
    P(Y_a_1 = 1, Y_a_2 = 1, ..., Y_a_m = 1)
    &= 1/2 P(Y_a_1 = 1, Y_a_2 = 1, ..., Y_a_(m-1) = 1)\
    &= 1/2^2 P(Y_a_1 = 1, Y_a_2 = 1, ..., Y_a_(m-2) = 1)\
    &= ...\
    &= 1/2^m,\
    P(Y_a_2 = 1, Y_a_2 = 1, ..., Y_a_m = 1)
    &= 1/2^(m-1),
  $ 那么自然有 $
    P(Y_a_1 = 1, Y_a_2 = 1, ..., Y_a_m = 1)
    &= 1/2 P(Y_a_2 = 1, ..., Y_a_m = 1)\
    &= P(Y_a_1 = 1)P(Y_a_2 = 1, ..., Y_a_m = 1).
  $
]

== 弱大数定律

#ex[
  Let $X_1 , X_2 , dots.h$ be uncorrelated with $uE X_i = mu_i$ and
  $upright("var")(X_i) \/ i arrow.r 0$ as $i arrow.r oo$. Let
  $S_n = X_1 + dots.h + X_n$ and $nu_n = uE S_n \/ n$ then as
  $n arrow.r oo$, $
  S_n / n - nu_n arrow.r 0
  $ in $L^2$ and in probability.
]
#pf[
  $
    uE(S_n / n - uE S_n / n)^2
    &= var S_n / n\
    &= (var S_n) / n^2 \
    &= (sum_i var X_i) / n^2 \
    &<= (sum_i (var X_i) / i) / n.
  $ 令 $n -> oo$ 并用 Stolz 定理知道 $
    uE(S_n / n - uE S_n / n)^2 -> 0,
  $ 从而题目中随机变量 $L^2$ 收敛到 $0$，进而依测度收敛。
]

#ex[
  The $L^2$ weak law generalizes immediately to certain dependent
  sequences. Suppose $uE X_n = 0$ and $uE X_n X_m lt.eq r (n - m)$ for
  $m lt.eq n$ (no absolute value on the left - hand side!) with
  $r (k) arrow.r 0$ as $k arrow.r oo$. Show that
  $
    (X_1 + dots.h + X_n) / n arrow.r 0
  $ in probability.
]
#pf[
  $
    uE((X_1 + ... + X_n)^2/n)
    &= (sum_(i <= j) uE(X_i X_j)) / n^2\
    &<= (sum_(i <= j) r(j - i)) / n^2\
    &<= (n r(0) + (n-1)r(1) + ... + r(n-1)) / n^2\
    &-> (r(0) + r(1) + ... + r(n)) / (2n + 1)\
    &-> r(n) / 2 -> 0 quad (n -> oo).
  $ 其中两次使用了 Stolz 定理。那么它 $L^2$ 收敛，从而依测度收敛。
]

#ex[
  Monte Carlo integration.
  + Let $f$ be a measurable function on $[0 , 1]$ with $
  integral_0^1 lr(|f (x)|) dd(x) < oo.
  $ Let $U_1 , U_2 , dots.h$ be independent and uniformly distributed on $[0 , 1]$, and let $ I_n = n^(- 1) (f (U_1) + dots.h + f (U_n)). $ Show that $
  I_n arrow.r I equiv integral_0^1 f dd(x)
  $ in probability.
  + Suppose $
  integral_0^1 lr(|f (x)|)^2 dd(x) < oo. $ Use Chebyshev’s inequality to estimate $ P (lr(|I_n - I|) > a / n^(1 / 2)). $
]

#ex[
  Let $X_1 , X_2 , dots.h$ be i.i.d. with
  $ P (X_i = (- 1)^k k) = C \/ k^2 log k $ for $k gt.eq 2$ where $C$ is
  chosen to make the sum of the probabilities $= 1$. Show that
  $uE lr(|X_i|) = oo$, but there is a finite constant $mu$ so that
  $S_n \/ n arrow.r mu$ in probability.
]

#ex[
  Let $X_1 , X_2 , dots.h$ be i.i.d. with
  $ P (X_i > x) = e / (x log x) $ for $x gt.eq e$. Show that
  $uE lr(|X_i|) = oo$, but there is a sequence of constants
  $mu_n arrow.r oo$ so that $ S_n / n - mu_n arrow.r 0 $ in probability.
]

#ex[
  + Show that if $X gt.eq 0$ is integer - valued $ uE X = sum_(n gt.eq 1) P (X gt.eq n). $
  + Find a similar expression for $uE X^2$.
]

#ex[
  Generalize Lemma 2.2.13 to conclude that if
  $ H (x) = integral_(\( - oo , x \]) h (y) dd(y) $ with $h (y) gt.eq 0$, then
  $ uE H (X) = integral_(- oo)^oo h (y) P (X gt.eq y) dd(y). $ An important
  special case is $H (x) = exp (theta x)$ with $theta > 0$.
]

#ex[
  An unfair "fair game". Let $ p_k = 1 / 2^k k (k + 1), $
  $k = 1 , 2 , dots.h$ and $p_0 = 1 - sum_(k gt.eq 1) p_k$.
  $ sum_(k = 1)^oo 2^k p_k = (1 - 1 / 2) + (1 / 2 - 1 / 3) + dots.h = 1, $
  so if we let $X_1 , X_2 , dots.h$ be i.i.d. with $P (X_n = - 1) = p_0$
  and $ P (X_n = 2^k - 1) = p_k quad upright("for ") k gt.eq 1 $ then
  $uE X_n = 0$. Let $S_n = X_1 + dots.h + X_n$. Use Theorem 2.2.11 with
  $b_n = 2^(m (n))$ where
  $m (n) = min { m : 2^(- m) m^(- 3 \/ 2) lt.eq n^(- 1) }$ to conclude
  that
  $ S_n / (n \/ log_2 n) arrow.r - 1 quad upright("in probability.") $
]

#ex[
  Weak law for positive variables. Suppose $X_1 , X_2 , dots.h$ are
  i.i.d., $P (0 lt.eq X_i < oo) = 1$ and $P (X_i > x) > 0$ for all $x$.
  Let $ mu (s) = integral_0^s x dd(F(x)) $ and
  $ nu (s) = mu(s) / (s (1 - F (s))). $ It is known that there exist
  constants $a_n$ so that $S_n \/ a_n arrow.r 1$ in probability, if and
  only if $nu (s) arrow.r oo$ as $s arrow.r oo$. Pick $b_n gt.eq 1$ so
  that $n mu (b_n) = b_n$ (this works for large $n$), and use Theorem
  2.2.11 to prove that the condition is sufficient.
]
