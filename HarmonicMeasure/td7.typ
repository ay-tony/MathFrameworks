#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD7*
  ]

  #datetime(year: 2025, month: 5, day: 11).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#ex[
  Let $Omega subset bb(R)^d$ be an open set and
  $f : Omega arrow.r overline(bb(R))$. Show that

  + $f$ is continuous iff it is usc and lsc.
  + $f$ is lsc iff for all $x in Omega$ and all $epsilon > 0$, there
    exists $eta > 0$ such that
    $ ||x - y|| < eta arrow.r.double.long f (x) - f (y) < epsilon . $
  + $f$ is usc iff for all $x in Omega$ and all $epsilon > 0$, there
    exists $eta > 0$ such that
    $ ||x - y|| < eta arrow.r.double.long f (x) - f (y) > - epsilon . $
  + $f$ is lsc iff the epigraph ${ (x , t) divides t gt.eq f (x) }$ is
    closed in $Omega times bb(R)$.
  + $f$ is usc iff the hypograph ${ (x , t) divides t lt.eq f (x) }$ is
    closed in $Omega times bb(R)$.
  + If $f$ is lsc on a compact set, then there exists an increasing
    sequence of continuous functions $(phi_j)$ converging to $f$.
  + If $f$ is usc on a compact set, then there exists a decreasing
    sequence of continuous functions $(phi_j)$ converging to $f$.
]
#pf[
  + $ f(x) = lim_(y->x)f(y) <==> f(x) <= liminf_(y->x) f(y) <= limsup_(y->x)f(y) <= f(x). $
  + Just apply the definition of $liminf_(y->x)f(y)$.
  + Omit.
  + Pick a sequence ${(x_n, t_n)} -> (x, t)$ such that $t_n >= f(x_n)$ holds for all $n$, we need to prove $t >= f(x)$. It is because $t = lim t_n >= liminf f(x_n) >=^"lsc"f(x)$.
  + Omit.
  + $
      liminf_(y -> x) f(y) >= liminf_(y->x) phi_j (y) = lim_(y->x) phi_j (y) = phi_j (x)
    $ holds for all $j in NN^+$, hence $liminf_(y->x) f(y) >= f(x)$.
  + Omit.
]

#ex[
  Show that the collection of usc and the collection of lsc functions on
  an open set $Omega$ are stable by addition and by multiplication by a
  positive scalar.
]
#pf[
  Suppose $u, v$ are lsc on domain $Omega$. Then $ liminf_(y->x) (u(y) + v(y)) >= liminf u(y) + liminf v(y) >= u(x) + v(x). $ Let $c > 0$ and $ liminf_(y->x) c u(y) = c liminf_(y->x) u(y) >= c u(x). $ Cases of usc are similar.
]

#ex[
  Let $A subset bb(R)^d$ and $bb(1)_A$ its characteristic
  function.

  + $bb(1)_A$ is lsc if and only if $A$ is open.
  + $bb(1)_A$ is usc if and only if $A$ is closed.
]
#pf[
  Only prove 1.

  $forall x in A, 1 >= liminf_(y -> x) bb(1)_A (y) >= bb(1)_A (x) = 1 <==> y in A, forall y in B(x, delta)$.
]

#ex[
  Let $mu$ be a non-negative regular positive measure on $bb(R)^d$ and
  $f in L^1 (mu)$. Then
  $
    integral_(diff Omega) f thin dd(mu) = inf {integral_(diff Omega) h thin dd(mu) #scale(x: 180%, y: 200%)[\|] h upright("lsc on") diff Omega , thin f lt.eq h}
  $
  and
  $
    integral_(diff Omega) f thin dd(mu) = sup {integral_(diff Omega) h thin dd(mu) #scale(x: 180%, y: 180%)[\|] h upright("usc on") diff Omega , thin f gt.eq h} .
  $
]

#ex[
  If $u$ and $v$ are superharmonic in the domain $Omega subset bb(R)^d$
  and $u (x) = v (x)$ for almost every $x in Omega$, then $u$ and $v$ are
  identically equal in $Omega$. Same if $u , v$ are subharmonic.
]
#pf[
  Suppose not, and we omit the cases that functions reach $pm oo$. Pick $x_0 in Omega$ s.t. $u(x_0) != v(x_0)$. Without lost of generality, we can assume that $u(x_0) > v(x_0)$. Set $m$ such that $v(x_0) < m < u(x_0)$. Since $u, v$ are lsc and $u = v$ a.e., $A = {x | u(x) >= m}, B = {x | v(x) >= m}$ are closed, and $lambda(A Delta B) = 0$. Observed that $x_0 in A$, we can deduce that there exists ${x_n in A inter B}$ s.t. $x_n -> x_0$, then $x_0 in B$, which causes a contradiction.
]

