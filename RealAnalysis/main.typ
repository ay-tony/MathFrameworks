#import "@preview/modern-technique-report:0.1.0": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#import "@preview/physica:0.9.3": *

#show: modern-technique-report.with(
  title: [Real Analysis],
  subtitle: [
    *Fourth Edition*, \ by _H.L. Royden_ and _P.M. Fitzpatrick_
  ],
  series: [*Mathematics Courses \ Framework Series*],
  author: [aytony],
  date: datetime.today().display("[year] -- [month] -- [day]"),
  background: image("bg.jpg"),
  theme-color: rgb(21, 74, 135),
  font: "Times New Roman",
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

#let eg = thm(
  "example",
  "Example",
).with(numbering: none)

#let rem = thm(
  "remark",
  "Remark",
).with(numbering: none)

#let de = thm(
  "definition",
  "Definition",
).with(numbering: none)

#let tho = thm(
  "theorem",
  "Theorem",
  base_level: 1,
)

#let cor = thm(
  "theorem",
  "Corollary",
  base_level: 1,
)

#let prop = thm(
  "theorem",
  "Proposition",
  base_level: 1,
)

#let lem = thm(
  "theorem",
  "Lemma",
  base_level: 1,
)

#let note = thm(
  "note",
  none,
  namefmt: name => strong([#name]),
).with(numbering: none)

#let task = thm(
  "task",
  "Task",
  base_level: 2
)

#set heading(numbering: none)
= Preliminaries on Sets, Mappings, and Relations

#de[
  A relation R on a set X is called an *equivalence relation* provided it is reflexive, symmetric, and transitive.
]

#de[
  Let $cF$ be a nonempty family of nonempty sets. A *choice function* $$ on $cF$ is a function $f$ from $cF$ to $union_(F in cF)F$ with the property that for each set $F$ in $cF$, $f(F)$ is a number of $F$.
]

#note("Zermelo's Axiom of Choice")[
  Let $cF$ be a nonempty collection of nonempty sets. Then there is a choice function on $cF$.
]

#de[
  A relation $R$ on a set nonempty $X$ is called a *partial ordering* provided it is reflexive, transitivem and for $x, x'$ in $X$,
  $ "if" x R x' "and" x' R x, "then" x = x'. $
  A subset $E$ of $X$ is said to be *totally ordered* provided for $x, x'$ in $E$, either $x R x'$ or $x' R x$. A member $x$ of $X$ is said to be an *upper bound* for a subset $E$ of $X$ provided $x' R x$ for all $x' in E$, and is said to be *maximal* provided the only member $x'$ of $X$ for which $x R x'$ is $x' = x$.
]

#note("Zorn's Lemma")[
  Let $X$ be a partially ordered set for which every totally ordered subset has an upper bound. Then $X$ has a maximal member.
]

#set heading(numbering: (..nums) => [
  #nums.pos().map(str).join(".")
  #h(0.5em)
  #box(width: 1.2pt, height: 1.1em, fill: gray.darken(20%), baseline: 20%)
  #h(0.2em)
])
= The Real Numbers: Sets, Sequences, and Functions

== The Field, Positivity, and Completeness Axioms

#note("The Completeness Axiom")[
  Let $E$ be a nonempty set of real numbers that is bounded abouve. Then among the set of upper bounds for $E$ there is a smallest, or least, upper bound.
]

== The Natural and Rational Numbers

#de[
  A et $E$ of real numbers is said to be *inductive* provided it contains $1$ and if the number $x$ belongs to $E$, the number $x+1$ also belongs to $E$.
]

#note("Principle of Mathematcal Induction")[
  For each natural number $n$, let $S(n)$ be some mathematical assertion. Suppose $S(1)$ is true. Also suppose that whenever $k$ is a natural number for which $S(k)$ is true, then $S(k+1)$ is also true. Then $S(n)$ is true for every natural nnumber $n$.
]

#tho[
  Every nonempty set of natural numbers has a smallest member.
]

#note("Archimedean Property")[
  For each pair of positive real numbers $a$ and $b$, there is a natural number $n$ for which $n a > b$.
]

#de[
  A set $E$ of real numbers is said to be *dense* in $RR$ provided between any two eal numbers there lies a member of $E$.
]

#tho[
  The rational numbers are dense in $RR$.
]

== Countable and Uncountable Sets

#de[
  A set $E$ is said to e *finite* provided either it is empty or there is a natural nnumber $n$ for which $E$ is equipotent to ${1, dots.c, n}$. We say that $E$ is *countably infinite* provided $E$ is equipotent to the set $NN$ of natural numbers. A set that is either finite or countably infinite is said to be *countable*. A set that is not countable is called *uncountable*.
]

#tho[
  A subset of a countable set is countable. In particular, every set of natural numbers is countable.
]

#cor[
  The following sets are countably infinite:
  
  + #v(-0.75em)For each natural number $n$, the Cartesian product $overbrace(NN times dots.c times NN, n "times")$.
  + The set of rational numbers $QQ$.
]

#tho[
  A nonempty set is countable if and only if it is the image of a function whose domain is a nonempty countable set.
]

#cor[
  The union of a countable collection of countable sets is countable.
]

#tho[
  A nondegenerate interval of real numbers is uncountable.
]

== Open Sets, Closed Sets, and Borel Sets of Real Numbers

#de[
  A set $cO$ of real numbers is called *open* provided for each $x in cO$, there is a $r > 0$ for which the interval $(x - r, x + r)$ is contained in $cO$.
]

#prop[
  The set of real numbers $RR$ and the empty-set $emptyset$ is open; the intersection of any finite collection of open sets is openl and the union of any collection of open sets is open.
]

#prop[
  Every nonempty open set is the disjoint unioin of a countable collection of open intervals.
]

#de[
  For a set $E$ of real numbers, a real number $x$ is called a *point of closure* of $E$ provided every open interval that contains $x$ also contains a point in $E$. The collection of points of closure of $E$ is called the *closure* of $E$ and denoted by $overline(E)$.
]

