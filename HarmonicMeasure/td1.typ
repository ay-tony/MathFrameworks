#import "@local/aytony:1.0.0": *
#show: aytony-traits

#set par(first-line-indent: 2em) // TODO

#align(center)[
  #text(20pt)[
    *Harmonic Measure TD1*
  ]

  #datetime(year: 2025, month: 3, day: 23).display("[year] 年 [month] 月 [day] 日")

  aytony
]

#prop[Polar coordinates
  There exists a Borel measure $sigma_(n - 1)$ on $S_(n - 1)$ such that
  $
    integral_(bb(R)^n) f upright(d) cal(L)_n = integral.double_((r , x) in (0 , + oo) times S_(n - 1)) f (r x) r^(n - 1) upright(d) r upright(d) sigma_(n - 1) (x)
  $
  if $f$ is measurable and nonnegative, or if $f$ is integrable.

  In particular, if $f$ is radial, i.e., $f (x) = phi (lr(|x|))$,
  $
    integral_(bb(R)^n) phi (lr(|x|)) upright(d) cal(L)_n = s_(n - 1) integral_0^(+ oo) r^(n - 1) phi (r) upright(d) r ,
  $
  where $ s_(n - 1) = frac(2 pi^(n \/ 2), Gamma (n \/ 2)) $ is the area of
  the unit sphere in $bb(R)^n$.
]

#de("The Hardy–Littlewood Operator")[
  If $f$ is a locally integrable function on $bb(R)^n$, one sets
  $ uM f (x) = sup_(r > 0) 1 / lr(|B (x , r)|) integral_(B (x , r)) lr(|f (y)|) upright(d) y . $
  $uM f$ is called the *Hardy–Littlewood maximal function* and the sublinear operation $f arrow.r.bar uM f$ the *Hardy–Littlewood maximal operator*.
]

#prop[
  + There exists a constant $C > 0$ (depending on the dimension $n$) such that, for all $f$ and all $t > 0$, one has $ lr(|{ uM f > t }|) lt.eq C / t||f||_1 . $
  + For any $p in (1 , + oo)$, there exists $C_p > 0$ (depending on $n$) such that, for any $f$, one has $ ||uM f||_p lt.eq C_p||f||_p. $
]

#ex[
  A function from a topological space $X$ to $bb(R)$ is said to be lower
  semicontinuous (lsc, for short) if, for all $t in bb(R)$, the set
  ${ f > t }$ is open. Show that the function $uM f$ is lsc, hence
  measurable.
]
#pf[
  记 $ uM f(x)
  &= sup_(r>0)f_r (x)
  &= sup_(r>0)integral.dash_(B(x, r)) |f(y)|dd(y), $ 那么有 ${f > t} = union.big_(r > 0){f_r > t}$，只要证明每个 ${f_r > t}$ 是开集即可，那么只要证明 $forall r > 0, f_r (x)$ 对 $x$ 连续。对 $f_r$ 换元得到 $ f_r (x)
  &= integral.dash_B(x, r)|f(y)|dd(y)\
  &= integral.dash_B(0, r)|f(x+y)|dd(y)\
  &= 1 / (abs(B(0, r)))integral_RR 1_B(0,r)|f(x+y)|dd(y). $ 取 $x_n -> x$，首先有 $ 1_B(0,r)|f(x_n+y)| -->^"a.e." 1_B(0,r)|f(x+y)|, $ 且在 $|x_n - x| < r$ 时有 $ 1_B(0,r)|f(x_n+y)| <= 1_B(0,2r)|f(x+y)| $ 而后者可积，那么由 Lebesgue 控制收敛定理知道 $f_r (x_0) -> f_r (x)$，从而 $f_r$ 连续。
]

