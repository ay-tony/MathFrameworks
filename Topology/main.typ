#import "@preview/modern-technique-report:0.1.0": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#import "@preview/physica:0.9.3": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold

#set text(lang: "zh")
#set par(justify: true)

#show: modern-technique-report.with(
    title: [基础拓扑学讲义],
    subtitle: [
        *尤承业* 编著

        北京大学出版社
    ],
    series: [*数学系课程\ 定理框架手册*],
    author: [aytony],
    date: datetime.today().display("[year] -- [month] -- [day]"),
    background: image("bg.jpg"),
    theme-color: rgb(21, 74, 135),
    font: ("Times New Roman", "NSimSun", "Noto Serif CJK SC"),
    title-font: "Noto Sans CJK SC"
)

#set page(numbering: "1")

#let bar(x) = $overline(#x)$

#let dint(a, b) = $integral_(#h(-0.7em)\_\_#h(0.2em)#a)^#b$
#let uint(a, b) = $integral^(#h(-0.7em)overline(#hide("ai"))#h(0.2em)#b)_#a$

#let cA = $cal(A)$
#let cB = $cal(B)$
#let cF = $cal(F)$
#let cO = $cal(O)$
#let cU = $cal(U)$

#let vE = $vb(E)$
#let vX = $vb(X)$

#let thm = thmbox.with(
    padding: (top: 0em, bottom: 0em),
    breakable: true,
    inset: (top: 0em, left: 1.2em, right: 1.2em),
    namefmt: name => strong([(#name)]),
    titlefmt: strong,
)

#let eg = thm("example", "例", base_level: 2)
#let rem = thm("remark", "注").with(numbering: none)
#let de = thm("definition", "定义", base_level: 1)
#let tho = thm("theorem", "定理", base_level: 1)
#let cor = thm("corollary", "推论").with(numbering: none)
#let prop = thm("proposition", "命题", base_level: 1)
#let lem = thm("lemma", "引理").with(numbering: none)
#let note = thm("note", none, namefmt: name => strong([#name])).with(numbering: none)

= 拓扑空间与连续映射

== 拓扑空间

#de[
    设 $X$ 是一个非空集合. $X$ 的一个子集族 $tau$ 称为 $X$ 的一个*拓扑*，如果它满足

    + $X, emptyset$ 都包含在 $tau$ 中；
    + $tau$ 中任意多个成员的并集仍在 $tau$ 中；
    + $tau$ 中有限多个成员的交集仍在 $tau$ 中.

    集合 $X$ 和它的一个拓扑 $tau$ 一起称为一个*拓扑空间*，记作 $(X, tau)$.
    称 $tau$ 中的成员为这个拓扑空间的*开集*.
]

#eg[
    设 $X$ 是无穷集合，$tau_f = {A^c | A "是 " X "的有限子集 "} union {emptyset}$，则不难验证 $tau_f$ 是 $X$ 的一个拓扑，称为 $X$ 上的*余有限拓扑*.
]

#eg[
    设 $X$ 是不可数无穷集合，$tau_c = {A^c | A "是 " X "的可数子集 "} union {emptyset} $，则 $tau_c$ 也是 $X$ 的拓扑，称为*余可数拓扑*.
]

#eg[
    设 $RR$ 是全体实数的集合，规定 $tau_e = {U | U" 是若干各开区间的并集 " }$，这里“若干”可以是无穷，有限，也可以是零，因此 $emptyset in tau_e$.
    则 $tau_e$ 是 $RR$ 上的拓扑，称为 $R$ 上的*欧式拓扑*. 记 $vE = (RR, tau_e)$.
]

#eg[
  记 $RR^n = {(x_1, x_2, dots.c, x_n) | x_i in RR, i = 1, 2, ..., n}$. 规定 $RR^n$ 上的度量 $d$ 为：
  $ d((x_1, ..., x_n), (y_1, ..., y_n)) = sqrt(sum_(i=1)^n (x_i - y_i)^2), $
  不难验证 $d$ 满足正定性、对称性和三角不等式，记 $vE^n = (RR^n, d)$，称为 *$n$ 维欧氏空间*.
]

#lem[
  $(vX, d)$ 的任意两个球形邻域的交集是若干球形邻域的并集.
]