#prop[
  For a set of real numbers $E$, its closure $bar(E)$ is closed. Moreover, $bar(E)$ is the smallest closed set that contains $E$ in the sense that if $F$ is closed and $E subset.eq F$, then $bar(E) subset.eq F$.
]

#prop[
  A set of real numbers is open if and only if its complement in $RR$ is closed.
]

#prop[
  The empty-set $emptyset$ are closed; the union of any finite collection of closed sets is closed; and the intersection of any collection of closed sets is closed.
]

#note("The Heine-Borel Theorem")[
  Let $F$ be a closed and bounded set of real numbers. Then every open cover of $F$ has a finite subcover.
]

#note("The Nested Set Theorem")[
  Let ${F_n}_(n=1)^oo$ be a descending countable collection of nonempty closed sets of real numbers for which $F_1$ bounded. Then
  $ sect.big_(n=1)^oo F_n != emptyset. $
]

#de[
  Given a set $X$, a collection $cA$ of subsets of $X$ is called a $sigma$-algebra (of subsets of $X$) provided:
  
  + The empty-set, $emptyset$, belongs to $cA$;
  + The complement in $X$ of a set in $cA$ also belongs to $cA$;
  + The union of a countable collection of sets in $cA$ also belongs to $cA$.
]

#prop[
  Let $cF$ be a collection of subsets of a set $X$. Then the intersection $cA$ of all $sigma$-algebras of subsets of $X$ that contain $cF$ is a $sigma$-algebra that contains $cF$. Moreover, it is the smallest $sigma$-algebra of subsets of $X$ that contains $cF$ in the sense that any $sigma$-algebra that contains $cF$ also contains $cA$.
]

#de[
  The collection $cB$ of Borel sets of real numbers is the smallest $sigma$-algebra of sets of real numbers that contains all of the open sets of real numbers.
]

== Sequences of Real Numbers

#de[
  A sequence ${a_n}$ is said to *converge* to the number $a$ provided for every $epsilon > 0$, there is an index $N$ for which
  $ "if" n >= N, "then" |a - a_n| < epsilon. $
  We call $a$ the *limit* of the sequence and denote the convergence of ${a_n}$ by writing
  $ {a_n} -> a "or" lim_(n -> oo) a_n = a. $
]

#prop[
  Let the sequence of real numbers ${a_n}$ converge to the real number $a$. Then the limit is unique, the sequence is bounded, and, for a real number $c$,
  $ "if" a_n <= c "for all" n, "then" a <= c. $
]

#tho("the Monotone Convergence Criterion for Real Sequences")[
  A monotone sequence of real numbers converges if and only if it is bounded.
]

#tho("the Bolzano-Weierstrass Theorem")[
  Every bounded sequence of real numbers has a convergent subsequence.
]

#de[
  A sequence of real numbers ${a_n}$ is said to be *Cauchy* provided for each $epsilon > 0$, there is an index $N$ for which
  $ "if" n, m >= N, "then" |a_m - a_n| < epsilon. $
]

#tho("the Cauchy Convergence Criterion for Real Sequences")[
  A sequence of real numbers converges if and only if it is Cauchy.
]

#tho("Linearity and Monotonicity of Convergence of Real Sequences")[
  Let ${a_n}$ and ${b_n}$ be convergent sequences of real numbers. Then for each pair of real numbers $alpha$ and $beta$, the sequence ${alpha dot a_n + beta dot b_n}$ is convergent and
  $
  lim_(n -> oo)[
    alpha dot a_n + beta dot b_n
  ] = alpha dot lim_(n -> oo) a_n + beta dot lim_(n ->oo)b_n.
  $
  Moreover,
  $ "if" a_n <= b_n "for all" n, "then" lim_(n -> oo) a_n <= lim_(n -> oo)b_n. $
]

#de[
  Let ${a_n}$ be sequence of real numbers. The limit superior of ${a_n}$, denoted by $lim sup{a_n}$, is defined by
  $ lim sup{a_n} = lim_(n->oo)[sup {a_k | k >= n}]. $
  The limit inferior of ${a_n}$, denoted by $lim inf{a_n}$, is defined by
  $ lim inf{a_n} = lim_(n->oo)[inf {a_k | k >= n}]. $
]

#prop[
  Let ${a_n}$ and ${b_n}$ be sequyences of real numbers.
  
  + $lim sup{a_n} = cal(l) in RR$ if and only if for each $epsilon > 0$, there are infinitely many indices $n$ for which $a_n > cal(l) - epsilon$ and only finitely many indeices $n$ for which $a_n > cal(l) + epsilon$.
  + $lim sup {a_n} = oo$ if and only if ${a_n}$ is not bounded above.
  + $ lim sup {a_n} = - lim inf {-a_n}. $
  + A sequence of real numbers ${a_n}$ converges to an extended real number $a$ if and only if
    $ lim inf {a_n} = lim sup {a_n} = a. $
  + If $a_n <= b_n$ for all $n$, then
    $ lim sup{a_n} <= lim inf{b_n}. $
]

#prop[
  Let ${a_n}$ be a sequence of real numbers.
  
  + The series $sum_(k=1)^oo a_k$ is summable if and only if for each $epsilon > 0$, there is an index $N$ for which
    $
    abs(sum_(k=n)^(n+m)a_k) < epsilon "for" n >= N "and any natural number" m.
    $
  + If the series $sum_(k=1)^oo|a_k|$ is summable, then $sum_(k=1)^oo a_k$ also is summable.
  + If each term $a_k$ is nonnegative, then the series $sum_(k=1)^oo a_k$ is summable if and only if the sequence of partial sums is bounded.
]

== Continuous Real-valued Functions of a Real Variable

#prop[
  A real-valued function $f$ defined on a set $E$ of real numbers is continuous at the point $x_* in E$ if and only if whenever a sequence ${x_n}$ in $E$ converges to $x_*$, its image sequence ${f(x_n)}$ converges to $f(x_*)$.
]

#prop[
  Let $f$ be a real-valued function defined on a set $E$ of real numbers. Then $f$ is continuous on $E$ if and only if for each open set $cO$,
  $ f^(-1)(cO) = E sect cU "where" cU "is an open set". $
]

