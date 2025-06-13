#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD5*
  ]

  #datetime(year: 2025, month: 4, day: 19).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#ex[
  Let $X$ be a set and $A subset.eq X$. Two sets $E , F subset.eq X$ are
  said to be #emph[separated by] $A$ if $E subset.eq A$ and
  $F subset.eq X \\ A$, or if $F subset.eq A$ and $E subset.eq X \\ A$.
  Let $mu$ be a measure on $X$.

  + Show that $A$ is $mu$-measurable if and only if for all sets $E , F subset.eq X$ separated by $A$, we have $mu (E union F) = mu (E) + mu (F)$.
  + Show that $A$ is $mu$-measurable if for all sets $E , F subset.eq X$ separated by $A$ and such that $mu (E)$ and $mu (F)$ are finite, we have $mu (E union F) gt.eq mu (E) + mu (F)$.
  + Give an example of a measure $mu$ on $X$ such that all subsets of $X$ are $mu$-measurable.
]
#pf[
  + $m(E union F) = mu((E union F) inter A) + mu((E union F) inter A^c) = mu(E) + mu(F)$.
  + Since $mu(E) + mu(F) <= mu(E union F)$ we can confirm.
  + $mu(A) = 0$ for all $A subset X$.
]

#ex[
  Let $X$ be a set. A #emph[premeasure] on $X$ is a function
  $tau : scr(C) arrow.r [0 , oo]$ defined on a collection $scr(C)$ of
  subsets of $X$, such that $diameter in scr(C)$ and $tau (diameter) = 0$.
  For any set $A subset.eq X$, define
  $ mu (A) = inf {sum_(i = 1)^oo tau (C_i) divides C_i in scr(C) , med A subset.eq union.big_(i = 1)^oo C_i} . $

  + Show that $mu$ is a measure on $X$.
  + Show that any measure $nu$ on $X$ is also a premeasure on $X$. Show that the measure $mu$ constructed as above from the premeasure $nu$ equals $nu$.
]
#pf[
  + Only prove the subadditivity. Set sequence ${A_i subset X}$ and $epsilon > 0$. Pick ${C_(i, j)}$ such that $ sum_j tau(C_(i, j)) <= mu(A_i) + epsilon / 2^(i) $ holds for all $i$. Then $ sum_(i, j) tau(C_(i, j)) <= sum_i mu(A_i) + epsilon, quad "for all" epsilon > 0, $ hence $ sum_(i, j) tau(C_(i, j)) <= sum_i mu(A_i). $ Since $ union.big_i A_i subset union.big_(i, j) C_(i, j) $ the result follows.
  + Former is trivial, only prove latter.
  $
    mu (A) <= inf {sum_(i = 1)^oo tau (C_i) divides C_i in scr(C) , med A subset.eq union.big_(i = 1)^oo C_i}
  $ is trivial according to monotonicity, and other side is also easy to reach, only need to set ${C_i} = {A, diameter, diameter, ...}$.
]

#ex[
  Let $nu : scr(A) arrow.r [0 , oo]$ be a countably additive set function
  such that $nu (diameter) = 0$, where $scr(A)$ is a $sigma$-algebra on
  $X$.

  + Show that $nu$ is a premeasure on $X$. Let $mu$ be the measure constructed as in Exercise 2 from the premeasure $nu$. Show that for any subset $A$ of $X$, we have: $ mu (A) = inf { nu (B) divides B in scr(A) , med B supset.eq A } . $
  + Deduce that all sets in $scr(A)$ are $mu$-measurable and that $mu (A) = nu (A)$ for all $A in scr(A)$.
  + Show that $mu$ is a regular measure on $X$, meaning that for any set $A subset.eq X$, there exists a set $B in scr(M)_mu$ such that $B supset.eq A$ and $mu (B) = mu (A)$.
]
#pf[
  + Former is trivial, only prove latter. Apparently, for all $B in sA$ there exists ${B_i in sA}$ such that $B = union.big_i B_i$, and the result follows.
  + Omit.
  + For $A subset X$, set ${B_i in sA}$ such that $nu(B_i) arrow.b mu(A)$, then it is easy to deduce that $ sA in.rev B = union.big_i B_i supset A quad "and" quad mu(B) = mu(A). $
]