#prop[
    $X$ 上由度量 $d$ 决定的度量拓扑 $tau_d$ 满足 $X$ 上的拓扑性质.
]

#de[
    拓扑空间 $X$ 的一个子集 $A$ 称为*闭集*，如果 $A^c$ 是开集.
]

#prop[
    拓扑空间的闭集满足：

    + $X$ 与 $emptyset$ 都是闭集；
    + 任意多个闭集的交集是闭集；
    + 有限个闭集的并集是闭集.
]

#let inner(x) = $attach(#x, t: circle.tiny, tr: #h(0pt))$

#de[
    设 $A$ 是拓扑空间 $X$ 的一个子集，点 $x in A$. 如果存在开集 $U$，使得 $x in U subset A$，则称 $x$ 是 $A$ 的一个*内点*，$A$ 是 $x$ 的一个*邻域*. $A$ 的所有内点的集合称为 $A$ 的*内部*，记作 $inner(A)$ （或 $A^circle.tiny$）.
]

#prop[
    + 若 $A subset B$，则 $inner(A) subset inner(B)$.
    + $inner(A)$ 是包含在 $A$ 中所有开集的并集，因此是包含在 $A$ 中的最大开集；
    + $inner(A) = A <==> A$ 是开集；
    + $(A sect B)^circle.tiny = inner(A) sect inner(B)$；
    + $(A union B)^circle.tiny supset inner(A) union inner(B)$.
]

#de[
    设 $A$ 是拓扑空间 $X$ 的子集，$x in X$. 如果 $x$ 的每个邻域都含有 $A \\ {x}$ 中的点，则称 $x$ 为 $A$ 的*聚点*. $A$ 的所有聚点的集合称为 $A$ 的*导集*，记作 $A'$.
    称集合 $overline(A):=A union A'$ 为 $A$ 的*闭包*.
]

#let bar(x) = $overline(#x)$

#prop[
    若拓扑空间 $X$ 的子集 $A$ 和 $B$ 互为余集，则 $overline(A)$ 与 $inner(B)$ 互为余集.
]

#prop[
    + 若 $A subset B$，则 $bar(A) subset bar(B)$；
    + $bar(A)$ 是所有包含 $A$ 的闭集的交集，所以是包含 $A$ 的最小的闭集；
    + $bar(A) = A <==> A$ 是闭集；
    + $bar(A union B) = bar(A) union bar(B)$；
    + $bar(A sect B) = bar(A) sect bar(B)$.
]

#de[
    规定 $A$ 的子集族 $ tau_A := {U sect A | U in tau}. $ 容易验证 $tau_A$ 是 $A$ 上的一个拓扑，称为 $tau$ 导出的 $A$ 上的*子空间拓扑*，称 $(A, tau_A)$ 为 $(X, tau)$ 的*子空间*.
]

#prop[
    设 $X$ 是拓扑空间，$C subset A subset X$，则 $C$ 是 $A$ 的闭集 $<==>$ $C$ 是 $A$ 与 $X$ 的一个闭集之交集.
]

#prop[
    设 $X$ 是拓扑空间，$B subset A subset X$，则

    + 若 $B$ 是 $X$ 的开（闭）集，则 $B$ 也是 $A$ 的开（闭）集；
    + 若 $A$ 是 $X$ 的开（闭）集，$B$ 是 $A$ 的开（闭）集，则 $B$ 也是 $X$ 的开（闭）集.
]

== 连续映射与同胚映射

#de[
    设 $X$ 和 $Y$ 都是拓扑空间，$f: X -> Y$ 是一个映射，$x in X$. 如果对于 $Y$ 中 $f(x)$ 的任一邻域 $V$，$f^(-1)(V)$ 总是 $x$ 的邻域，则称 $f$ 在 $x$ 处*连续*.
]

#prop[
    设 $f: X -> Y$ 是一映射，$A$ 是 $X$ 的子集，$x in A$. 记 $f_A = f|A: A->Y$ 是 $f$ 在 $A$ 上的限制，则

    + 如果 $f$ 在 $x$ 连续，则 $f_A$ 在 $x$ 也连续；
    + 若 $A$ 是 $x$ 的邻域，则当 $f_A$ 在 $x$ 连续时，$f$ 在 $x$ 也连续.
]