#ex[
  Let $a$ and $b$ be two numbers such that $a < b$. Compute
  $uM bb(1)_([a , b])$.
]
#pf[
  对自变量分类易得 $ uM 1_[a,b]
  &= cases(
    (b-a) / (2(x-a))\, x>b,
    1 / 2\, x in {a, b},
    1\, x in (a, b),
    (b-a) / (2(b-x))\, x<a.
  ) $
]

#ex[
  Let $f = bb(1)_(B (0 , 1))$ be the indicator function of the unit ball
  in $bb(R)^n$. Show that, for $lr(|x|) > 1$,
  $uM f (x) lt.eq C \/ (lr(|x|) - 1)^n$, where $C > 0$ is a constant.
  Conclude that, for $p > 1$, $uM f in L^p (bb(R)^n)$.
]
#pf[
  沿用之前对 $f_r (x)$ 的记号，题目也即证明 $ uM f(x) = sup_(r>0)f_r (x) <= C / (|x|-1)^n. $ 对 $forall r > |x| + 1$ 有 $ f_r (x) = display(integral_RR f(y) dd(y)) / abs(B(x,r)) = abs(B(0,1)) / abs(B(x,r)) = 1 / r^n <= 1 / (|x|-1)^n. $ 对 $forall r in [ |x|-1, |x|+1 ]$ 有 $ f_r (x)
  &= (integral_B(x,r) f(y) dd(y)) / abs(B(x,r)) <= abs(B(0,1)) / abs(B(x, |x|-1)) = 1 / (|x|-1)^n $ 对 $forall r < |x|-1$, $f_r (x)$ 无意义。
]

#ex[
  Prove the second assertion ($L^p$-boundedness of $M$) of the theorem above.
]
#pf[
  为去掉绝对值，不妨设 $f >= 0$。首先断言算子 $uM$ 满足 $uM (f + g) <= uM f + uM g$。令 $ g(x) = cases(
    f(x)\, f(x) > t\/2,
    0\, f(x)<=t\/2
  ), quad h(x) = f(x) - g(x), $ 那么 $f = g + h$，$uM f <= uM g + uM h$，而 $uM h <= sup h = t\/2$，那么就知道 ${M f > t} subset {M g > t\/2}$，再结合第一条命题就知道 $ abs({M f > t}) <= abs({M g > t\/2}) <= (2C) / t integral_(RR^n) g dd(x) = (2C) / t integral_{f > t\/2} f dd(x), $ 那么直接应用积分变换 $ integral_(RR^n) f^p dd(x) = integral_0^oo p t^(p-1) |{f > t}| dd(t) $ 就知道 $ ||M f||^p
  &= integral_RR uM f^p dd(x) \
  &= integral_0^oo p t^(p-1) |{uM f > t}| dd(t)\
  &<= integral_0^oo p t^(p-1) (2 C) / t integral_{f(x) > t\/2} f dd(x) dd(t)\
  &= 2 C p integral_(RR^n) f(y) integral_0^(2 f(y)) t^(p-2) dd(t, y)\
  &= (2^p C p) / (p-1) ||f||_p. $ 其中用了 Fubini 定理进行积分换序。
]

#ex[
  If $f in L^1 (bb(R)^n)$ such that $f eq.not 0$, then
  $uM f in.not L^1 (bb(R)^n)$ (prove that $ uM f (x) gt.eq C / lr(|x|)^n $ for
  $lr(|x|)$ large enough, where $C > 0$ is a constant).
]
#pf[
  这里的 $f != 0$ 应当是 $f != 0$ a.e.，所以存在球 $B(0, r)$ 使得 $ integral_B(0, r) |f(x)| dd(x) = A > 0. $ 对 $|x| > r$，考虑 $B(x, 2|x|)$ 上的积分，得到 $ uM f(x)
  &>= 1 / abs(B(x, 2|x|)) integral_B(x, 2|x|) |f(x)| dd(x)\
  &= C / (2^n|x|^n) dot A. $
]

