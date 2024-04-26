#import "@preview/modern-technique-report:0.1.0": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#import "@preview/physica:0.9.3": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#import "@preview/big-todo:0.2.0": *

#show: modern-technique-report.with(
  title: [Real Analysis:\ Tasks Answers],
  subtitle: [
    *Fourth Edition*, \ by _H.L. Royden_ and _P.M. Fitzpatrick_
  ],
  series: [*Mathematics Courses \ Tasks Answers Series*],
  author: [aytony],
  date: datetime.today().display("[year] -- [month] -- [day]"),
  background: image("bg.jpg"),
  theme-color: red.darken(20%),
  font: ("Times New Roman", "NSimSun"),
  title-font: "Noto Sans",
)

#set page(numbering: "1")

#set page(header: [
  #grid(
    columns: 3,
    [*Real Analysis*],
    h(1fr),
    image("buaachar.png", width: 90pt)
  )
  #v(-8pt)
  #line(length: 100%)
])

#let bar(x) = $overline(#x)$

#let dint(a, b) = $integral_(#h(-0.7em)\_\_#h(0.2em)#a)^#b$
#let uint(a, b) = $integral^(#h(-0.7em)overline(#hide("ai"))#h(0.2em)#b)_#a$

#let cA = $cal(A)$
#let cB = $cal(B)$
#let cF = $cal(F)$
#let cO = $cal(O)$
#let cU = $cal(U)$

#let thm = thmbox.with(
  padding: (top: 0em, bottom: 0em),
  breakable: true,
  inset: (top: 0em, left: 1.2em, right: 1.2em),
  namefmt: name => strong([(#name)]),
  titlefmt: strong,
)

#let task = thm(
  "task",
  "Task",
  base_level: 1
)

#let prf = thm(
  "proof",
  "Proof"
).with(numbering: none)

#let sol = thm(
  "solution",
  "Solution"
).with(numbering: none)

#set heading(numbering: none)
= Preliminaries on Sets, Mappings, and Relations

#set heading(numbering: (..nums) => [
  #nums.pos().map(str).join(".")
  #h(0.5em)
  #box(width: 1.2pt, height: 1.1em, fill: gray.darken(20%), baseline: 20%)
  #h(0.2em)
])
= The Real Numbers: Sets, Sequences, and Functions

== The Field, Positivity, and Completeness Axioms

== The Natural and Rational Numbers

== Countable and Uncountable Sets

== Open Sets, Closed Sets, and Borel Sets of Real Numbers

== Sequences of Real Numbers

== Continuous Real-valued Functions of a Real Variable

= Lebesgue Measure

== Intruduction

== Lebesgue Outer Measure

== The $bold(sigma)$-Algebra of Lebesgue Measurable Sets

== Outer and Inner Approximation of Lebesgue Measurable Sets

== Countable Additivity, Continuity, and the Borel-Cantelli Lemma

== Nonmeasurable Sets

== The Cantor Set and the Cantor-Lebesgue Function

= Lebesgue Measurable Functions

== Sums, Products, and Compositions

== Sequential Pointwise Limits and Simple Approximation

== Littlewood's Three Principles, Egoroffs's Theorem, and Lusin's Theorem

= Lebesgue Integration

== The Rimemann Integral
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]
#task[]

== The Lebesgue Integral of a Bounded Measurable Function over a Set of Finite Measure

== The Lebesgue Integral of a Measurable Nonnegatice Function

== The General Lebesgue Integral

== Contable Addativity and Continuity of Integration

== Uniform Integrability: The Vitali Convergence Theorem

#task[
  Let $f$ be integrable over $RR$. Show that the function $F$ defined by $
  F(x) = integral_(-oo)^x f "for all" x in RR
  $ is properly defined and continuous. Is it necessarily Lipschitz?
]

#task[
  Show that Proposition 25 is false if $E = RR$.
]

#task[
  Show that Theorem 26 is false without the assumption that the $h_n$'s are nonnegative.
]