#de[
    如果映射 $f: X -> Y$ 在任一点 $x in X$ 处都连续，则说 $f$ 是*连续映射*.
]

#tho[
    设 $f: X -> Y$ 是映射，下列各条件互相等价：

    + $f$ 是连续映射；
    + $Y$ 的任一开集在 $f$ 的原象是 $X$ 的开集；
    + $Y$ 的任一闭集在 $f$ 的原象是 $X$ 的闭集.
]

#prop[
    设 $X$，$Y$ 和 $Z$ 都是拓扑空间，映射 $f: X -> Y$ 在 $x$ 处连续，$g: Y -> Z$ 在 $f(x)$ 处连续，则复合映射 $g circle.tiny f: X -> Z$ 在 $x$ 处连续.
]

#tho(
    "粘接定理",
)[
    设 ${A_1, A_2, dots.c, A_n}$ 是 $X$ 的一个有限闭覆盖. 如果映射 $f: X -> Y$ 在每个 $A_i$ 上的限制都是连续的，则 $f$ 是连续映射.
]

#de[
    如果 $f: X -> Y$ 是一一对应，并且 $f$ 及其逆 $f^(-1): Y -> X$ 都是连续的，则称 $f$ 是一个*同胚映射*，或称*拓扑变换*，或简称*同胚*.
    当存在 $X$ 到 $Y$ 的同胚映射时，就称 $X$ 与 $Y$ *同胚*，记作 $X tilde.equiv Y$.
]

#eg[
    开区间（作为 $vE^1$ 的子区间）同胚于 $vE^1$.
]

#eg[
    $vE^n$ 中的单位球体 $D^n := {x in vE^n | ||x|| <= 1}$ 的内部 $inner(D)^n$ 同胚于 $vE^n$.
    同胚映射 $f: inner(D)^n => vE^n$ 可规定为：$f(x) = x / (1 - ||x||), forall x in inner(D)^n$.
    它的逆映射为： $ f^(-1)(y) = y / (1 + ||y||),quad forall y in vE^n. $
]

#eg[
    $vE^n \\ {O} tilde.equiv vE^n \\ D^n$（$O$ 为原点）.
]

#eg[
    球面 $S^2$ 去掉一点后与 $vE^2$ 同胚.
]

#eg[
    任何凸多边形（包含内部）都互相同胚.
]

#eg[
    凸多边形与 $D^2$ 同胚.
]

#de[
    拓扑空间的在同胚映射下保持不变的概念成为*拓扑概念*，在同胚映射下保持不变的性质叫*拓扑性质*.
]

== 乘积空间与拓扑基

#prop[
    $bar(cal(B))$ 是 $X_1 times X_2$ 上的一个拓扑.
]

#de[
    称 $bar(cal(B))$ 为 $X_1 times X_2$ 上的*乘积拓扑*，称 $(X_1 times X_2, bar(cal(B)))$ 为 $(X_1, tau_1)$ 和 $(X_2, tau_2)$ 的*乘积空间*，简记为 $X_1 times X_2$.
]

#tho[
    对于任何拓扑空间 $Y$ 和映射 $f: Y -> X_1 times X_2$，$f$ 连续 $<==>$ $f$ 的分量都连续.

]

#cor(
    [
        $forall b in X_2$，由 $x |-> (x, b)$ 规定的映射 $j_b: X_1 -> X_1 times X_2$ 是嵌入映射.
    ],
)

#let cB = $cal(B)$
#let bcB = $bar(cB)$

#de[
    称集合 $X$ 的子集族 $cal(B)$ 为*集合 $X$ 的拓扑基*，如果 $bar(cal(B))$ 是 $X$ 的一个拓扑；称拓扑空间 $(X, tau)$ 的子集族 $cB$ 为这个*拓扑空间的拓扑基*，如果 $bcB = tau$.
]

#prop[
    $cB$ 是集合 $X$ 的拓扑基的充分必要条件是：

    + $union.big_(B in cB)B = X$；
    + 若 $B_1, B_2 in cB$，则 $B_1 sect B_2 in bcB$（也就是 $forall x in B_1 sect B_2$，存在 $B in cB$，使得 $x in B subset B_1 sect B_2$）.
]<1.11>