#note("The Extreme Value Theorem")[
  A continuous real-valued function on a nonempty closed, bounded set of real numbers takes a minimum and maximum value.
]

#note("The Intermediate Value Theorem")[
  Let $f$ be a continuous real-valued function on the closed, bounded interval $[a, b]$ for which $f(a) < c < f(b)$. Then there is a point $x_0$ in $(a, b)$ at which $f(x_0) = c$.
]

#de[
  A real-valued function $f$ defined on a set $E$ of real numbers is said to be *uniformly continuous* provided for each $epsilon > 0$, there is a $delta > 0$ such that for all $x, x' in E$,
  $ "if" |x - x'| < delta, "then" |f(x) - f(x')| < epsilon. $
]

#tho[
  A continuous real-valued function on a closed, bounded set of real numbers is uniformly continuous.
]

#de[
  A real-valued function $f$ defined on a set $E$ of real numbers is said to be *increasing* provided $f(x) <= f(x')$ whenever $x, x'$ belong to $E$ and $x <= x'$, and *decreasing* provided $-f$ is increasing. It is called *monotone* if it is either increasing or decreasing.
]

#counter("Theorem").update(0)

= Lebesgue Measure

== Intruduction

== Lebesgue Outer Measure

#eg[
  A countable set has outer measure zero. Indeed, let $C$ be a countable set enumerated as $C = {c_k}_(k=1)^oo$. Let $epsilon > 0$. For each natural number $k$, define $I_k = (c_k - epsilon \/ 2^(k+1), c_k + epsilon \/ 2^(k+1))$. The countable collection of open intervals ${I_k}_(k=1)^oo$ covers $C$. Therefore
  
  $
  0 <= m^*(C) <= sum_(k=1)^oo cal(l)(
    I_k
  ) = sum_(k=1)^oo epsilon \/ 2^k = epsilon.
  $
  This inequality holds for each $epsilon > 0$. Hence $m^*(E) = 0$.
]

#prop[
  The outer measure of an interval is its length.
]

#prop[
  Outer measure is translation invariant, that is, for any set $A$ and number $y$,
  
  $ m^*(A + y) = m^*(A). $
]

#prop[
  Outer measure is countably subadditive, that is, if ${E_k}_(k=1)^oo$ is any countable collection of sets, disjoint or not, then
  $ m^*(union.big_(k=1)^oo E_k) <= sum_(k=1)^oo m^*(E_k). $
]

== The $bold(sigma)$-Algebra of Lebesgue Measurable Sets

#de[
  A set E is said to be *measurable* provided for any set $A$,
  $ m^*(A) = m^*(A sect E) + m^*(A sect E^C). $
]

#prop[
  Any set of outer measure zero is measurable. In particular, any countable set is measurable.
]

#prop[
  The union of a finite collection of measurable sets is measurable.
]

#prop[
  Let $A$ be any set and ${E_k}_(k=1)^n$ a finite disjoint collection of measurable sets. Then
  $ m^*(A sect [union.big_(k=1)^n E_k]) = sum_(n=1)^n m^*(A sect E_k). $
  In particular,
  $ m^*(union.big_(k=1)^n E_k) = sum_(n=1)^n m^*(E_k). $
]

#prop[
  The union of a countable collection of measurable sets is measurable.
]

#prop[
  Every interval is measurable.
]

#tho[
  The collection $cal(M)$ of measurable sets is a $sigma$-algebra that contains the $sigma$-algebra $cal(B)$ of Borel sets. Each interval, each open set, each closed set, each $G_delta$ set, and each $F_delta$ set is measurable.
]

#prop[
  The translate of a measuarble set is measurable.
]

== Outer and Inner Approximation of Lebesgue Measurable Sets

#tho[
  Let $E$ be any set of real numbers. Then each of the following four assertions is equivalent to eh measurability of $E$.
  
  (Outer Approximation by Open Sets and $G_delta$ Sets)
  
  + For each $epsilon > 0$, there is an open set $cO$ containing $E$ for which $m^*(cal(O) tilde E) < epsilon$.
  + There is a $G_delta$ set $G$ containing $E$ for which $m^*(G tilde E) = 0$.
  
  (Inner Approximation by Cloased Sets and $F_delta$ Sets)
  
  + For each $epsilon > 0$, there is a closed set $F$ contained in $E$ for which $m^*(E tilde F) < epsilon$.
  + There is an $F_delta$ set $F$ contained in $E$ for which $m^*(E tilde F) = 0$.
]

#tho[
  Let $E$ be a measurable set of finite outer measure. Then for each $epsilon > 0$, there is a finite disjoint collection of open intervals ${I_k}_(k=1)^n$ for which if $cO = union_(k=1)^n I_k$, then
  $ m^*(E tilde cO) + m^*(cO tilde E) < epsilon. $
] <tho12>

#rem[
  A comment regarding assertion in @tho12 is in order. By the definition of outer measure, for any bounded set $E$, regardless of whether or not it is measurable, and any $epsilon > 0$, there is an open set $cO$ such that $E subset.eq cO$ and $m^*(cO) < m^*(E) + epsilon$ and therefore $m^*(cO) - m^*(E) < epsilon$. This does not imply that $m^*(cO tilde E) < epsilon$, because the excision property
  $ m^*(cO tilde E) = m^*(cO) - m^*(E) $
  is false unless $E$ is measurable.
]

== Countable Additivity, Continuity, and the Borel-Cantelli Lemma

#de[
  The restriction of the set function outer measure to the class of measurable sets is called *Lebesgue measure*. It is denoted by $m$, so that if $E$ is a measurable set, its Lebesgue measure, $m(E)$, is defined by
  $ m(E) = m^*(E). $
]

#prop[
  _Lebesgue measure is countably additive_, that is, if ${E_k}_(k=1)^oo$ is a countable disjoint collection of measurable sets, then its union $union_(k=1)^oo E_k$ also is measurable and
  $ m(union.big_(k=1)^oo E_k) = sum_(k=1)^oo m(E_k). $
]

#tho[
  The set function Lebesgue measure, defined on the $sigma$-algebra of Lebesgue measurable sets, assigns length to any interval, is translation invariant, and is countable additive.
]