#prf[
  考虑函数列 $
  h_n(x) = cases(n\, 0 <= x <= 1/2^n, -n\, 1/2^n < x <= 1/2^(n-1), 0\, "其他情况")
  $ 此时 $lim integral_[0,1]h_n = 0$，但是在 $[0, 1]$ 上不一致可积.

  考虑函数列
]

#task[
  Let the sequences of functions ${h_n}$ and ${g_n}$ be uniformly integrable over $E$. Show that for any $alpha$ and $beta$, the sequence of linear combinations $alpha f_n + beta g_n$ also is uniformly integrable over $E$.
]

#prf[
  任取 $epsilon > 0$. 设 $delta_1, delta_2 > 0$ 满足 ${h_n}, {g_n}$ 在 $epsilon / (2 |alpha|), epsilon / (2 |beta|)$ 下对应的一致可积条件. 那么令 $delta = min{delta_1, delta_2}$. 对任意 $E$ 的可测子集 $A$，且 $m(A) < delta$，则有 $
  integral_A |alpha f_n + beta g_n| &<= |alpha| integral_A |f_n| + |beta| integral_A |g_n|\
  &= |alpha| dot epsilon / (2 |alpha|) + |beta| dot epsilon / (2 |beta|)\
  &< epsilon.
  $
]

#task[
  Let $f$ be integrable over $RR$ and $epsilon > 0$. Establish the following three approximation properties.
  + There is a simple function $eta$ on $RR$ which has finite support and $integral_RR |f - eta| < epsilon$.
  + There is a step function $s$ on $RR$ which vanished outside a closed, bounded interval and $integral_RR |f-s| < epsilon$.
  + There is a continuous function $g$ on $RR$ which vanished outside a bounded set and $integral_RR |f-g| < epsilon$.
]

#prf[
  不妨假设 $f$ 在 $RR$ 上非负，否则只要对 $f$ 非负和 $f$ 为负的部分分别应用结论即可.

  对于第一问，由定义知道 $
  integral_RR f = sup{integral_RR h | h "是有界、可测、支集测度有限的函数，且" 0 <= h <= f}.
  $ 那么存在 $h_0$ 满足以上条件且 $
  integral_RR f - integral_RR h_0 < epsilon / 2.
  $ 又由 $integral_RR h_0$ 定义知道存在简单函数 $eta$ 满足 $
  integral_RR h_0 - integral_RR eta < epsilon / 2.
  $ 那么就有 $
  integral_RR |f-eta| = integral_RR f - integral_RR eta < epsilon,
  $ 其中 $eta$ 是简单函数且支集测度有限.

  对于第二问，对于上述 $h_0$，首先由积分的连续性得到 $
  lim_(n->oo) integral_([-n, n])h_0 = integral_RR h_0.
  $ 那么存在一个足够大的 $n_0$，使得 $
  integral_((-oo, -n_0) union (n_0, +oo))h_0 = integral_RR h_0 - integral_([-n_0, n_0])h_0< epsilon / 4.
  $ 考虑 $integral_([-n_0, n_0])h_0$. 由 Lusin 定理，存在 $[-n_0, n_0]$ 的子集 $F$ 使得 $h_0$ 在 $F$ 上连续，那么由 Riemann 可积性知道存在 $F$ 上的 step function $s$ 使得 $s <= h_0$ 且 $
  integral_F h_0 - integral_F s < epsilon / 8.
  $ 又注意到 $h_0$ 在 $[-n_0, n_0]$ 上有界，设 $|h_0| < M$. 那么可以选取上述集合 $F$ 使得 $m([-n_0, n_0] tilde F) < epsilon / (8 M)$ 即可，在 $RR tilde F$ 上令 $s = 0$，此时有 $
  integral_RR |f-s| &= integral_RR f - integral_RR s\
  &= integral_RR f - integral_RR h_0 + integral_RR h_0 - integral_([-n_0, n_0])h_0 + integral_([-n_0, n_0])h_0 - integral_F s\
  &< epsilon / 2 + epsilon / 4 + integral_([-n_0, n_0] tilde F)h_0 + integral_F h_0 - integral_F s\
  &< epsilon / 2 + epsilon / 4 + M dot epsilon / (8 M) + epsilon / 8\
  &< epsilon.
  $

  对于第三问，考虑上述 $h_0, n_0$ 和 $F$. 考虑构造连续函数 $g$，使得在 $F$ 上 $g = h_0$，并将 $g$ 延拓到 $[-n_0, n_0]$，进一步延拓到 $RR$，且有 $g([n_0+epsilon / (8M), +oo)) = g((-oo, -n_0-epsilon / (8M)]) = {0}$. 这时有 $
  integral_RR |f-g| < epsilon / 2 + epsilon / 4 + integral_([-n_0, n_0] tilde F) (h_0 - g)
  < epsilon.
  $
]