#eg[
    规定 $RR$ 的子集族 $cB = {[a, b) | a < b}$. 显然 $cB$ 满足 @1.11
    中条件 $1$. 任取 $[a_1, b_1), [a_2,b_2)$，若 $x in [a_1, b_1) sect [a_2, b_2)$，记 $a = max{a_1, a_2}, b = min{b_1, b_2}$，于是 $a <= x < b$.
    则 $[a, b) in cB$，并且 $x in [a, b) subset [a_1, b_2) sect [a_2, b_2)$.
    因此 @1.11 中条件 $2$ 也满足. 这样，$cB$ 是 $RR$ 上的一个拓扑基.
]

#prop[
    $cB$ 是拓扑空间 $(X, tau)$ 的拓扑基的充分必要条件为：

    + $cB subset tau$（即 $cB$ 的成员是开集）；
    + $tau subset bcB$（即每个开集都是 $cB$ 中一些成员的并集）.
]<1.12>

#eg[
    若 $cB$ 是 $(X, tau)$ 的拓扑基，$A subset X$. 规定 $cB_A := {A sect B | B in cB}$.
    它是 $A$ 的子集族. 显然 @1.12 的条件 $1$ 成立. 设 $V$ 是 $A$ 的开集，则有 $U in tau$，使 $V = A sect U$.
    设 $U= union.big_alpha B_alpha, B_alpha in cB$，则 $V = union.big_alpha A sect B_alpha in bcB_A$.
    于是 $bcB_A$ 满足 @1.12 条件 $2$. 因此 $bcB_A$ 是 $(A, tau_A)$ 的拓扑基.
]

#eg[
    设 $RR$ 的子集族 $cB = {(a, b) | a < b, a, b "为有理数 "}$. 则 $cB$ 是 $vE^1$ 的拓扑基.
]

#pagebreak()

= 几个重要的拓扑性质

== 分离公理与可数公理

#note([$T_1$ 公理])[
    任何两个不同点 $x$ 与 $y$，$x$ 有邻域不含 $y$，$y$ 有邻域不含 $x$.
]

#note([$T_2$ 公理])[
    任何两个不同点有不相交的邻域.
]

#prop[
    $X$ 满足 $T_1$ 公理 $<==>$ $X$ 的有限子集是闭集.
]

#cor[
    若 $X$ 满足 $T_1$ 公理，$A subset X$，点 $x$ 是 $A$ 的聚点，则 $x$ 的任一邻域与 $A$ 的交是无穷集.
]

#prop[
    Hausdorff 空间中，一个序列不会收敛到两个以上的点.
]

#note([$T_3$ 公理])[
    任意一点与不含它的任一闭集有不相交的（开）邻域.
]

#note([$T_4$ 公理])[
    任意两个不相交的闭集有不相交的（开）邻域.
]

#prop[
    度量空间 $(X, d)$ 满足 $T_i$ 公理（$i = 1, 2, 3, 4$）.
]

#prop[
    - 满足 $T_3$ 公理 $<==>$ 任意点 $x$ 和它的开邻域 $W$，存在 $x$ 的开邻域 $U$，使得 $overline(U) subset W$.
    - 满足 $T_4$ 公理 $<==>$ 任意闭集 $A$ 和它的开邻域 $W$，有 $A$ 的开邻域 $U$，使得 $overline(U) subset W$.
]

#note([$C_1$ 公理])[
    任一点都有可数的邻域基.
]

#prop[
    如果 $X$ 在 $x$ 处有可数邻域基，则 $x$ 有可数邻域基 ${V_n}$，使得 $m > n$ 时，$V_m subset V_n$.
]

#prop[
    若 $X$ 是 $C_1$ 空间，$A subset X, x in bar(A)$，则 $A$ 中存在收敛到 $X$ 的序列.
]

#cor[
    若 $X$ 是 $C_1$ 空间，$x_0 in X$，映射 $f : X -> Y$ 满足：当 $x_n -> x_0$ 时，$f(x_n) -> f(x_0)$，则 $f$ 在 $x_0$ 连续.
]

#note([$C_2$ 公理])[
    有可数拓扑基.
]

#prop[
    可分度量空间是 $C_2$ 空间.
]