#tho("the Countinuity of Measure")[
  Lebesgue measure possesses the following continuity properties:
  
  + If ${A_k}_(k=1)^oo$ is an ascending collection of measurable sets, then
  $ m(union.big_(k=1)^oo A_k) = lim_(k -> oo) m(A_k). $
  
  + If ${B_k}_(k=1)^oo$ is a descending collection of measurable sets and $m(B_1) < oo$, then
  $ m(sect.big_(k=1)^oo B_k) = lim_(k -> oo) m(B_k). $
]

#note("The Borel-Cantelli Lemma")[
  Let ${E_k}_(k=1)^oo$ be a countable collection of measurable sets for which $sum_(k=1)^oo m(E_k) < oo$. Then almost all $x in RR$ belong to at most finitely many of the $E_k$'s.
]

#rem[
  In our forthcoming study of Lebesgue integration it will be apparent that t is the countable additivity of Lebesgue measure that provides the Lebesgue interval with its decisive advantage over the Riemann integral.
]

== Nonmeasurable Sets

#lem[
  Let $E$ be a bounded measurable set of real numbers. Suppose there is a bounded, countably infinite set of real numbers $Lambda$ for which the collection of translates of $E, {lambda + E}_(lambda in Lambda)$, is disjoint. Then $m(E) = 0$.
]

#tho("Vitali")[
  Any set $E$ of real numbers with positive outer measure contains a subset that fails to be measurable.
]

#tho[
  There are disjoint sets of real numbers $A$ and $B$ for which
  $ m^*(A union B) < m^*(A) + m^*(B). $
]

== The Cantor Set and the Cantor-Lebesgue Function

#prop[
  The Cantor set $bold(C)$ is a closed, uncountable set of measure zero.
]

#prop[
  The Cantor-Lebesgue function $phi$ is an increasing countinuous function that maps $[0, 1]$ onto $[0, 1]$. Its derivative exists on the open set $cO$, the complement in $[0, 1]$ of the Cantor set,
  $ phi' = 0 "on" cO "while" m(cO) = 1. $
]

#prop[
  Let $phi$ be the Cantor-Lebesgue function and define the function $psi$ on $[0, 1]$ by
  $ psi(x) = phi(x) + x "for all" x in [0, 1]. $
]<prop21>

#prop[
  There is a measurable set, a subset of the Cantor set, that is not a Borel set.
]

= Lebesgue Measurable Functions

== Sums, Products, and Compositions

#prop[
  Let the function $f$ have a measurable domain $E$. Then the following statements are equivalent:
  
  + For each real number $c$, the set ${x in E | f(x) > c}$ is measurable.
  + For each real number $c$, the set ${x in E | f(x) >= c}$ is measurable.
  + For each real number $c$, the set ${x in E | f(x) < c}$ is measurable.
  + For each real number $c$, the set ${x in E | f(x) <= c}$ is measurable.
  
  Each of these properties implies that for each extended real number $c$,
  $ "the set" {x in E | f(x) = c} "is measurable". $
]<prop1>

#de[
  An extended real-valued function $f$ defined on $E$ is said to be *Lebesgue measurable*, or simply *measurable*, provided its domain $E$ is measurable and it satisfies one of the four statements of @prop1.
]

#prop[
  Let the function $f$ be defined on a measurable set $E$. Then $f$ is measurable if and only if for each open set $cO$, the inverse image of $cO$ under $f$, $f^(-1)(cO) = {x in E | f(x) in cO}$, is measurable.
]

#prop[
  A real-valued function that is continuous on its measurable domain is measurable.
]

#prop[
  A monotone function that is defined on an interval is measurable.
]

#prop[
  Let $f$ be an extended real-valued function on $E$.
  
  + If $f$ is measurable on $E$ and $f = g$ a.e. on $E$, then $g$ is measurable on $E$.
  + For a measurable subset $D$ of $E$, $f$ is measurable on $E$ if and only if the restrictions of $f$ to $D$ and $E tilde D$ are measurable.
]

#tho[
  Let $f$ and $g$ be measurable functions on $E$ that are finite a.e. on $E$.
  
  (Linearity) For any $alpha$ and $beta$,
  $ alpha f + beta g "is measurable on" E. $
  
  (Products)
  $ f g "is measurable on" E. $
]

#eg[
  There are two measurable real-valued functions, each defined on all of $RR$, whose composition fails to be measurable. By @prop21, there is a continuous, strictly increasing function $psi$ decined on $[0,1]$ and a measurable subset $A$ of $[0,1]$ for which $psi(A)$ is nonmeasurable. Extend $psi$ to a continuous, strictly increasing function that maps $RR$ onto $RR$. The function $psi^(-1)$ is continuous and therefore is measurable. On the other hand, $A$ is a measurable set and so its characteristic function $chi_A$ is a measurable function. We claim that the composition $f = chi_A circle.tiny psi^(-1)$ is not measurable. Indeed, if $I$ is any open interval containing $1$ but not $0$, then its inverse image under $f$ is the nonmeasurable set $psi(A)$.
]

#prop[
  Let $g$ be a measurable real-valued function defined on $E$ and $f$ a continuous real-valued function defined on all of $RR$. Then the composition $f circle.tiny g$ is a measurable function on $E$.
]

#prop[
  For a finite family ${f_k}_(k=1)^n$ of measurable functions with common domain $E$, the functions $max{f_1, dots.c, f_n}$ and $min{f_1, dots.c, f_n}$ also are measurable.
]

== Sequential Pointwise Limits and Simple Approximation

#de[
  For a sequence ${f_n}$ of functions with common domain $E$, a function $f$ on $E$ and a subset $A$ of $E$, we say that
  
  + The sequence ${f_n}$ converges to $f$ pointwise on $A$ provided $
    lim_(n -> oo) f_n (x) = f(x) "for all" x in A.
  $
  + The sequence ${f_n}$ converges to $f$ pointwise a.e. on A provided it converges to $f$ pointwise on $A tilde B$, where $m(B) = 0$.
  + The sequence ${f_n}$ converges to $f$ uniformly on $A$ provided for each $epsilon > 0$, there is an index $N$ for which $
    |f - f_n| < epsilon "on" A "for all" n >= N.
  $
]