#ex[
  + Let $rho > 3$. Let $cal(B)$ be a collection of balls of bounded radii. Prove that one can extract from $cal(B)$ a sequence of disjoint balls $({ B_j })$ such that $ cal(L) (union.big_(B in cal(B)) B) lt.eq sum_(j gt.eq 1) cal(L)(B_j^(\*)) = rho^n sum_(j gt.eq 1) cal(L)(B_j), $ where $B_j^(\*)$ is the ball with the same center as $B_j$ and whose radius is $rho$ times the radius of $B_j$.
  + Give a proof of the first assertion of Theorem above which does not use the regularity of the Lebesgue measure.
]
#pf[
  Set $epsilon = (rho - 3) \/ rho$ and $sB_0 = {B_j}$. Choose $B'_1 in sB_0$ such that $ r_(B'_1) > (1 - epsilon) sup_(B in sB_0) {r_B}. $ Set $sB_1 = {B in sB_0 : B inter B_1' = diameter}$. Choose $B_2 ' in sB_1$ similarly, i.e. such that $ r_(B'_2) > (1 - epsilon)sup_(B in sB_1) {r_B}. $ So on we can obtain a sequence of balls ${B_n '}$ and ${sB_n}$. We assert that ${B_n '}$ is the ball required. From the process of construction we can easily observe that ${B_n '}$ are disjoint. First we prove that for $B in sB_(i) \\ sB_(i+1)$ we have $B subset rho B_i '$. Since $B inter B_i ' != diameter$, $r_B <= sup_(B^* in sB_(i)) {r_(B^*)}$ then $ d(c_(B_i '), c_B) + r_B <= r_(B_i ') + 2 r_B <= 3 sup_(B in sB_i) {r_B^*} = rho r_(B_i ') $ where $c_B$ stands for the center point of $B$. Hence $B subset rho B_i '$. Second we need to show that $inter.big_i sB_i = diameter$. Without lost of generality, we can assume all center of balls are bounded in $[0, 1]^n$. Then it is easy to determine the result.
]

#ex[
  Let $f_1 , f_2 , dots.h.c , f_m , dots.h.c$ be a nondecreasing sequence
  of nonnegative functions in $L^1 (bb(R)^n)$. Let $f$ be the pointwise
  limit of $f_m$. Show that, for all $x in bb(R)^n$
  $ uM f (x) = lim_(m arrow.r oo) uM f_m (x) . $
]
#pf[
  用 Lebesgue 控制定理。记 $ f_r (x) = integral.dash_B(x, r) f(x) dd(x), f_r^((n))(x) = integral.dash_B(x,r)f_r^((n))(x) dd(x), $ 那么只要证明 $ sup_r f_r (x) = lim_(n -> oo) sup_r f_r^((n))(x). $ 对 $forall r > 0$ 有 $ f_r^((n)) (x) = integral.dash_B(x,r) f_r^((n)) (x) dd(x) <= integral.dash_B(x,r) f_r (x) dd(x) < oo, $ 用 Lebesgue 控制收敛定理知道 $f_r (x) arrow.t f_r^((n))(x)$ 对 $forall r > 0$ 成立。

  接下来证明 $sup_r f_r^((n))(x) arrow.t sup_r f_r (x)$。

  + 对 $forall x_0 in RR^n$ 有 $ f_r^((n))(x) arrow.t f_r (x) <= sup_r f_r (x), $ 那么 $ limsup_n sup_r f_r^((n))(x) <= sup_r f_r (x); $
  + 取 ${x_n in RR^n}$ 使得 $f_r (x_n) arrow.t sup_r f_r (x)$，又知道 $f_r^((m))(x_n) arrow.t f_r (x_n)$，取 $m = n$ 直接得到 $ f_r^((n))(x_n) arrow.t sup_r f_r (x), $ 那么自然有 $ liminf_n sup_r f_r^((n))(x) >= sup_r f_r (x). $
]