#eg[
    Hilbert 空间 $E^omega$ 是一个度量空间.
    在所有平方收敛的实数序列构成的线性空间中，规定内积 $ ({x_n}, {y_n}) = sum_(n = 1)^oo x_n y_n, $ 它决定度量 $rho$: $ rho({x_n}, {y_n}) = sqrt(sum_(n=1)^oo (x_n - y_n)^2), $ 得到的度量空间就是 $E_omega$.
]

#tho(
    [Lindel$bold(upright(accent("o", dot.double)))$f 定理],
)[
    若拓扑空间 $X$ 满足 $C_2, T_3$ 公理，则它也满足 $T_4$ 公理.
]

#let ypb = "Урысон"
== #text(tracking: 0pt)[#ypb] 引理及其应用

#tho(
    [#ypb 引理],
)[
    如果拓扑空间 $X$ 满足 $T_4$ 公理，则对于 $X$ 的任意两个不相交闭集 $A$ 和 $B$，存在 $X$ 上的连续函数 $f$，它在 $A$ 和 $B$ 上分别取值为 $0$ 和 $1$.
]

#tho(
    [Tietze 扩张定理],
)[
    如果 $X$ 满足 $T_4$ 公理，则定义在 $X$ 的闭子集 $F$ 上的连续函数可连续地扩张到 $X$ 上.
]

#prop[
    拓扑空间 $X$ 可度量化 $<==>$ 存在从 $X$ 到一个度量空间的嵌入映射.
]

#tho(
    [#ypb 度量化定理],
)[
    拓扑空间 $X$ 如果满足 $T_1, T_4$ 和 $C_2$ 公理，则 $X$ 可以嵌入到
    Hilbert 空间 $E^omega$ 中.
]

== 紧致性

#de[
    拓扑空间称为*列紧的*，如果它的每个序列有收敛（即有极限点）的子序列.
]

#prop[
    定义在列紧拓扑空间 $X$ 上的连续函数 $f: X -> vE^1$ 有界，并达到最大、最小值.
]

#de[
    拓扑空间称为*紧致的*，如果它的每个开覆盖有有限的子覆盖.
]

#prop[
    紧致 $C_1$ 空间是列紧的.
]

#prop[
    对任给 $delta > 0$，列紧度量空间存在有限的 $delta-$ 网.
]

#let cU = $cal(U)$
#de[
    设 $cU$ 是列紧度量空间 $(X, d)$ 的一个开覆盖，$X in.not cU$. 称函数 $phi_cU$ 的最小值为 $cU$ 的
    *Lebesgue 数*，记作 $L(cU)$.
]

#prop[
    $L(cU)$ 是正数；并且当 $0 < delta < L(cU)$ 时，$forall x in X, B(x, delta)$ 必包含在 $cU$ 的某个开集 $U$ 中.
]

#prop[
    列紧度量空间是紧致的.
]

#tho[
    若 $X$ 是度量空间，则 $X$ 列紧 $<==>$ $X$ 紧致.
]

#prop[
    $A$ 是 $X$ 的紧致子集 $<==>$ $A$ 是 $X$ 的任一开覆盖有有限子覆盖.
]

#prop[
    紧致空间的闭子集紧致.
]

#prop[
    紧致空间在连续映射下的像也紧致.
]

#cor[
    定义在紧致空间上的连续函数有界，并且达到最大、最小值.
]

#prop[
    若 $A$ 是 Hausdorff 空间 $X$ 的紧致子集，$x in.not A$，则 $x$ 与 $A$ 有不相交的邻域.
]

#cor[
    Hausdorff 空间的紧致子集是闭集.
]

#tho[
    设 $f: X -> Y$ 是连续的一一对应，其中 $X$ 紧致，$Y$ 是 Hausdorff
    空间，则 $f$ 是同胚.
]

#prop[
    Hausdorff 空间的不相交紧致子集有不相交的邻域.
]

#prop[
    紧致 Hausdorff 空间满足 $T_3, T_4$ 公理.
]

#lem(
    number: none,
)[
    设 $A$ 是 $X$ 的紧致子集，$y$ 是 $Y$ 的一点，在乘积空间 $X times Y$ 中，$W$ 是 $A times {y}$ 的邻域.
    则存在 $A$ 和 $y$ 的开邻域 $U$ 和 $V$，使得 $U times V subset W$.
]

#tho[
    若 $X$ 和 $Y$ 都紧致，则 $X times Y$ 也紧致.
]