#prop[
  Let ${f_n}$ be a sequence of measurable functions on $E$ that converges pointwise a.e. on $E$ to the function $f$. Then $f$ is measurable.
]

#de[
  A real-valued function $phi$ defined on a measurable set $E$ is called *simple* provided it is measurable and takes only a finite number of values.
]

#note("The Simple Approximation Lemma")[
  Let $f$ be a measurable real-valued function on $E$. Assume $f$ is bounded on $E$, that is, there is an $M >= 0$ for which $|f| <= M$ on $E$. Then for each $epsilon > 0$, there are simple functions $phi_epsilon$ and $psi_epsilon$ defined on $E$ which have the following approximation properties:
  $
  phi_epsilon <= f <= psi_epsilon "and" 0 <= psi_epsilon - phi_epsilon < epsilon "on" E.
  $
]

#note("The Simple Approximation Theorem")[
  Ax extended real-valued function $f$ on a measurable set $E$ is measurable if and only if there is a sequence ${phi_n}$ of simple functions on $E$ which converges pointwise on $E$ fo $f$ and has the property that
  $
  |phi_n| <= |f| "on" E "for all" n.
  $
  If $f$ is nonnegative, we may choose ${phi_n}$ to be increasing.
]

== Littlewood's Three Principles, Egoroffs's Theorem, and Lusin's Theorem

#note("Egoroff's Theorem")[
  Assume $E$ has finite measure. Let ${f_n}$ be a sequence of measurable functions on $E$ that converges pointwise on $E$ to the real-valued function $f$. Then for each $epsilon > 0$, there is a closed set $F$ contained in $E$ for which $
  {f_n} -> f "uniformly on" F "and" m(E tilde F) < epsilon.
  $
]

#lem[
  Under the assumptions of Egoroff's Theorem, for each $eta > 0$ and $delta > 0$, there is a measurable subset $A$ of $E$ and and index $N$ for which $
    |f_n - f| < eta "on" A "for all" n >= N "and" m(E tilde A) < delta.
  $
]

#prop[
  Let $f$ be a simple function defined on $E$. Then for each $epsilon > 0$, there is a continuous function $g$ on $RR$ and a closed set $F$ contained in $E$ for which $
    f = g "on" F "and" m(E tilde F) < epsilon.
  $
]

#note("Lusin's Theorem")[
  Let $f$ be a real-valued measurable function on $E$. Then for each $epsilon > 0$, there is a continuous function $g$ on $RR$ and a closed set $F$ contained in $E$ for which $
    f = g "on" F "and" m(E tilde F) < epsilon.
  $
]

= Lebesgue Integration

== The Rimemann Integral

#eg("Dirichlet's Function")[
  Define $f$ on $[0, 1]$ by setting $f(x) = 1$ if $x$ is rational and $0$ if $x$ is irratinal. Let $P$ be any partition of $[0, 1]$. By the density of the rationals and the irrationals, $
    L(f, P) = 0 "and" U(f, P) = 1.
  $ Thus $
    (R)dint(0, 1) f = 0 < 1 = (R) uint(0, 1) f,
  $ so $f$ is not Riemann integrable. The set of rational numbers in $[0, 1]$ is countable. Let ${q_k}_(k=1)^oo$ be an enumeration of the rational numbers in $[0, 1]$. For a natural number $n$, define $f_n$ on $[0, 1]$ by setting $f_n (x) = 1$, if $x = q_k$ for some $q_k$ with $1 <= k <= n$, and $f(x) = 0$ otherwise. Then each $f_n$ is a step function, so it is Riemann integrable. Thus, ${f_n}$ is an increasing sequence of Riemann integrable functions on $[0, 1]$, $
    |f_n| <= 1 "on" [0, 1] "for all" n
  $ and $
    {f_n} -> f "pointwise on" [0, 1]. 
  $ However, the limit functions $f$ fails to be Riemann integrable on $[0, 1]$.
]

== The Lebesgue Integral of a Bounded Measurable Function over a Set of Finite Measure

#de[
  For a simple function $psi$ defined on a set of finite measure $E$, we define the integral of $psi$ over $E$ by $
    integral_E psi = sum_(i=1)^n a_i dot m(E_i),
  $ where $psi$ has the canonical representation.
]

#lem[
  Let ${E_i}_(i=1)^n$ be a finite disjoint collection of measurable subsets of a set of finite measure $E$. For $1 <= i <= n$, let $a_i$ be a real number. $
    "If" phi = sum_(i=1)^n a_i dot chi_E_i "on" E, "then" integral_E phi = sum_(i=1)^n a_i dot m(E_i). 
  $
]

#prop("Linearity and Monotonicity of Integration")[
  Let $phi$ and $psi$ be simple functions defined on a set of finite measure $E$. Then for any $alpha$ and $beta$, $
    integral_E (alpha phi + beta psi) = alpha integral_E phi + beta integral_E psi.
  $ Moreover, $
    "if" phi <= psi "on" E, "then" integral_E phi <= integral_E psi.
  $
]

#de[
  A bounded function $f$ on a domain $E$ of finite measure is said to be *Lebesgue integrable* over $E$ provided its upper and lower Lebesgue integrals over $E$ are equal. The common value of the upper and lower integrals is called the *Lebesgue integral*, or simply the integral, of $f$ over $E$ and is denoted by $integral_E f$.
]

#tho[
  Let $f$ be a bounded function defined on the closed, bounded interval $[a, b]$. If $f$ is Riemann integrable over $[a, b]$, then it is Lebesgue integrable over $[a, b]$ and the two integrals are equal.
]

#eg[
  The set $E$ of rational numbers in $[0, 1]$ is a measurable set of measure zero. The Dirichlet function $f$ is the restriction to $[0, 1]$ of the characteristic function of $E$, $chi_E$. Thus $f$ is integrable over $[0, 1]$ and $
    integral_([0, 1]) f = integral_([0, 1]) 1 dot chi_E = 1 dot m(E) = 0.
  $ We have shown that $f$ is not Riemann integrable over $[0, 1]$.
]