#task[
  Let $f$ be integrable over $E$. Define $hat(f)$ to be the extension of $f$ to all of $RR$ obtained by setting $hat(f) equiv 0$ outside of $E$. Show that $hat(f)$ is integrable over $RR$ and $integral_E f = integral_RR hat(f)$. Use this and part (1) and (3) of preceding problem to show that for $epsilon > 0$, there is a simple function $eta$ on $E$ and a continuous function $g$ on $E$ for which $integral_E |f-eta| < epsilon$ and $integral_E |f-g| < epsilon$.
]

#prf[
  显然有 $
  integral_RR hat(f) &= integral_E hat(f) + integral_(RR tilde E) hat(f)\
  &= integral_E f + integral_(RR tilde E) 0\
  &= integral_E f.
  $ 然后直接应用上题的结论即可.
]

#task("Riemann-Lebesgue")[
  Let $f$ be integrable over $RR$. Show that $
  lim_(n -> oo)integral_RR f(x) cos n x dd(x) = 0.
  $
]

#prf[
  $forall epsilon > 0$. 由 44 题的结论知道存在 step function $g$ 仅在有穷闭区间 $F$ 上非 $0$ 且 $integral_RR |f-g| < epsilon / (2 m(F))$. 又知道 $
  abs(integral_RR f(x) cos n x dd(x)) &<= integral_RR abs((f(x)-g(x)) cos n x dd(x)) + abs(integral_RR g(x) cos n x dd(x))\
  &<= integral_RR |f(x) - g(x)| |cos n x dd(x)| + abs(integral_(RR) g(x) cos n x dd(x))\
  &<= integral_RR |f(x) - g(x)|dd(x)  + abs(integral_(RR) g(x) cos n x dd(x))\
  &<= epsilon / 2 + abs(integral_(RR) g(x) cos n x dd(x)).\
  $ 故只要证明 $g$ 是 step function 的情况即可，且 $g$ 仅在有穷闭区间 $F$ 上非 $0$. 考虑到 $g$ 在每一段上的取值为常数，不妨设 $g(x)$ 是常数. 那么此时只要证明 $
  lim_(n -> oo)abs(integral_F cos n x dd(x)) = 0.
  $ 而注意到它是 Riemann 可积的，直接换元积分得到原函数 $1 / n sin n x$，令 $n -> oo$ 得到结果.
]

#task[
  Let $f$ be integrable over $RR$.
  + Show that for each $t$, #h(1fr)$ 
  integral_RR f(x) dd(x) = integral_RR f(x + t) dd(x).
  $
  + Let $g$ be a bounded measurable function on $RR$. Show that $
  lim_(t -> 0) integral_RR g(x) dot [f(x) - f(x + t)] = 0.
  $
]

