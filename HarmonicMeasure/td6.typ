#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD6*
  ]

  #datetime(year: 2025, month: 4, day: 20).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#ex[
  Let $mu$ be a $sigma$-finite measure on a set $X$, and let
  $f in scr(L)_mu^(+)$. Consider the sets
  $
    G_f = { (x , y) in X times [0 , oo] divides y lt.eq f (x) } quad upright("and") quad G_f^prime = { (x , y) in X times [0 , oo] divides y < f (x) } .
  $
  Show that the sets $G_f$ and $G_f^prime$ are measurable with respect to
  the product measure $mu times.circle scr(L)^1$, where $scr(L)^1$ is the
  Lebesgue measure. Deduce that
  $ mu times.circle scr(L)^1 (G_f) = mu times.circle scr(L)^1 (G_f^prime) = integral_X f (x) mu (dd(x)) , $
  and give a geometric interpretation of this result. Give alternative
  expressions for $mu times.circle scr(L)^1 (G_f)$ and
  $mu times.circle scr(L)^1 (G_f^prime)$.
]
#pf[
  Define $F(x, y): X times [0, oo] -> RR, (x, y) |-> f(x) - y$. Since $f in scr(L)_mu^+$, ${F(x, y) > t}$ is $mu times.circle scr(L)^1 (G_f)$ measurable, hence $G_f, G'_f$ are measurable. For second problem, we observe that $ integral_X f(x) mu(dd(x))
  &= integral_X integral_[0, oo] scr(L)(f > y) dd(scr(L))^1 dd(mu) = mu times.circle scr(L)^1(G_f). $
]

#ex[
  Recall that the Lebesgue measure on $bb(R)^N$ is the measure defined for
  any set $A subset.eq bb(R)^N$ by the formula
  $ scr(L)^N (A) = inf {sum_(i = 1)^oo (2 r_i)^N , thin A subset.eq union.big_(i = 1)^oo Q (x_i , r_i)} , $
  where the infimum is over all coverings of $A$ by open cubes
  $Q (x , r) = { y in bb(R)^N divides max_(1 lt.eq i lt.eq N) lr(|x_i - y_i|) < r }$.
  Show that the Lebesgue measure $scr(L)^N$ is translation invariant,
  i.e., for any $x in bb(R)^N$ and any set $A subset.eq bb(R)^N$, we have
  $scr(L)^N (x + A) = scr(L)^N (A)$, where
  $x + A = { x + y divides y in A }$.
]
#pf[
  For $A subset RR^N$, set ${Q(x_i, r_i)}$ such that $A subset union.big_i Q(x_i, r_i)$, then it is easy to inform that $A + x subset union.big_i (Q(x_i, r_i) + x)$, so $sL^N (A) >= sL^N (A + x)$, and the other side of inequality can be proved similarly.
]

#ex[
  Let $A subset.eq bb(R)^N$ and let $f : A arrow.r bb(R)^N$ be a mapping
  such that for some constants $c , alpha > 0$, and for all $x , y in A$,
  $ lr(|f (x) - f (y)|) lt.eq c lr(|x - y|)^alpha . $ Show that for all
  $s gt.eq 0$, we have
  $scr(H)^(s \/ alpha) (f (A)) lt.eq c^(s \/ alpha) scr(H)^s (A)$, where
  $scr(H)^s$ is the $s$-dimensional Hausdorff measure. In particular, if
  $f$ is Lipschitz continuous (i.e., $alpha = 1$), then
  $scr(H)^s (f (A)) lt.eq c^s scr(H)^s (A)$. What can you deduce about
  Hausdorff dimensions? Finally, consider the special case of a similarity
  transformation of scale factor $lambda > 0$, i.e., an invertible mapping
  $f : bb(R)^N arrow.r bb(R)^N$ such that
  $lr(|f (x) - f (y)|) = lambda lr(|x - y|)$.
]
#pf[
  Set $delta in (0, oo]$, prove $sH^(s\/alpha)_delta (f(A)) <= c^(s\/alpha)sH^s_delta (A)$ then let $delta -> 0$. $forall epsilon > 0$, set ${A_i}$ s.t. $|A_i| <= delta$, $A subset union.big A_i$ and $sum_i |A_i|^s <= sH^s_delta (A) + epsilon$. Then $f(A) subset union.big f(A_i)$, and $ sum_i |f(A_i)|^(s \/ alpha) <= c^(s \/ alpha) sum_i |A_i|^s <= c^(s \/ alpha) sH^s_delta (A) + epsilon, $ and the result follows according to the arbitrariness of $epsilon$.
]

#ex[
  Let $C$ be the middle-third Cantor set $inter.big_n C_n$, where
  $C_0 = [0 , 1]$ and $C_(n + 1)$ is obtained from $C_n$ as follows: split
  each interval of $C_n$ into three equal parts and remove the open middle
  third.

  + Show that $C$ is compact, uncountable, and of Lebesgue measure zero.
  + Show that $C$ has Hausdorff dimension $log 2 \/ log 3$.
]
#pf[
  + Since $C_n$ is closed for $n >= 1$, then $C = inter.big_n C_n$ is closed, hence compact. For any $x in C$, set $a_n$ be the part of $C_n$ $x$ is in (left for $0$ and right for $1$), then $0.a_1a_2a_3...$ constructs a biject between $x$ and $[0, 1]$. Since $sL(C_n) = (2\/3)^n$ we can know $sL(C) = 0$.
  +
]

#ex[
  Consider $C$ and $C_n$ as above. Define piecewise linear functions $f_n : [0 , 1] arrow.r bb(R)$ and linear functionals $I_n$ on $C_c ((0 , 1))$ by $ f_n (x) = integral_0^x (3 \/ 2)^n bold(1)_(C_n) (t) d t quad upright("and") quad I_n (phi.alt) = integral_0^1 (3 \/ 2)^n bold(1)_(C_n) (t) phi.alt (t) d t . $
  + Show that $(f_n)_(n gt.eq 0)$ is a Cauchy sequence in $C ([0 , 1])$ with the uniform norm. Deduce that this sequence converges to a continuous and monotone function $psi$. The function $psi$ is called the Cantor-Vitali function.
  + Show that the sequence $(I_n (phi.alt))_(n gt.eq 0)$ converges to $- integral_0^1 psi (t) phi.alt^prime (t) d t$ for any $C^1$-function $phi.alt$ with support contained in $(0 , 1)$.
  + Deduce that the mapping $phi.alt arrow.r.bar - integral_0^1 psi (t) phi.alt^prime (t) d t$ extends as a linear functional on $C_c ((0 , 1))$, representable by $phi.alt arrow.r.bar integral_([0 , 1]) phi.alt d mu$ for some Radon measure $mu$ on $[0 , 1]$.
  + Show that $mu$ is the weak limit of the measures $mu_n = (3 \/ 2)^n scr(L)^1 \|_(C_n)$.
  + Show that $"supp" mu subset.eq C$. Deduce that $mu$ is singular with respect to the Lebesgue measure.
  + Show that the sequence $(f_n)_(n in bb(N))$ is equicontinuous. Deduce that $mu$ has no atoms.
]