#tho[
  Let $f$ be a bounded measurable function on a set of finite measure $E$. Then $f$ is integrable over $E$.
]

#tho("Linearity and Monotonicity of Integration")[
  Let $f$ and $g$ be bounded measurable functions on a set of finite measure $E$. Then for any $alpha$ and $beta$, $
    integral_E (alpha f + beta g) = alpha integral_E f + beta integral_E g.
  $ Moreover, $
    "if" f <= g "on" E, "then" integral_E f <= integral_E g.
  $
]

#cor[
  Let $f$ be a bounded measurable function on a set of finite measure $E$. Suppose $A$ and $B$ are disjoint measurable subsets of $E$. Then $
    integral_(A union B) f = integral_A f + integral_B f.
  $
]

#cor[
  Let $f$ be a bounded measurable function on a set of finite measure $E$. Then $
    abs(integral_E f) <= integral_E |f|.
  $
]

#prop[
  Let ${f_n}$ be a sequence of bounded measurable functions on a set of finite measure $E$. $
    "If" {f_n} -> f "uniformly on" E, "then" lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#eg[
  For each natural number $n$, define $f_n$ on $[0, 1]$ to have the value $0$ if $x >= 2\/n$, have $f(1\/n) = n$, $f(0) = 0$ and to be linear on the intervals $[0, 1 \/ n]$ and $[1 \/ n, 2 \/ n]$. Observe that $integral_0^1 f_n = 1$ for each $n$. Define $f equiv 0$ on $[0, 1]$. Then $
    {f_n} -> f "pointwise on" [0, 1], "but" lim_(n -> oo) integral_0^1 f_n  != integral_0^1 f.
  $ Thus, pointwise convergence alone is not sufficient to justify passage of the limit under the integral sign.
]

#note("The Bounded Convergence Theorem")[
  Let ${f_n}$ be a sequence of measurable functions on a set of finite measure $E$. Suppose ${f_n}$ is uniformly pointwise bounded on $E$, that is, there is a number $M >= 0$ for which $
    |f_n| <= M "on" E "for all" n. \
    "If" {f_n} -> f "pointwise on" E, "then" lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#rem[
  Prior to the proof of the Bounded Convergence Theorem, no use was made of the countable additivity of Lebesgue measure on the real line. Only finite additivity was used, and it was used just once, in the proof of Lemma 1. But for the proof of the Bounded Convergence Theorem we used Egoroff's Theorem. The proof of Egoroff's Theorem needed the continuity of Lebesgue measure, a consequence of countable additivity of Lebesgue measure.
]

== The Lebesgue Integral of a Measurable Nonnegatice Function

#de[
  For $f$ a nonnegative measurable function on $E$, we define the integral of $f$ over $E$ by $
    integral_E f = sup{integral_E h | h "bounded, measurable, of finite support and" 0 <= h <= f "on" E}.
  $
]

#note("Chebychev's Inequality")[
  Let $f$ be a nonnegative measurable function on $E$. Then for any $lambda > 0$, $
    m{x in E | f(x) >= lambda} <= 1 / lambda dot integral_E f.
  $
]

#prop[
  Let $f$ be a nonnegative measurable function on $E$. Then $
    integral_E f = 0 "if and only if" f = 0 "a.e. on" E.
  $
]

#tho("Linearity and Monotonicity of Integration")[
  Let $f$ and $g$ be nonnegative measurable functions on a set of finite measure $E$. Then for any $alpha > 0$ and $beta > 0$, $
    integral_E (alpha f + beta g) = alpha integral_E f + beta integral_E g.
  $ Moreover, $
    "if" f <= g "on" E, "then" integral_E f <= integral_E g.
  $
]

#tho("Additivity over Domains of Integration")[
  Let $f$ be a nonnegative measurable function on $E$. If $A$ and $B$ are disjoint measurable subsets of $E$, then $
    integral_(A union B) f = integral_A f + integral_B f.
  $ In particular, if $E_0$ is a subset of $E$ of measure zero, then $
    integral_E f = integral_(E tilde E_0) f.
  $
]

#note("Fatou's Lemma")[
  Let ${f_n}$ be a sequence of nonnegative measurable functions on $E$. $
    "If" {f_n} -> f "pointwise a.e. on" E, "then" integral_E f <= lim inf integral_E f_n.
  $
]

#eg[
  Let $E = (0, 1]$ and for a natural number $n$, define $f_n = n dot chi_((0, 1\/n))$. Then ${f_n}$ converges pointwise on $E$ to $f equiv 0$ on $E$. However, $
    integral_E f = 0 < 1 = lim_(n -> oo) integral_E f_n .
  $ As another example of strict inequality in Fatou's Lemma, let $E = RR$ and for a natural number $n$, define $g_n = chi_((n, n+1))$. Then ${g_n}$ converges pointwise on $E$ to $g equiv 0$ on $E$. However, $
    integral_E g = 0 < 1 = lim_(n -> oo) integral_E g_n.
  $
]

#note("The Monotone Convergence Theorem")[
  Let ${f_n}$ be an increasing sequence of nonnegative measurable functions on $E$. $
    "If" {f_n} -> f "pointwise a.e. on" E, "then" lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#cor[
  Let ${u_n}$ be a sequence of nonnegative measurable functions on $E$. $
    "If" f = sum_(n = 1)^oo u_n "pointwise a.e. on" E, "then" integral_E f = sum_(n=1)^oo integral_E f.
  $
]

#de[
  A nonnegative measurable function $f$ on a measurable set $E$ is said to be *integrable* over $E$ provided $
    integral_E f < +oo.
  $
]

#prop[
  Let the nonnegative function $f$ be integrable over $E$. Then $f$ is finite a.e. on E.
]

#note("Beppo Levi's Lemma")[
  Let ${f_n}$ be an increasing sequence of nonnegative measurable functions on $E$. If the sequence of integrals ${integral_e f_n}$ is bounded, then ${f_n}$ converges posintwise on $E$ to a measurable functions $f$ that is finite a.e. on $E$ and $
    lim_(n -> oo) integral_E f_n = integral_E f < +oo.
  $
]

