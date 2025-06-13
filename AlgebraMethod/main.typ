#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#set par(first-line-indent: 2em) // TODO

#let ex = ex.with(base_level: 1)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

#align(center + horizon)[
  #text(20pt)[
    *代数学方法*

    *卷一：基础架构*
  ]

  更新日期：#datetime.today().display("[year] 年 [month] 月 [day] 日")

  aytony
]

#outline(indent: 2em)
#pagebreak(weak: true)

#set heading(
  numbering: (..nums, text-size: auto) => {
    let size = text-size
    if size == auto { size = text.size }
    set text(size: size + .25em) if nums.pos().len() == 1
    numbering("1.", ..nums)
  },
)

= 集合论

= 范畴论基础

#ex[
  设 $A arrow.r^f B arrow.r^g C arrow.r^h D$ 是任意范畴中的态射。证明若 $A arrow.r^(g f) C$ 和 $B arrow.r^(h g) D$ 皆为同构，则 $f , g , h$ 全是同构。
]
#pf[
  因为 $g f, h g$ 都是同构所以 $f, g$ 都是单态射，$g, h$ 都是满态射。由于它们是同构，所以存在 $phi, psi$ 使得 $phi g f = 1_A, psi h g = 1_B$。

  要证明 $f$ 是同构，只要证明 $phi g f = 1_A$ 且 $f phi g = 1_B$，前者是假设，而由 $f phi g f = f 1_A = f$ 右消去 $f$ 得到后者。

  要证明 $g$ 是同构，只要证明 $psi h g = 1_B$ 且 $g psi h = 1_C$，前者是假设，后者由 $g psi h g = g 1_B = g$ 使用右消去得到。

  要证明 $h$ 是同构，只要证明 $g psi h = 1_C$ 且 $h g psi = 1_D$，前者由 $g psi h g = g 1_B = g$ 使用左消去得到，后者由 $psi h g psi = 1_B psi = psi$ 使用左消去得到，这是因为 $psi g f = 1_A$ 可逆从而 $psi$ 是满态射。
]

#ex[
  对范畴 $cate(C) , cate(C) prime$ 定义其并 $cate(C) star.op cate(C) prime$ 如下: $
  Ob(cate(C) star.op cate(C) prime) & := upright(O b) (cate(C)) union.sq upright(O b) (cate(C) prime) ,\
  Hom_(cate(C) star.op cate(C) prime) (X , Y) & := cases(
    Hom_(cate(C))(X\, Y) quad quad & X \, Y in Ob(cate(C)),
    Hom_(cate(C) prime) (X \, Y) & X \, Y in upright(O b) (cate(C) prime) ,
    upright("独点集") & X in upright(O b) (cate(C)) \, Y in upright(O b) (cate(C) prime) ,
    diameter & X in upright(O b) (cate(C) prime) \, Y in upright(O b) (cate(C)).)