#ex[
  Suppose that $u$ is lower-semicontinuous in the domain
  $Omega subset bb(R)^d$. Then the following are equivalent:

  + $u$ is superharmonic in $Omega$.
  + For every $B (x_0 , r) subset Omega$ and every $v$ harmonic in
    $B (x_0 , r)$,
    $
      liminf_(B (x_0 , r) in.rev y arrow.r x) (u (y) - v (y)) gt.eq 0 quad forall x in diff B (x_0 , r) arrow.r.double.long u gt.eq v upright(" in ") B (x_0 , r) .
    $

  Give the analogous assertion for subharmonic functions.
]
#pf[
  $1 ==> 2$. Suppose $u$ superharmonic. Set $B(x_0, r) subset Omega$ and $v$ harmonic in $B(x_0, r)$, then $u - v$ is superharmonic in $B(x_0, r)$. Thus $u - v >= 0$ can be deduced according to the Maximum Principle of superharmonic function.

  $2 ==> 1$. Set $B(x, r) subset Omega$, our goal is to prove $u(x) >= integral.dash_(partial B(x, r))u(y) dd(y)$. Since $u$ is lsc, there exists a sequence of continuous function defined on $partial B$ such that $f_n arrow.t eval(u)_(partial B)$. Thus $ v_n = "PI"(f_n, B) arrow.t "PI"(eval(u)_(partial B), B) = v quad "for all" n, $ where $"PI"$ stands for Possion Integral. Since $v_n$ are harmonic for all $n$, $v$ is either harmonic or explicitly $+oo$. $u, v_n$ suit the condition, and $u >= v_n$ in $B(x, r)$ holds for all $n$. So $u >= v$ in $B(x, r)$. Hence $ u(x) >= v(x) = integral.dash_(partial B(x, r)) v(y) dd(y) = integral.dash_(partial B(x, r)) u(y) dd(y) $ and the result follows.
]

#ex[
  Prove the equality
  $
    integral.dash_(B (x , r)) f (y) thin dd(y) = d / r^d integral_0^r (integral.dash_(diff B (x , s)) f (zeta) thin dd(sigma (zeta))) s^(d - 1) thin dd(s) ,
  $
  for $f$ measurable and positive in $bb(R)^d$.
]
#pf[
  Set $y = zeta s$, where $s in (0, r)$ and $zeta in partial B(x, s)$. Then $dd(y) = s^(d-1)dd(sigma(zeta), s)$. Then $ &integral.dash_(B (x , r)) f (y) thin dd(y) \
  &= d / (kappa_d r^d) integral_B(x, r) f(y) dd(y)\
  &= d / (kappa_d r^d) integral_0^r (integral_(diff B (x , s)) f (zeta) thin dd(sigma (zeta))) s^(d - 1) thin dd(s)\
  &= d / r^d integral_0^r (integral.dash_(diff B (x , s)) f (zeta) thin dd(sigma (zeta))) s^(d - 1) thin dd(s) , $ where $kappa_d$ stands for the measure of surface of unit ball in $RR^d$.
]

#ex[
  Suppose that $u$ is lower-semicontinuous in the domain
  $Omega subset bb(R)^d$. Then $u$ is superharmonic in $Omega$ if and only
  if, for every $x in Omega$ and all $r < d (x , diff Omega)$,
  $ integral.dash_(diff B (x , r)) u (zeta) thin dd(sigma (zeta)) lt.eq u (x) . $
]
#pf[
  First prove sufficiency, i.e. to prove $u$ is superharmonic. It is relatively trivial since $ &integral.dash_(B(x, r)) u(zeta) dd(sigma(zeta)) \
  &= d / r^d integral_0^r (integral.dash_(partial B(x, s)) f(zeta) dd(sigma(zeta))) s^(d-1) dd(s)\
  &<= u(x) dot d / r^d integral_0^r s^(d-1) dd(s)\
  &= u(x). $

  Second prove necessity. Assume $u$ be superharmonic. Suppose not, i.e. there exists $x_0 in Omega$ and $B(x_0, r_0) subset Omega$ such that $ integral.dash_(partial B(x_0, r_0)) u(zeta) dd(sigma(zeta)) > u(x_0). $ Set function $ v(x) = cases(
    "PI"(u, B(x_0, r_0))(x)\, quad & x in B(x_0, r_0),
    u(x)\, & "otherwise in" Omega,
  ) $ where $"PI"(u, B(x_0, r_0))(x)$ stands for Possion Integral of $u$ over $B(x_0, r_0)$. Hence v is a harmonic lift of $u$, and is superharmonic in $Omega$, and harmonic in $B(x_0, r_0)$. Thus $ v(x_0) = integral.dash_(B(x_0, r_0)) v(zeta) dd(zeta)
  <= integral.dash_(B(x_0, r_0)) u(zeta) dd(zeta)
  <= u(x_0)
  < integral.dash_(partial B(x_0, r_0)) u(zeta) dd(sigma(zeta))\
  = integral.dash_(partial B(x_0, r_0)) v(zeta) dd(sigma(zeta)), $ For all $r > r_0$, we have $ v(x_0)
  &>= integral.dash_(B(x_0, r))v(zeta) dd(zeta)\
  &= d / r^d integral_0^r s^(d-1) (integral.dash_(partial B(x_0, s)) v(zeta) dd(sigma(zeta))) dd(s)\
  &= d / r^d integral_(r_0)^r s^(d-1) (integral.dash_(partial B(x_0, s)) v(zeta) dd(sigma(zeta))) dd(s) quad "(since" v "is harmonic in" B(x_0, r_0) ")". $ Let $ phi(r) = d / r^d integral_(r_0)^r s^(d-1) (integral.dash_(partial B(x_0, s)) v(zeta) dd(sigma(zeta))) dd(s), $ and it is easy to observe that $phi(r)$ is continuous, and $phi(r_0) = 0, phi'(r_0) < 0$. Hence there exists $r$, which is very near to $r_0$, such that $phi(r_0) < 0$, and $ v(x_0)
  &> d / r^d integral_(r_0)^r s^(d-1) v(x_0) dd(s) = v(x_0), $ which causes contradiction.
]
