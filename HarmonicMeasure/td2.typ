#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD2*
  ]

  #datetime(year: 2025, month: 3, day: 30).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#ex[
  Let $Omega subset bb(R)^n$ be a nonempty bounded open set with $C^1$
  boundary $diff Omega$, and let $F : overline(Omega) arrow.r bb(R)^n$ be
  a vector field that is continuously differentiable in $Omega$ and
  continuous up to the boundary, i.e.,
  $F in C^1 (Omega) inter C (overline(Omega))$. Then the divergence theorem
  asserts
  $ integral_Omega nabla dot.op F dd(x) = integral_(diff Omega) F dot.op nu dd(S) , $
  where $nu$ is the outward pointing unit normal to the boundary
  $diff Omega$.

  As a warmup, let $u in C^1 (Omega) inter C (overline(Omega))$ and
  $phi in C^2 (Omega) inter C^1 (overline(Omega))$, use the divergence
  theorem to prove the following identities:

  + #strong[Green’s zeroth identity]
    $ integral_Omega Delta phi dd(x) = integral_(diff Omega) diff_nu phi dd(S) . $
  + #strong[Green’s first identity]
    $ integral_Omega (nabla u dot.op nabla phi + u Delta phi) dd(x) = integral_(diff Omega) u diff_nu phi dd(S) . $
  + #strong[Green’s second identity]
    $ integral_Omega (u Delta phi - phi Delta u) dd(x) = integral_(diff Omega) (u diff_nu phi - phi diff_nu u) dd(S) . $
]
#pf[
  + Set $F = nabla phi$ and $ LHS = integral_Omega nabla dot F dd(x) = integral_(partial Omega) F dot nu dd(S) = integral_(partial Omega) nabla phi dot nu dd(S) = RHS. $
  + $
      LHS = integral_Omega nabla dot (u nabla phi) dd(x) = integral_(partial Omega) u nabla phi dot nu dd(S) = RHS.
    $
  + $
      LHS &= integral_Omega (u Delta phi + nabla u dot nabla phi) dd(x) - integral_Omega (phi Delta u + nabla u dot nabla phi) dd(x)\
      &= integral_(partial Omega) u partial_nu phi dd(S) - integral_(partial Omega) phi partial_nu u dd(S)\
      &= RHS.
    $
]

#ex[
  The inhomogeneous version of the Laplace equation is scrled the Poisson
  equation $ Delta u = f , quad upright("in") Omega . $ The common
  boundary conditions considered include
  $ a u + b diff_nu u = g , quad upright("on") diff Omega , $ with
  various choices of the functions $a$ and $b$ on the boundary. The case
  $a equiv 1$ and $b equiv 0$ is scrled the #emph[Dirichlet];, $a equiv 0$
  and $b equiv 1$ the #emph[Neumann];, $a equiv 1$ and $b > 0$ the
  #emph[Robin];, and $a equiv 1$ and $b < 0$ the #emph[Steklov] boundary
  conditions.

  Here we consider $C^2 (Omega) inter C^1 (overline(Omega))$ solutions:

  + Prove uniqueness of solutions to the Dirichlet problem for the Poisson
    equation.
  + Prove that any two solutions of the Neumann problem for the Poisson
    equation differ by a constant.
  + Prove a uniqueness theorem for the Robin problem for the Poisson
    equation. What if one specifies a Dirichlet condition on one part of
    the boundary, and a Neumann condition on the rest?
]
#pf[
  + Set $u, v$ be two solutions to the Dirichlet problem for the Poisson equation. Therefore, $u - v$ is harmonic in $Omega$ since $Delta(u-v) = Delta u - Delta v = 0$ and $u - v = 0$ on $partial Omega$, hence $u - v equiv 0$ on $Omega$ according to maximum principle of harmonic function.
  + Set $u_1, u_2$ be two solutions to the Neumann problem for the Poisson equation, and let $v = u_1 - u_2$. Only need to prove $nabla v = 0$. That's because $ 0 = integral_Omega v Delta v dd(x) = integral_(partial Omega) v partial_nu v dd(S) - integral_Omega nabla v dot nabla v dd(x), $ since $partial_nu v = 0$ on $partial Omega$, first term is always $0$, so $Delta v = 0$ holds for $x in Omega$ a.e..
  + Set $u_1, u_2, v$ similarly. $ 0 = integral_Omega v Delta v dd(x) = integral_(partial Omega) v partial_nu v dd(S) - integral_Omega |nabla v|^2 dd(x) = - integral_(partial Omega) v^2 / b dd(S) - integral_Omega |nabla v|^2 dd(x), $ Hence $v^2 = 0$ for $x in partial Omega$ a.e., and use the uniqueness of Dirichlet problem. For next question, suppose Dirichlet condition holds on $Omega_1 subset partial Omega$ and Neumann holds on $Omega_2 = partial Omega \\ Omega_1$. Similarly we can deduce $ 0 = integral_(partial Omega) v partial_nu v dd(S) - integral_Omega |nabla v|^2 dd(x) = integral_Omega_1 0 dot partial_nu v dd(S) + integral v dot 0 dd(S) - integral_Omega |nabla v|^2 dd(x), $ since first two terms vanish, $v$ is a constant in $Omega$, therefore $v = 0$ since $v = 0$ on $Omega_1$.
]

