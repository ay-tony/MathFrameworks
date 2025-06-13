#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD8*
  ]

  #datetime(year: 2025, month: 5, day: 16).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#ex[
  If $u$ is subharmonic in a domain $Omega subset bb(R)^d$ and $c > 0$,
  then $u_(+) = max { u , 0 }$ and $e^(c u)$ are subharmonic in $Omega$.
  What is the analogue for superharmonic functions?
]
#pf[
  Since $u$ subharmonic, $0$ subharmonic, $u_+$ is subharmonic, and $c u$ is subharmonic. According to the continuity of $exp$, $e^(c u)$ is lsc, which is same as $c u$. Thus $ exp(c u(x)) <= exp(c integral.dash_(B(x, r)) u(y) dd(y)) <= integral.dash_(B(x, r)) exp(c u(y)) dd(y). $

  Analogue is for superharmonic function $u$ and $c > 0$, $u^-$ and $log(c u)$ are superharmonic.
]

#ex[
  Let $Omega$ be a domain in $bb(R)^d$ and $u in C^2 (Omega)$.

  1. Using Green’s formula, show that
  $
    integral_(B (x , r)) Delta u (x) thin upright(d) x = frac(d pi^(d / 2), Gamma (d / 2 + 1)) r^(d - 1) eval(frac(upright(d), upright(d) s))_(s = r) integral.dash_(diff B (x , s)) u (zeta) thin upright(d) sigma (zeta) .
  $
  2. Show that $u$ is superharmonic if and only if $Delta u lt.eq 0$ on $Omega$.
]
#pf[
  + $
      integral_(B (x , r)) Delta u (x) thin upright(d) x
      &= integral_(partial B(x , r)) nabla u (x) dot nu thin upright(d) sigma(x)\
      &= r^(d-1) integral_(partial B(0, 1)) nabla u(x + zeta r) dot zeta thin upright(d) sigma(zeta)\
      &= r^(d-1) integral_(partial B(0, 1)) nabla u(x + zeta r) dot zeta thin upright(d) sigma(zeta)\
      &= r^(d-1) eval(dv(, s))_(s=r) integral_(partial B(0, 1)) u(x + zeta s) thin upright(d) sigma(zeta)\
      &= frac(d pi^(d / 2), Gamma (d / 2 + 1)) r^(d - 1) eval(frac(upright(d), upright(d) s))_(s = r) integral.dash_(diff B (x , s)) u (zeta) thin upright(d) sigma (zeta) .
    $
  + $<==$ Suppose $Delta u <= 0$ on $Omega$. Then for any $B(x, r) subset Omega$, $ 0 >= integral_(B (x , r)) Delta u (x) thin upright(d) x
    &= frac(d pi^(d / 2), Gamma (d / 2 + 1)) r^(d - 1) eval(frac(upright(d), upright(d) s))_(s = r) integral.dash_(diff B (x , s)) u (zeta) thin upright(d) sigma (zeta) . $ i.e. $ eval(frac(upright(d), upright(d) s))_(s = r) integral.dash_(diff B (x , s)) u (zeta) thin upright(d) sigma (zeta) <= 0, $ so $ integral.dash_(diff B (x , r)) u (zeta) thin upright(d) sigma (zeta) <= lim_(r -> 0^+) integral.dash_(partial B(x, r))u(zeta) dd(sigma(zeta)) = u(x), $ Hence $ integral.dash_B(x, r) u(zeta) dd(zeta) <= u(x) $ holds for all $B(x, r) in Omega$. \ $==>$ Since $ integral.dash_(partial B(x, s)) u(zeta) dd(sigma(zeta)) <= u(x), $ then $ integral_B(x, r) Delta u(x) dd(x) <= 0 $ holds for all $B(x, r) in Omega$, hence $Delta u <= 0$ in $Omega$.
]

#ex[
  Let $Omega$ be a bounded domain in $bb(R)^d$. Then, every real-valued
  continuous function $f$ on $diff Omega$ can be uniformly approximated on
  $diff Omega$ by the difference of the restrictions to $diff Omega$ of
  two functions continuous on $overline(Omega)$ and superharmonic in
  $Omega$.
]
#pf[
  Since $f$ can be uniformly approximated by polynomial functions on $partial Omega$, we can suppose $f_n -> f$ uniformly, where $f_n$ are polynomials on $partial Omega$. Denote $M_n = sup_(partial Omega) |Delta f_n|$, and set $v(x) = M_n|x|^2, w = f_n + v$. Then it is easy to varify that $v, w$ are superharmonic functions needed.
]

#ex[
  1. Show that if $Omega , tilde(Omega)$ are domains in $bb(C)$ and $f : Omega arrow.r tilde(Omega)$ is analytic, then $u circle.stroked.tiny f$ is harmonic in $Omega$ for every harmonic function $u$ in $tilde(Omega)$. What can we conclude if $f$ is conformal and $tilde(Omega) = f (Omega)$?
  2. Show that if $Omega , tilde(Omega)$ are domains in $bb(C)$ and $f : Omega arrow.r tilde(Omega)$ is conformal and onto $tilde(Omega)$, then $u circle.stroked.tiny f$ is superharmonic in $Omega$ whenever $u : tilde(Omega) arrow.r bb(R)$ is superharmonic in $tilde(Omega)$.
]

#ex[
  Find a bounded harmonic function $h$ in the upper half-plane
  $bb(H) subset bb(R)^2$, continuous on
  ${ z thin ; thin upright(I m) (z) gt.eq 0 } \\ { 0 }$, such that
  $ lim_(bb(H) in.rev y arrow.r x in bb(R)^(\*)) h (y) = upright(s g n) (x) quad upright("for all ") x in bb(R)^(\*) . $
]

#ex[
  Determine the harmonic measure of the upper half-plane
  $bb(H) subset bb(R)^2$ with respect to a point
  $x in bb(R) times bb(R)_(+)^(\*)$.
]

#ex[
  1. Let $R > r > 0$ be two positive real numbers and consider the domain $Omega = B(0 , R) \\ overline(B(0 , r))$. For $x in Omega$, determine the harmonic measure $omega_x (diff B (0 , r))$.
  2. Determine the harmonic measure of the upper half-plane $bb(H) subset bb(R)^2$ with respect to a point $x in bb(H)$.
  3. Determine the harmonic measure of $bb(R)_(+)^(\*) times bb(R)_(+)^(\*)$ with respect to a point $x in bb(R)_(+)^(\*) times bb(R)_(+)^(\*)$. (Note: Items 2 and 3 involve unbounded domains but can still be addressed...)
]

#ex[
  Let $Omega$ be a domain in $bb(R)^d$ and $omega$ its harmonic measure.
  Show that a set $E subset diff Omega$ has zero harmonic measure if and
  only if there exists a positive superharmonic function $u$, not
  identically $+ oo$ on $Omega$, such that
  $ lim_(Omega in.rev y arrow.r x) u (y) = + oo quad upright("for every ") x in E . $

  Remark: The reference point for the harmonic measure is irrelevant.
]
