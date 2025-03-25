#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@local/aytony:1.0.0": *
#show: aytony-cn-traits

#let ex = ex.with(base_level: 2)
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

#ex[
  选定 Grothendieck 宇宙，证明其中全体有限全序集及其间的保序映射构成一个范畴 $upright(sans(O r d))_f$。证明有限序数 $bold(0) , bold(1) , dots.h$ 构成此范畴的骨架。
]

#ex[
  设 $cate(C)$ 为范畴，并对每个 $X , Y in Ob(cate(C))$ 在 $Hom_(cate(C)) (X , Y)$ 上给定二元关系 $cal(R)$。构造相应的商范畴 $cate(C) \/ cal(R)$ 连同函子 $Q : cate(C) arrow.r cate(C) \/ cal(R)$ 使得
  - 对任意 $cate(C)$ 中态射 $f , g$ 有 $f cal(R) g arrow.r.double Q (f) = Q (g)$；
  - 函子 $Q$ 在对象集上是双射；
  - 对任何函子 $S : cate(C) arrow.r cate(C) prime$ 满足 $f cal(R) g arrow.r.double S (f) = S (g)$ 者，存在唯一的函子 $overline(S) : cate(C) \/ cal(R) arrow.r cate(C) prime$ 使得 $S = overline(S) Q$。

  说明 $Q : cate(C) arrow.r cate(C) \/ cal(R)$ 的唯一性。
]

#ex[
  设 $F : cate(C)_1 arrow.r cate(C)_2$ 和 $G : cate(C)_2 arrow.r cate(C)_3$
  为范畴等价（即：具有逆拟函子），证明 $G F : cate(C)_1 arrow.r cate(C)_3$
  也是等价，其拟逆可以取为 $F$ 和 $G$ 的拟逆之合成。
]

#ex[
  详述例 2.6.8 中各个伴随对的余单位。
]

#ex[
  记 $upright(sans("Ring"))$
  为以环为对象，环同态为态射的范畴，注意到这里的环皆含乘法幺元，同态按定义须保幺元。如果不假设环含幺，所得范畴记为 $upright(sans("Rng"))$（这可能是本书中唯一一次考虑这类环）。证明显然的函子
  $upright(sans("Ring")) arrow.r upright(sans("Rng"))$ 具有左伴随。
]

#ex[
  设 $(F , G , phi)$ 是伴随对，则

  + $eta : upright("id")_(cate(C)_1) arrow.r G F$ 为同构当且仅当 $F$ 是全忠实函子；
  + $epsilon : F G arrow.r upright("id")_(cate(C)_2)$ 为同构当且仅当 $G$ 是全忠实函子。

  / 提示: 基于对偶性 (以 $cate(C)^(upright("op"))$ 代 $cate(C)$)，仅需证 (1)。先证明对所有 $cate(C)_1$ 中的态射 $f : X arrow.r Y$ 都有 $phi (F f) = eta_Y f : X arrow.r G F Y$：这是缘于 $phi$ 的自然性导致图表\ #diagram(
  spacing: (10mm, 6mm),
  $
  "id"_(F Y) edge("|->", "d") edge(in, stroke: #0pt, label-side: #center, label-fill: #false)& Hom(F Y, F Y) edge("->", phi) edge("->", "d", (F f)^*) &Hom(Y, G F Y) edge("|->", "d", f^*) edge(in.rev, stroke: #0pt, label-side: #center, label-fill: #false) & eta_Y edge("->", "d")\
  F f edge(in, stroke: #0pt, label-side: #center, label-fill: #false) & Hom(F X, F Y) edge("->", phi) & Hom(X, G F Y) edge(in.rev, stroke: #0pt, label-side: #center, label-fill: #false) & phi(F f) = eta_Y f
  $)\ \ 交换。米田引理（定理 2.5.1）表明 $eta_Y : Y arrow.r^tilde.op G F Y$ 当且仅当 $f arrow.r.bar eta_Y f$ 给出双射 $upright("Hom")(X, Y) arrow.r^tilde.op upright("Hom")(X , G F Y)$，其中 $X$ 取遍 $cate(C)_1$ 的对象；既然 $phi$ 是同构，这又相当于 $f arrow.r.bar F f$ 是双射，亦即 $F$ 是全忠实的。
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

#ex[
  在带基点的集合范畴 $upright("Set")_bullet$ 中描述积和余积，证明它是完备且余完备的。推广到 $upright("Top")_bullet$
  的情形。
]

#ex[
  考虑忘却函子 $upright("Set")_bullet arrow.r upright("Set")$，找出
  $U$ 的左伴随，并证明 $U$ 无右伴随。
]