#de[
    拓扑空间 $X$ 称为*局部紧致的*，如果 $forall x in X$ 都有紧致的邻域.
]

#prop[
    设 $X$ 是局部紧致的 Hausdorff 空间，则
    - $X$ 满足 $T_3$ 公理；
    - $forall x in X$，$x$ 的紧致邻域构成它的邻域基；
    - $X$ 的开子集也是局部紧致的.
]

#de[
    拓扑空间 $X$ 称为*仿紧的*，如果 $X$ 的每个开覆盖都有局部有限的开加细.
]

= 商空间与闭曲面

== 几个常见曲面

== 商空间与商映射

#de[
  设 $(X, tau)$ 是拓扑空间，$tilde$ 是集合 $X$ 上的一个等价关系. 规定商集 $X \/ tilde$ 上的子集族 $
  tilde(tau) := {V subset X \/ tilde | p^(-1)(V) in tau},
  $ 则 $tilde(tau)$ 是 $X \/ tilde$ 上的一个拓扑，称为 $tau$ 在 $tilde$ 下的*商拓扑*，称 $(X\/tilde, tilde(tau))$ 是 $(X, tau)$ 关于 $tilde$ 的*商空间*.
]

#tho[
  设 $X, Y$ 是两个拓扑空间，$tilde$ 是 $X$ 上的一个等价关系，$g: X \/ tilde -> Y$ 是一映射，则 $g$ 连续 $<==> g circle.tiny p$ 连续. 
]

#de[
  设 $X$ 和 $Y$ 是拓扑空间，映射 $f: X -> Y$ 称为*商映射*，如果

  + $f$ 连续；
  + $f$ 是满的；
  + 设 $B subset Y$，如果 $f^(-1)(B)$ 是 $X$ 的开集，则 $B$ 是 $Y$ 的开集.
]

#tho(number: "3.1a")[
  若 $f: X -> X'$ 是商映射，$g: X'->Y$ 是一映射，则 $g$ 连续 $<==>$ $g circle.tiny f$ 连续.
]

#prop[
  如果 $f: X -> Y$ 是商映射，则 $X \/ attach(tilde, t:f) tilde.equiv Y$.
]

#prop[
  连续的满映射 $f: X -> Y$ 如果还是开映射或闭映射，则它是商映射.
]

#tho[
  如果 $X$ 紧致，$Y$ 是 Hausdorff 空间，则连续满映射 $f: X -> Y$ 一定是商映射.
]

#prop[
  商映射的复合也是商映射.
]

#tho[
  设 $f: X -> Y$ 是商映射，$Z$ 是局部紧致的 Hausdorff 空间，$"id": Z -> Z$ 表示恒同映射，则 $
  f times "id": X times Z -> Y times Z
  $ 也是商映射.
]

= 同伦与基本群

== 映射的同伦

#de[
  设 $f, g in C(X, Y)$. 如果有连续映射 $H: X times I -> Y$，使得 $forall x in X, H(x, 0) = f(x), H(x, 1) = g(x)$，则称 $f$ 与 $g$ *同伦*，记作 $f tilde.eq g: X -> Y$，或简记为 $f tilde.eq g$；称 $H$ 是连接 $f$ 与 $g$ 的一个*同伦*（或称*伦移*），记作 $H: f tilde.eq g$（或 $f attach(tilde.eq, t:H) g$）.
]

#prop[
  同伦关系是 $C(X,Y)$ 中的一种等价关系.
]

#prop[
  若 $f_0 tilde.eq f_1: X -> Y, g_0 tilde.eq g_1: Y -> Z$，则 $g_0 circle.tiny f_0 tilde.eq g_1 circle.tiny f_1: X -> Z$.
]

#prop[
  设 $A subset X, f, g in C(X, Y)$. 如果存在 $f$ 到 $g$ 的同伦 $H$，使得当 $a in A$ 时，$H(a, t) = f(a) = g(a), forall t in I$，则称 $f$ 和 $g$ *相对于 $bold(A)$ 同伦*，记作 $f tilde.eq g "rel" A$；称 $H$ 是 $f$ 到 $g$ 的相对于 $bold(A)$ 的同伦，记作 $H: f tilde.eq g "rel" A$（或 $f attach(tilde.eq, t: H) g "rel" A$）.
]