$ 为 $cate(C) star.op cate(C) prime$ 中的态射合理地定义合成和单位元，并验证 $cate(C) star.op cate(C) prime$ 确实构成范畴；它包含 $cate(C)$ 和 $cate(C) prime$ 作为全子范畴。对于有限序数范畴，证明 $bold(n) star.op bold(m)$ 同构于 $bold(n) + bold(m)$。
]
#pf[
  先定义合成。对 $forall X, Y, Z in Ob(cate(C star.op cC')), f in Hom_(cC star.op cC') (X, Y), g in Hom_(cC star.op cC') (Y, Z)$ 存在，我们分类讨论。

  + 若 $X, Y, Z in Ob(cC)$ 或 $Ob(cC')$，则分别按照 $cC$ 或 $cC'$ 中定义的态射合成方式进行合成；
  + 若 $X, Y in Ob(cC), Z in Ob(cC')$，那么 $g in Hom_(cC star.op cC')(Y, Z)$ 是唯一的，因为这个集合是独点集，直接定义 $g circ f$ 为 $Hom_(cC star.op cC')(X, Z)$ 这个独点集中的唯一元素即可；
  + 若 $X in Ob(cC), Y, Z in Ob(cC')$，那么 $f in Hom(X, Y)$ 是唯一的，定义 $g circ f$ 是 $Hom(X, Z)$ 中的唯一元素即可；
  + 不可能出现其他情况，因为不会有从 $Ob(cC')$ 到 $Ob(cC)$ 的态射存在。

  再定义单位元。对 $forall X in Ob(cC star cC')$，若 $X in Ob(cC)$，那么定义 $1_X$ 为 $cC$ 中 $X$ 的单位态射；否则定义 $1_X$ 为 $cC'$ 中 $X$ 的单位态射。

  再验证 $cC star.op cC'$ 构成范畴：

  + 对 $forall f in Mor(cC star cC')$，由定义知道 $f$ 的定义域和值域一定都是 $Ob(cC star cC')$ 中的元素；
  + 上文已经定义了单位态射；
  + 上文定义的复合运算对 $cC star cC'$ 封闭；
  + 复合运算有结合律。对 $forall f, g, h in Mor(cC star cC')$ 且它们可进行复合，若 $f, g, h in Mor(cC)$ 或 $f, g, h in Mor(cC')$，那么由于 $cC, cC'$ 是范畴，它们自然是结合的；否则，$(h g) f, h (g f)$ 一定都是从 $Ob(cC)$ 中一元素映射到 $Ob(cC')$ 中一元素，而这是一个独点集，所以它们两个一定相同。
  + 容易验证 $forall f : X -> Y in Mor(cC star cC')$ 有 $f 1_X = f = 1_Y f$。

  直接按定义容易验证 $cC, cC'$ 是 $cC star cC'$ 的全子范畴。
]

#ex[
  选定 Grothendieck 宇宙，证明其中全体有限全序集及其间的保序映射构成一个范畴 $upright(sans(O r d))_f$。证明有限序数 $bold(0) , bold(1) , dots.h$ 构成此范畴的骨架。
]
#pf[
  TODO
]

#ex[
  设 $cate(C)$ 为范畴，并对每个 $X , Y in Ob(cate(C))$ 在 $Hom_(cate(C)) (X , Y)$ 上给定二元关系 $cal(R)$。构造相应的商范畴 $cate(C) \/ cal(R)$ 连同函子 $Q : cate(C) arrow.r cate(C) \/ cal(R)$ 使得
  - 对任意 $cate(C)$ 中态射 $f , g$ 有 $f cal(R) g arrow.r.double Q (f) = Q (g)$；
  - 函子 $Q$ 在对象集上是双射；
  - 对任何函子 $S : cate(C) arrow.r cate(C) prime$ 满足 $f cal(R) g arrow.r.double S (f) = S (g)$ 者，存在唯一的函子 $overline(S) : cate(C) \/ cal(R) arrow.r cate(C) prime$ 使得 $S = overline(S) Q$。

  说明 $Q : cate(C) arrow.r cate(C) \/ cal(R)$ 的唯一性。
]
#pf[
  基于 $cal(R)$ 定义等价关系 $cal(R')$，使得对 $forall f, g in Mor(cC)$ 有 $f cal(R') g$，如果 $f cal(R) g$，并基于传递性进行扩充。那么 $Q(f) = Q(g)$ 当且仅当 $f cal(R') g$。基于选择公理对 $Mor(cC)$ 中的 $cal(R')$-等价类选定代表元，由这些代表元作为态射和 $Ob(cC)$ 作为对象构成的范畴记为 $cC\/cal(R)$。

  对每个 $f in Mor(cC)$，记其代表元为 $Q(f) in Mor(cC\/cal(R))$，对 $X in Ob(cC)$ 令 $Q(X) = X$，这样就定义了函子 $Q$，容易看出它的函子性。容易证明它服从前两个条件。

  对于第三个条件，对 $forall Q(f) in Mor(cC \/ cal(R))$，令 $overline(S)(Q(f)) = S(f)$ 即可。由于 $f$ 可能不唯一，先说明 $overline(S)$ 是良定的。设 $f, f'$ 满足 $Q(f) = Q(f')$，那么 $f cal(R') g$，从而选择公理保证 $S(f) = S(g)$。容易看出 $S = overline(S)Q$。$overline(S)$ 存在性得证。
]

#ex[
  设 $F : cate(C)_1 arrow.r cate(C)_2$ 和 $G : cate(C)_2 arrow.r cate(C)_3$
  为范畴等价（即：具有逆拟函子），证明 $G F : cate(C)_1 arrow.r cate(C)_3$
  也是等价，其拟逆可以取为 $F$ 和 $G$ 的拟逆之合成。
]
#pf[
  设 $F': cC_2 -> cC_1$ 和 $G': cC_3 -> cC_2$ 分别为 $F, G$ 的拟逆函子，那么有同构 $phi: F' F ->^tilde id_cC_1, phi': F F' ->^tilde id_cC_2, psi: G'G ->^tilde id_cC_2$ 和 $psi': G G' ->^tilde id_cC_3$。那么容易看出 $F'G'$ 为 $G F$ 的拟逆函子，这是因为\ #diagram(
    spacing: (30mm, 10mm),
    $
      quad quad quad quad quad quad F' G' G F edge("->", id_F' circ psi circ id_F thin (tilde)) & F' F edge("->", phi' thin (tilde)) & id_cC_1, \
      quad quad quad quad quad quad G F F' G' edge("->", id_F circ phi' circ id_G' thin (tilde)) & G G' edge("->", psi' thin (tilde)) & id_cC_3.
    $
  )\ \ 其中自然映射的合成均为横合成。
]

#ex[
  详述例 2.6.8 中各个伴随对的余单位。
]

#ex[
  记 $upright(sans("Ring"))$
  为以环为对象，环同态为态射的范畴，注意到这里的环皆含乘法幺元，同态按定义须保幺元。如果不假设环含幺，所得范畴记为 $upright(sans("Rng"))$（这可能是本书中唯一一次考虑这类环）。证明显然的函子
  $upright(sans("Ring")) arrow.r upright(sans("Rng"))$ 具有左伴随。
]
#pf[
  即证明遗忘函子 $G: cate("Ring") -> cate("Rng")$ 具有左伴随。直接令函子 $F: cate("Rng") -> cate("Ring")$，将每个环 $R$ 映射到其幺元化环 $R^+$，这里的 $R$ 的幺元化环 $R^+$ 定义为 $
    R^+ = R times ZZ, quad quad (r, n) times (s, m) = (r s + n r + m s, n m),
  $ 其中单位元为 $(0, 1)$。

  然后证明 $F$ 是 $G$ 的左伴随。只要证明对 $forall R in Ob(cate("Rng")), S in Ob(cate("Ring"))$ 构造自然同构 $
    phi: Hom_cate("Ring")(R^+, S) ->^tilde Hom_cate("Rng")(R, S^-).
  $ 构造 $phi$ 如下：

  + 对环同态 $f: R^+ -> S$ 定义 $g: R -> S^-, r |-> f(r, 0)$；
  + 对环同态 $g: R -> S^-$ 定义 $f: R^+ -> S, (r, n) |-> g(r) + n dot 1_S$。

  容易证明两个映射互为逆，并保持环同态结构。
]