#prf[ 
  对于第一问，容易看出 $
  integral_RR f(x) dd(x) &= sup{integral_RR h(x) dd(x) | h "是有界、可测、支集测度有限的函数，且" 0 <= h <= f}\ 
  &= sup{integral_RR h(x + t) dd(x) | h "是有界、可测、支集测度有限的函数，且" 0 <= h <= f}\ 
  &= integral_RR f(x + t) dd(x).
  $

  对于第二问，考虑用第 44 题的结论，用仅在有界闭集合 $F$ 上非零的连续函数 $f_1$ 来近似函数 $f$，满足 $integral_RR |f - f_1| < epsilon$ 对 $forall epsilon > 0$ 成立. 由于 $f_1$ 在闭集 $F$ 上连续，进而一致连续. 那么对 $forall epsilon > 0$，记 $integral_RR |g| = G < +oo$，当 $|t| < epsilon / (2 M m(F))$ 时有 $
  abs(integral_F g(x) dot [f_1 (x) - f_1 (x + t)]) &<= integral_F M dot abs(f_1 (x) - f_1 (x + t))\
  &<= integral_F M dot epsilon / (2 M m(F))\
  &= epsilon.
  $ 于是在 $f_1$ 下的命题得证. 对于 $f$ 下的命题，有 $
  abs(integral_RR g(x) dot [f(x) - f(x+t)]) &<= integral_RR M dot abs(f(x) - f(x+t))\
  &<= integral_RR M dot abs(f(x) - f_1 (x)) + integral_RR M dot abs(f_1(x) - f_1 (x+t))\
  & quad +integral_RR M dot abs(f(x+t) - f_1 (x+t)) \
  &<= M dot epsilon / (3M) + epsilon / 3 + M dot epsilon / (3M)\
  &= epsilon.
  $ 其中倒数第二行由 $f_1$ 下的命题和用 $f_1$ 近似 $f$ 的结论可以得出. 命题得证.
]

#task[
  Let $f$ be integrable over $E$ and $g$ be a bounded measurable function on $E$. Show that $f dot g$ is integrable over $E$.
]

#prf[
  设 $|g| < M$. 则有 $
  abs(integral_E f dot g) &<= integral_E |f| dot |g| <= M integral_E |f| < +oo.
  $
]

#task[
  Let $f$ be integrable over $RR$. Show that the following four assertions are equivalent:
  + $f = 0$ a.e. on $RR$.
  + $integral_RR f g = 0$ for every bounded measurable function $g$ on $RR$.
  + $integral_A f = 0$ for every measurable set $A$.
  + $integral_cO f = 0$ for every open set $cO$.
]

#prf[
  $1 ==> 2$：类似第 48 题可以直接证明.

  $2 ==> 3$：对任意的可测集 $A$，令可测函数 $g = chi_A$ 即可.

  $3 ==> 4$：显然.

  $4 ==> 1$：反证法. 设存在正测度集合 $A$ 使得 $integral_A f != 0$，不妨设 $integral_A f = k > 0$. 构造开集合列 ${O_n}$ 使得 $A subset.eq O_n$ 且 $m(O_n tilde A) < 1 / n$. 那么令 $O = sect_(n=1)^oo O_n$ 则有 $A subset.eq O$ 且 $m(O) = m(A)$. 此时有 $
  integral_O f = integral_A f + integral_(O tilde A) f = k > 0,
  $ 矛盾.
]

#task[
  Let $cF$ be a family of functions, each of which is integrable over $E$. Show that $cF$ is uniformly integrable over $E$ if and only if for each $epsilon > 0$, there is a $delta > 0$ such that for each $f in cF$, $
  "if" A subset.eq E "is measurable and" m(A) < delta, "then" abs(integral_A f) < epsilon.
  $
]

#prf[
  $==>$ 由 $abs(integral_A f) <= integral_A |f| < epsilon$ 显然.

  $<==$ 对于 $forall f in cF$，考虑 $f^+$ 和 $f^-$ 在 $A$ 上定号.对于任意的可测 $A subset.eq E$ 且 $m(A) < delta$，有 $
  integral_A |f| &= integral_(A sect [f >= 0]) |f| - integral_(A sect [f <= 0])|f|\
  &= abs(integral_(A sect [f >= 0]) f) + abs(integral_(A sect [f <= 0])f)\
  &< epsilon.
  $ 最后一步由题目条件得到.
]

#task[
  Let $cF$ be a family of functions, each of which is integrable over $E$. Show that $cF$ is uniformly integrable over $E$ if and only if for each $epsilon > 0$, there is a $delta > 0$ such that for all $f in cF$, $
  "if" cU "is open and" m(E sect cU) < delta, "then" integral_(E sect cU)|f| < epsilon.
  $
]