#ex[
  Show that if a function $f : bb(R) arrow.r bb(R)$ is monotone, then it
  is Borel-measurable.
]
#pf[
  Only need to prove ${f > t}$ is Borel-measurable for $t in RR$. Set $x = sup{x | f(x) <= t}$, then ${f > t}$ is either $[x, oo)$ or $(x, oo)$, which depends on $f(x)$.
]

#ex[
  Let $mu$ be a measure on a set $X$, and $f_n , g_n , f , g in L_mu^1$.

  + Assume the following three properties: #[
      - $mu$-almost everywhere, $f_n arrow.r f$ and $g_n arrow.r g$ as $n arrow.r oo$
      - $lr(|f_n|) lt.eq g_n$ for all $n gt.eq 1$
      - $integral_X g_n dd(mu) arrow.r integral_X g dd(mu)$ as $n arrow.r oo$
    ] Show that $integral_X f_n dd(mu) arrow.r integral_X f dd(mu)$ as $n arrow.r oo$.
  + Assume that $mu$-almost everywhere, $f_n arrow.r f$ as $n arrow.r oo$. Show that $ integral_X lr(|f_n - f|) dd(mu) arrow.r 0 quad upright("as ") n arrow.r oo $ if and only if $ integral_X lr(|f_n|) dd(mu) arrow.r integral_X lr(|f|) dd(mu) quad upright("as ") n arrow.r oo . $
]
#pf[
  + $
      integral_X (g_n + g) dd(mu)
      &= integral_X liminf (g_n + g - |f_n - f|) dd(mu)\
      &<= liminf integral_X (g_n + g - |f_n - f|) dd(mu)\
      &= integral_X (g_n + g) dd(mu) - limsup integral_X |f_n - f| dd(mu).
    $
  + $==>$ $|f_n - f| >= abs(|f_n| - |f|)$. $<==$ Set $g_n = |f_n| + |f|$ and use previous result.
]

#ex[
  Interpret the monotone convergence theorem, Fatou’s lemma, and the
  dominated convergence theorem in the context of the counting measure on
  $bb(N)$, and deduce the corresponding statements about series.
]
#pf[
  Monotone convergence theorem: consider ${a_(i, j) in RR}$ such that $sum_j a_(i, j) < oo$ for all $i >= 1$ and $a_(i, j) <= a_(i + 1, j)$ for all $j$, then $ sum_(j) a_(i, j) arrow.t_i sum_j lim_i a_(i, j). $

  Fatou's lemma and dominated convergence theorem can be similar sentenced.
]

#ex[
  Let $mu$ be the Lebesgue measure on $X = [0 , 1]$, let $nu$ be the
  counting measure on $X$, and let $D = { (x , x) divides x in X }$ be the
  diagonal in $X times X$. Show that the three integrals
  $
    integral_X (integral_X bold(1)_D (x , y) dd(nu(y))) dd(mu(x)) , quad integral_X (integral_X bold(1)_D (x , y) dd(mu(x))) dd(nu(y)) , quad upright("and") quad integral_(X times X) bold(1)_D dd((mu times nu))
  $
  are all unequal.
]
#pf[
  $
    integral_X (integral_X bold(1)_D (x , y) dd(nu(y))) dd(mu(x))
    = integral_X 1 dd(mu(x))
    = 1,\
    integral_X (integral_X 1_D (x, y) dd(mu(x)))dd(nu(y))
    = integral_X 0 dd(nu(y)) = 0,\
    integral_(X times X) 1_D dd((mu times nu)) = oo.
  $
]