#ex[
  设 $(F , G , phi)$ 是伴随对，则

  + $eta : upright("id")_(cate(C)_1) arrow.r G F$ 为同构当且仅当 $F$ 是全忠实函子；
  + $epsilon : F G arrow.r upright("id")_(cate(C)_2)$ 为同构当且仅当 $G$ 是全忠实函子。

  / 提示: 基于对偶性（以 $cate(C)^(upright("op"))$ 代 $cate(C)$），仅需证 (1)。先证明对所有 $cate(C)_1$ 中的态射 $f : X arrow.r Y$ 都有 $phi (F f) = eta_Y f : X arrow.r G F Y$：这是缘于 $phi$ 的自然性导致图表\ #diagram(
  spacing: (10mm, 10mm),
  $
  "id"_(F Y) edge("|->", "d") edge(in, stroke: #0pt, label-side: #center, label-fill: #false)& Hom(F Y, F Y) edge("->", phi) edge("->", "d", (F f)^*) &Hom(Y, G F Y) edge("->", "d", f^*) edge(in.rev, stroke: #0pt, label-side: #center, label-fill: #false) & eta_Y edge("|->", "d")\
  F f edge(in, stroke: #0pt, label-side: #center, label-fill: #false) & Hom(F X, F Y) edge("->", phi) & Hom(X, G F Y) edge(in.rev, stroke: #0pt, label-side: #center, label-fill: #false) & phi(F f) = eta_Y f
  $)\ \ 交换。米田引理（定理 2.5.1）表明 $eta_Y : Y arrow.r^tilde.op G F Y$ 当且仅当 $f arrow.r.bar eta_Y f$ 给出双射 $upright("Hom")(X, Y) arrow.r^tilde.op upright("Hom")(X , G F Y)$，其中 $X$ 取遍 $cate(C)_1$ 的对象；既然 $phi$ 是同构，这又相当于 $f arrow.r.bar F f$ 是双射，亦即 $F$ 是全忠实的。
]
#pf[
  先证必要性，设 $eta: id_cC_1 -> G F$ 为同构，那么只要证明对 $forall X, Y in Ob(cC_1)$ 映射 $
    F: Hom_cC_1 (X, Y) -> Hom_cC_2 (F X, F Y)
  $ 是双射。由于 $eta$ 是同构，对 $forall f: X -> Y$ 有 $
    eta_Y circ f = G F (f) circ eta_X,
  $ 因为 $eta_X, eta_Y$ 是同构，所以 $f -> G F(f)$ 是双摄，又因为 $phi$ 是伴随对的自然同构，于是得到 $
    phi(F(f)) = eta_Y circ f,
  $ 于是 $f |-> F(f)$ 是双射，那么 $F$ 是全忠实的。

  再证充分性，假设 $F$ 是全忠实的，那么 $forall X in Ob(cC_1)$ 映射 $
    F: Hom_cC_1 (X, X) -> Hom_cC_2 (F X, F X)
  $ 是双摄，存在唯一态射 $eta_X: X -> G F X$ 使 $F(eta_X) = id_(F X)$，且 $eta_X$ 是同构。因此 $eta$ 是同构。
]