== The General Lebesgue Integral

#prop[
  Let $f$ be a measurable function on $E$. Then $f^+$ and $f^-$ are integrable over $E$ if and only if $|f|$ is integrable over $E$.
]

#de[
  A measurable function $f$ on $E$ is said to be *integrable* over $E$ provided $|f|$ is integrable over $E$. When this is so we define the integral of $f$ over $E$ by $
    integral_E f = integral_E f^+ - integral_E f^-.
  $
]

#prop[
  Let $f$ be integrable over $E$. Then $f$ is finite a.e. on $E$ and $
    integral_E f = integral_(E tilde E_0) f "if" E_0 subset.eq E "and" m(E_0) = 0.
  $
]

#prop("The Integral Comparison Test")[
  Let $f$ be a measurable function on $E$. Suppose there is a nonnegative function $g$ that is integrable over $E$ and dominates $f$ in the sense that $
    |f| <= g "on" E.
  $ Then $f$ is integrable over $E$ and $
    abs(integral_E f) <= integral_E |f|.
  $
]

#tho("Linearity and Monotonicity of Integration")[
  Let $f$ and $g$ be integrable over $E$. Then for any $alpha > 0$ and $beta > 0$, the function $alpha f + beta g$ is integrable over $E$ and $
    integral_E (alpha f + beta g) = alpha integral_E f + beta integral_E g.
  $ Moreover, $
    "if" f <= g "on" E, "then" integral_E f <= integral_E g.
  $
]

#tho("Additivity over Domains of Integration")[
  Let $f$ be integrable over $E$. Assume $A$ and $B$ are disjoint measurable subsets of $E$. Then $
    integral_(A union B) f = integral_A f + integral_B f.
  $
]

#note("The Lebesgue Dominated Convergence Theorem")[
  Let ${f_n}$ be a sequence of measurable functions on $E$. Suppose there is a function $g$ that is integrable over $E$ and dominates ${f_n}$ on $E$ in the sense that $|f_n| <= g$ on $E$ for all $n$. $
    "If" {f_n} -> f "pointwise a.e. on" E, "then" f "is integrable over" E "and" lim_(n -> oo)
 integral_E f_n = integral_E f.
 $
]

#tho("General Lebesgue Dominated Convergence Theorem")[
  Let ${f_n}$ be a sequence of measurable functions on $E$ that converges pointwise a.e. on $E$ to $f$. Suppose there is a sequence ${g_n}$ of nonnegative measurable functions on $E$ that converges pointwise a.e. on $E$ to $g$ and dominates ${f_n}$ on $E$ in the sense that $
    |f_n| <= g_n "on" E "for all" n. \
    "If" lim_(n -> oo) integral_E g_n = integral_E g < +oo, "then" lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#rem[
  If Fatou's Lemma and the Lebesgue Dominated Convergence Theorem, the assmption of pointwise convergence a.e. on $E$ rather than on all of $E$ is not a decoration pinned on to honor generality. It is necessary for future applications of these results. We provide one illystration of this necessity. Suppose $f$ is an increasing function on all of $RR$. A forthcoming theorem of Lebesgue(Lebesgue's Theorem of Chapter 6) tells us that $
    lim_(n -> oo) (f(x + 1\/n) - f(x)) / (1 \/ n) = f'(x) "for almost all" x.
  $ From this and Fatou's Lemma we will show that for any closed, bounded interval $[a, b]$, $
    integral_a^b f'(x) dd(x) <= f(b) - f(a).
  $ In general, given a nondegenerate closed, bounded interval $[a, b]$ and a subset $A$ of $[a, b]$ that has measure zero, there is an increasing function $f$ on $[a, b]$ for which the limit in previous formula fails to exist at each point in $A$.
]

== Contable Addativity and Continuity of Integration

#tho("The Countable Additivity of Integration")[
  Let $f$ be integrable over $E$ and ${E_n}_(n=1)^oo$ a disjoint countable collection of measurable subsets of $E$ whose union is $E$. Then $
    integral_E f = sum_(n=1)^oo integral_E_n f.
  $
]

#tho("The Continuity of Integration")[
  Let $f$ be integrable over $E$.
  
  + If ${E_n}_(n=1)^oo$ is an ascending countable collection of measurable subsets of $E$, then $
    integral_(union.big_(n=1)^oo E_n) f = lim_(n -> oo) integral_E_n f.
  $
  
  + If ${E_n}_(n=1)^oo$ is a descending countable collection of measurable subsets of $E$, then $
    integral_(sect.big_(n=1)^oo E_n) f = lim_(n -> oo) integral_E_n f.
  $
]

== Uniform Integrability: The Vitali Convergence Theorem

#lem[
  Let $E$ be a set of finity measure and $delta > 0$. Then $E$ is the disjoint union of a finite collection of sets, each of which has measure less then $delta$.
]

#prop[
  Let $f$ be a measurable function on $E$. If $f$ is integrable over $E$, then for each $epsilon > 0$, there is a $delta > 0$ for which $
    "if" A subset.eq E "is measurable and" m(A) < delta, "then" integral_A |f| < epsilon.
  $ Conversely, in the case $m(E) < oo$, if for each $epsilon > 0$, there is a $delta > 0$ for which previous formula holds, then $f$ is integrable over $E$.
]

#de[
  A family $cF$ of measurable functions on $E$ is said to be *uniformly integrable over* $E$ provided for each $epsilon > 0$, there is a $delta > 0$ such that for each $f in cF$, $
    "if" A subset.eq E "is measurable and" m(A) < delta, "then" integral_A |f| < epsilon.
  $
]

#prop[
  Let ${f_k}_(k=1)^n$ be a finite collection of functions, each of which is integrable over $E$. Then ${f_k}_(k=1)^n$ is uniformly integrable.
]

#prop[
  Assume $E$ has finite measure. Let the sequence of functions ${f_n}$ be uniformly integrable over $E$. If ${f_n} -> f$ pointwise a.e. on $E$, then $f$ is integrable over $E$.
]