#ex[
  If $f in L_("loc")^1 (bb(R)^n)$, define
  $ tilde(M) f (x) = sup {1 / lr(|B|) integral_B lr(|f(y)|) upright(d) y : B upright("an open ball") , x in B} . $
  + Show that the set ${ tilde(M) f > t }$ is open.
  + Show that we have $ lr(|{ tilde(M) f > t }|) lt.eq 3^n / t integral_{tilde(M) f > t} lr(|f|) upright(d) lambda . $
  + Let $p in (1 , + oo)$. Show that $ integral (tilde(M) f)^p upright(d) lambda lt.eq frac(3^n p, p - 1) integral lr(|f|) (tilde(M) f)^(p - 1) upright(d) lambda lt.eq frac(3^n p, p - 1)||f||_p (integral (tilde(M) f)^p upright(d) lambda)^(frac(p - 1, p)) . $
  + Let $p in (1 , + oo)$. Show that $||tilde(M) f||_p lt.eq frac(3^n p, p - 1)||f||_p$. Hint: Use Exercises 1.3 and 1.7 and the preceding inequality.
  + Show that $ ||uM f||_p lt.eq frac(3^n p, p - 1)||f||_p . $
]
#pf[
  不妨假设 $f(x) >= 0$，否则可以加上绝对值从而变成非负函数。

]

#ex[
  A positive Borel measure $mu$ on $bb(R)^n$ is said to be doubling if
  there exists a constant $C$ such that, for all $x in bb(R)^n$ and all
  $r > 0$, one has $ mu (B (x , 2 r)) lt.eq C mu (B (x , r)) . $ For such
  a measure, prove that, for all $gamma > 1$, there exists $C_gamma$ such
  that, for all $x in bb(R)^n$ and all $r > 0$, one has
  $ mu (B (x , gamma r)) lt.eq C_gamma mu (B (x , r)) . $
]

#ex[
  Prove that, for $alpha > 0$, the measure (on $bb(R)^n$)
  $upright(d) mu (x) = lr(|x|)^alpha upright(d) x$ is doubling.
]

#ex[
  Let $mu$ be a doubling measure on $bb(R)^n$. If $f$ is locally
  integrable with respect to $mu$, one sets
  $ M_mu f (x) = sup_(r > 0) frac(1, mu (B (x , r))) integral_(B (x , r)) lr(|f|) upright(d) mu . $
  Prove that there exists $C$ such that, for all $f in L^1 (mu)$ and all
  $t > 0$, one has
  $ mu (M_mu f > t) lt.eq C / t||f||_(L^1 (mu)) . $
]

#ex[
  1. Let $(X , cal(A) , mu)$ be a $sigma$-finite measure space, and let $f$ be a nonnegative measurable function on $X$. Show that, for $0 < p < + oo$ and $0 < u < v < + oo$, we have $ integral_(f > u) f^p upright(d) mu = p integral_u^(+ oo) t^(p - 1) mu ({ f > t }) upright(d) t + u^p mu ({ f > u }) , $
  $
    integral_(f lt.eq v) f^p upright(d) mu = p integral_0^v t^(p - 1) mu ({ f > t }) upright(d) t - v^p mu ({ f > v }) ,
  $
  $
    integral_(u < f lt.eq v) f^p upright(d) mu = p integral_u^v t^(p - 1) mu ({ f > t }) upright(d) t - v^p mu ({ f > v }) + u^p mu ({ f > v }) .
  $
  2. Let $f$ be an integrable function on $bb(R)^n$. Show that if $ integral_(bb(R)^n) lr(|f (x)|) log^(+) (lr(|f (x)|)) upright(d) x $ is finite, then $uM f$ is locally integrable. Hint: If $B$ is a ball, write $ integral_B uM f upright(d) lambda lt.eq 2 lambda (B) + integral_(uM f > 2) uM f upright(d) lambda , $ and use 1. and the inequality $ t lambda ({ uM f > t }) lt.eq C integral_(lr(|f|) > t \/ 2) lr(|f|) upright(d) lambda. $
]