#ex[
  A #strong[fundamental solution] (or elementary solution) of the
  Laplacian in $n$ dimensions is a locally integrable function
  $E in L_(upright("loc"))^1 (bb(R)^n)$ satisfying
  $ integral_(bb(R)^n) E (y) Delta phi (y) d y = phi (0) , $ for all
  $phi in scr(D) (bb(R)^n)$, where $scr(D) (bb(R)^n)$ is the space of
  compactly supported smooth functions on $bb(R)^n$.

  + Prove that if a fundamental solution $E$ is smooth on an open set
    $Omega$ that does not contain the origin, then $E$ must be harmonic on
    $Omega$.
  + Check the function $E (x) = phi.alt (lr(|x|))$ with
    $ phi.alt (r) = cases(delim: "{", C_n r^(2 - n) & upright("if ") n eq.not 2\,, C_2 log r & upright("if ") n = 2\,) $
    satisfies $Delta E = 0$ in $bb(R)^n \\ { 0 }$.
  + Prove that the constants $C_n$ can be tuned so that $E$ is indeed a
    fundamental solution, and find the values of $C_n$.
]
#pf[
  + For any $phi in scr(D)(Omega)$, $ 0 = phi(0)
    &= integral_(RR^n) E Delta phi = integral_Omega E Delta phi\
    &= integral_(partial Omega) E partial_nu phi - integral_(Omega) nabla E dot nabla phi\
    &= - integral_Omega nabla E dot nabla phi\
    &= integral_Omega phi Delta E - integral_(partial Omega) phi partial_nu E\
    &= integral_Omega phi Delta E. $
    For any $x in Omega$, we can easily choose $phi_n arrow.t delta(x)$, where $delta(x)$ stands for Dirac function. And conclution can be deduced according to monotone convergence theorem.
  + Omit.
  + Omit.
]

#ex[
  In this problem, we look into the possibility of using fundamental
  solutions of the Laplace operator as one of the functions in Green’s
  second identity.

  Let $Omega subset bb(R)^n$ be a bounded open set with $C^1$ boundary.
  Let $y in Omega$, and we put $E_y (x) := E (x - y)$, where $E$ is the
  special fundamental solution above.

  For $u in C^2 (Omega) inter C^1 (Omega^(‾))$, prove
  $
    u (y) = integral_Omega E_y Delta u dd(x) + integral_(diff Omega) u diff_nu E_y dd(S) - integral_(diff Omega) E_y diff_nu u dd(S) .
  $
]
#pf[
  Without lost of generality, we can assume $y = 0$ and prove $ u(0) = integral_Omega Phi Delta u dd(x) + integral_(partial Omega) u partial_nu Phi dd(S) - integral_(partial Omega) Phi partial_nu u dd(S) $ where $Phi$ denotes the fundamental solution. Since $ integral_(partial Omega) Phi partial_nu u dd(S) &= integral_Omega nabla dot (Phi nabla u) dd(x) = integral_(Omega) (nabla Phi dot nabla u + Phi Delta u) dd(x),\
  integral_(partial Omega) u partial_nu Phi dd(S) &= integral_Omega nabla dot (u nabla Phi) dd(x) = integral_(Omega) (nabla u dot nabla Phi + u Delta Phi) dd(x) = u(y) + integral_(Omega) nabla u dot nabla Phi dd(x), $ The result can be reached after calculation.
]

#ex[
  Let $Omega$ and $u$ be as in Green’s formula, and in addition, let
  $Delta u = 0$ in $Omega$. Then by using Green’s formula, prove that
  $u in C^oo (Omega)$ with
  $ sup_(y in K) lr(|diff^alpha u (y)|) lt.eq C (sup_Omega lr(|u|) + sup_Omega lr(|nabla u|)) , $
  for all multi-indices $alpha$ and compact sets $K subset Omega$, with
  the constant $C$ possibly depending on $alpha$ and $K$.
]
#pf[
  Use induction. For $|alpha| = 0$, it is trivial. Assume condition holds for $|alpha| = k$, we prove the condition $partial_i partial^alpha$ still holds. Indeed, for every $y in K$, set $B(y, delta) subset Omega$, and $ lr(|partial_i diff^alpha u (y)|) lt.eq C_i / delta sup_(B(y, delta))abs(partial^alpha u(y)) <= C_i / delta C_alpha (sup_Omega lr(|u|) + sup_Omega lr(|nabla u|)). $
]

#ex[
  Let $u in C^2 (Omega)$ be harmonic in a bounded domain $Omega$. By using
  the Harnack Inequality show that unless $u$ is constant, it cannot
  achieve its extremums in $Omega$.
]
#pf[
  Without lost of generality, we can assume $inf_Omega u = 0$. Suppose $u(x_0) = 0, x_0 in Omega$, then we only need to prove $u equiv 0$ in $Omega$. It is easy, because $forall y in Omega$, we have $u(y) <= C_(x_0, y) u(x_0) = 0$ according to Harnack Inequality.
]