#prf[
  $==>$ 显然.

  $<==$ 考虑对任意的 $epsilon > 0$ 和条件中对应的 $delta > 0$，令 $E$ 的可测子集 $A$ 满足 $m(A) < delta$. 那么存在开集 $cU$ 包含 $A$ 且 $m(cU tilde A) < delta - m(A)$. 那么有 $
  m(E sect cU) = m(A) + m((E sect cU) tilde A) <= m(A) + m(cU sect A) < delta.
  $ 从而有 $
  integral_A |f| <= integral_(E sect cU) |f| < epsilon.
  $
]

#task[
  + Let $cF$ be the family of functions $f$ on $[0,1]$, each of which is integrable over $[0,1]$ and has $integral_0^1 |f| <= 1$. Is $cF$ uniformly integrable over $[0,1]$?
  + Let $cF$ be the family of functions $f$ on $[0,1]$, each of which is continuous over $[0,1]$ and has $|f| <= 1$. Is $cF$ uniformly integrable over $[0,1]$?
  + Let $cF$ be the family of functions $f$ on $[0,1]$, each of which is integrable over $[0,1]$ and has $integral_a^b |f| <= b-a$ for all $[a,b] subset.eq [0,1]$. Is $cF$ uniformly integrable over $[0,1]$?
]

#prf[
  + 错误. 考虑 #h(1fr)$
  f_n = cases(n\, 0 <= x <= 1 / n, 0\, "其他情况")
  $ 不是一致可积的.
  + 正确. 令 $delta = epsilon$，则对任意 $[0,1]$ 的可测子集 $A$，且 $m(A) < delta$，有 $
  integral_A |f|  <= integral_A 1 = m(A) < epsilon.
  $ 是一致可积的.
  + 正确. 容易看出 $F(x) = integral_0^x f(t) dd(t)$ 是一致连续的.
]

= Lebesgue Integration: Further Topics

== Uniform Integrability and Tightness: A General Vitali Convergence Theorem

#task[
  Prove Corollary 2.
]

#task[
  Let ${f_k}_(k=1)^n$ be a finite family of functions, each of which is integrable over $E$. Show that ${f_(k)}_(k=1)^n$ is uniformly integrable and tight over $E$.
]

#task[
  Let the sequences of functions ${h_n}$ and ${g_n}$ be uniformly integrable and tight over $E$. Show that for any $alpha$ and $beta$, ${alpha f_n + beta g_n}$ also is uniformly integrable and tight over $E$.
]

#task[
  Let ${f_n}$ be a sequence of meaureable functions on $E$. Show that ${f_n}$ is uniformly integrable and tight over $E$ if and only if for each $epsilon > 0$, there is a measurable subset $E_0$ of $E$ that has finite measure and a $delta > 0$ such that for each measurable subset $A$ of $E$ and index $n$, $
  "if" m(A sect E_0) < delta, "then" integral_A |f_n| < epsilon.
  $
]

#task[
  Let ${f_n}$ be a sequence of integrable functions on $RR$. Show that ${f_n}$ is uniformly integrable and tight over $RR$ if and only if for each $epsilon > 0$, there are positive numbers $r$ and $delta$ such that for each open subset $cO$ of $RR$ and index $n$, $
  "if" m(cO sect (-r, r)) < delta, "then" integral_cO |f_n| < epsilon.
  $
]

== Convergence in Measure

== Chracterizations of Riemann and Lebesgue Integrability

#task[
  Let $f$ and $g$ be bounded functions that are Riemann integrable over $[a,b]$. Show that the product $f g$ also is Riemann integrable over $[a,b]$.
]

#task[
  Let $f$ be a bounded function on $[a,b]$ whose set of discontinuities has measure zero. Show that $f$ is measurable. Then show that the same holds without the assumption of boundedness.
]

#task[
  Let $f$ be a function on $[0,1]$ that is continuous on $(0,1]$. Show that it is possible for the sequence ${integral_([1\/n,1])f}$ to converge and yet $f$ is not Lebesgue integrable over $[0,1]$. Can this happen if $f$ is nonnegative? 
]