#ex[
  假设 $cate(C)$ 既是完备也是余完备的。对于小范畴 $I$，证明对角函子
  $Delta : cate(C) arrow.r cate(C)^I$ (定义 2.7.1) 有左、右伴随函子，阐释它们与 $cate(C)$ 中的 $lim_arrow.r$ 与 $lim_arrow.l$
  的关系，相应的单位和余单位作何解释？
]

#ex[
  设域 $bb(k)$ 为域，证明在 $bb(k)$ -向量空间范畴
  $upright(sans("Vect"))_f (bb(k))$ 里，每个对象都同构于一些有限维子空间间的
  $lim_arrow.r$。将此想法移植到交换群范畴 $upright(sans("Ab"))$
  （考虑有限生成交换群的 $lim_arrow.r$）。
]

#ex[
  设 $cate(C)$ 是 $cate(C) prime$ 的全子范畴，包含函子记为
  $J : cate(C) arrow.r cate(C) prime$。说明对任意两个函子
  $F , G : cate(C)_0 arrows.rr cate(C)$，与 $J$ 的横合成诱导双射
  $
    upright("Hom")_(upright("Fct") (cate(C)_0 , cate(C) prime)) (J F , J G) = upright("Hom")_(upright("Fct") (cate(C)_0 , cate(C))) (F , G) .
  $
]
#pf[
  对任意自然变换 $phi in Hom(J F, J G)$，定义 $psi in Hom(F, G)$ 为 $psi_X = J^(-1)(phi_X)$，因为 $J$ 是全忠实的，所以 $J^(-1)$ 良定。

  然后验证 $psi$ 的自然性，即对 $cC_0$ 中态射 $f: X -> Y$，要验证 $psi_Y circ F(f) = G(f) circ psi_X$ 交换。这是因为 $
    J(psi_Y circ F(f)) = phi_Y circ J F(f) = J G(f) circ phi_X = J(G(f) circ psi_X),
  $ 上式使用了 $J$ 的函子性，$phi$ 的自然性和 $J$ 的忠实性。

  上述过程直接定义映射 $Phi: phi |-> psi$，其逆为 $Psi: psi |-> J circ psi$，容易看出 $Psi, Phi$ 互逆。
]

#ex[
  在带基点的集合范畴 $upright("Set")_bullet$ 中描述积和余积，证明它是完备且余完备的。推广到 $upright("Top")_bullet$
  的情形。
]

#ex[
  考虑忘却函子 $upright("Set")_bullet arrow.r upright("Set")$，找出
  $U$ 的左伴随，并证明 $U$ 无右伴随。
]