#note("The Vitali Convergence Theorem")[
  Let $E$ be of finite measure. Suppose the sequence of functions ${f_n}$ is uniformly integrable over $E$. $ 
    "If" {f_n} -> f "pointwise a.e. on" E, "then" f "is integrable over" E "and" lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#tho[
  Let $E$ be of finite measure. Suppose ${h_n}$ is a sequcence of nonnegative integrable functions that converges pointwise a.e. on $E$ to $h equiv 0$. Then $
    lim_(x -> oo) integral_E h_n = 0 "if and only if" {h_n} "is uniformly integrable over" E. 
  $
]

= Lebesgue Integration: Further Topics

== Uniform Integrability and Tightness: A General Vitali Convergence Theorem

#prop[
  Let $f$ be integrable over $E$. Then for each $epsilon > 0$, there is a set of finite measure $E_0$ for which $
  integral_(E tilde E_0)|f| < epsilon.
  $
]

#de[
  A family $cF$ of measurable functions on $E$ is said to be
  *tight* over $E$ provided for each $epsilon > 0$, there is a subset $E_0$ of $E$ of finite measure for which $
  integral_(E tilde E_0) |f| < epsilon "for all" f in cF.
  $
]

#note("The Vitali Convergence Theorem")[
  Let ${f_n}$ be a sequence of functions on $E$ that is uniformly integrable and tight over $E$. Suppose ${f_n} -> f$ pointwise a.e. on $E$. Then $f$ is integrable over $E$ and $
    lim_(n -> oo) integral_E f_n = integral_E f.
  $
]

#cor[
  Let ${h_n}$ be a sequence of nonnegative integrable functions on $E$. Suppose ${h_n} -> 0$ for almost all $x$ in $E$. Then $
  lim_(n -> oo) integral_E h_n = 0 "if and only if" {h_n} "is uniformly integrable and tight over" E.
  $
]

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

#de[
  Let ${f_n}$ be a sequence of measurable functions on $E$ and $f$ a measurable function on $E$ for which $f$ and each $f_n$ is finite a.e. on $E$. The sequence ${f_n}$ is said to *converge in measure* on $E$ to $f$ provided for each $eta > 0$. $
    lim_(n->oo) m {x in E | |f_n (x) - f(x)| > eta} = 0.
  $
]

#prop[
  Assume $E$ has finite measure. Let ${f_n}$ be a sequence of measurable functions on $E$ that converges pointwise a.e. on $E$ to $f$ and $f$ is finite a.e. on $E$. Then ${f_n} -> f$ in measure on $E$.
]

#eg[
  Consider the sequence of subintervals of $[0,1]$, ${I_n}_(n=1)^oo$, which has initial terms listed as $
  [0,1], [0,1/2], [1/2, 1], [0,1/3], [1/3, 2/3], [2/3, 1],\
  [0,1/4], [1/4, 1/2], [1/2, 3/4], [3/4, 1], ...
  $ For eahc index $n$, define $f_n$ to be the restriction to $[0,1]$ of the characteristic function of $I_n$. Let $f$ be the function that is identically zero on $[0,1]$. We claim that ${d_n} -> f$ in measure. Indeed, observe that $lim_(n->oo)cal(l)(I_n) = 0$ since for each natural number $m$, $
  "if" n > 1 + ... + m = (m(m+1))/2, "then" cal(l)(I_n) < 1/m.
  $ Thus, for $0 < eta < 1$, since ${x in E | | f_n (x) - f(x)| > eta} subset.eq I_n$, $
  0 <= lim_(n -> oo)m{x in E| abs(f_n (x) = f(x)) > eta} <= lim_(n -> oo) cal(l)(I_n) = 0.
  $ However, it is clear that there is no point $x$ in $[0,1]$ at which ${f_n (x)}$ converges to $f(x)$ since for each point $x$ in $[0,1]$, $f_n (x) = 1$ for infinitely many indices $n$, while $f(x) = 0$.
]

#tho("Riesz")[
  If ${f_n} -> f$ in measure on $E$, then there is a subsequence${f_n_k}$ that converges pointwise a.e. on $E$ to $f$.
]

#cor[
  Let ${f_n}$ be a sequence of nonnegative integrable functions on $E$. Then $
  lim_(n -> oo) integral_E f_n = 0 \ 
  "if and only if" \
  {f_n} -> 0 "in measure on" E "and" {f_n} "is uniformly integrable and tight over" E.
  $
]

== Chracterizations of Riemann and Lebesgue Integrability

#lem[
  Let ${phi_n}$ and ${psi_n}$ be sequences of functions, each of which is integrable over $E$, such that ${phi_n}$ is increasing while ${psi_n}$ is decreasing on $E$. Let the function $f$ on $E$ have the property that $
  phi_n <= f <= psi_n "on" E "for all" n.
  $ If $
  lim_(n -> oo) integral_E [psi_n - phi_n] = 0,
  $ then $
  {phi_n} -> f "pointwise a.e. on" E, {phi_n} -> f "pointwise a.e. on" E, f "is integrable over" E,\
  lim_(n -> oo) integral_E phi_n = integral_E f "and" lim_(n -> oo) integral_E psi_n = integral_E f.
  $
]

#tho[
  Let $f$ be a bounded function on a set of finite measure $E$. Then $f$ is Lebesgue integrable over $E$ if and only if it is measurable. 
]

#tho("Lebesgue")[
  Let $f$ be a bounded function on the closed, bounded interval $[a,b]$. Then $f$ is Riemann integrable over $[a,b]$ if and only if the set of points in $[a,b]$ at which $f$ fails to be continuous has measure zero.
]

#task[
  Let $f$ and $g$ be bounded functions that are Riemann integrable over $[a,b]$. Show that the product $f g$ also is Riemann integrable over $[a,b]$.
]

#task[
  Let $f$ be a bounded function on $[a,b]$ whose set of discontinuities has measure zero. Show that $f$ is measurable. Then show that the same holds without the assumption of boundedness.
]

#task[
  Let $f$ be a function on $[0,1]$ that is continuous on $(0,1]$. Show that it is possible for the sequence ${integral_([1\/n,1])f}$ to converge and yet $f$ is not Lebesgue integrable over $[0,1]$. Can this happen if $f$ is nonnegative? 
]
