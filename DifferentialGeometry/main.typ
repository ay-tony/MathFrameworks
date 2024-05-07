#import "@preview/modern-technique-report:0.1.0": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#import "@preview/physica:0.9.3": *

#show: modern-technique-report.with(
  title: [Differential Geometry],
  subtitle: [
    *of Curves & Surfaces*, \ by _Manfredo P. do Carmo_
  ],
  series: [*Mathematics Courses \ Tasks Answers Series*],
  author: [aytony],
  date: datetime.today().display("[year] -- [month] -- [day]"),
  background: image("bg.jpg"),
  theme-color: red.darken(20%),
  font: ("Times New Roman", "NSimSun"),
  title-font: "Noto Sans",
)

#set par(justify: true)
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
  base_level: 2
)

#let prf = thm(
  "proof",
  "Proof"
).with(numbering: none)

#let sol = thm(
  "solution",
  "Solution"
).with(numbering: none)

= Curves

== Introduction

== Parametrized Curves

#task[
  Find a parametrized curve $alpha(t)$ whose trace is the circle $x^2 + y^2 = 1$ such that $alpha(t)$ runs clockwise around the circle with $alpha(0) = (0,1)$.
]

#sol[
  $alpha(t) = (- sin t, cos t)$ follows the condition.
]

#task[
  Let $alpha(t)$ be a parametrized curve which does not pass through the origin. If $alpha(t_0)$ is a point of the trace of $alpha$ closest to the origin and $alpha'(t_0) != 0$, show that the position vector $alpha(t_0)$ is orthogonal to $alpha'(t_0)$.
]

#prf[
  Since $alpha(t)$ is parametrized curve, $|alpha(t)| = sqrt(alpha(t) dot alpha(t))$ is differentiable. $
  dv(|alpha|, t) &= dv(,t)(sqrt(alpha dot alpha)) = dv(alpha, t) 1 / (2 sqrt(alpha dot alpha)) dot 2 (alpha' dot alpha)\
  &= (alpha' dot alpha) / (|alpha|) alpha'
  $ Since $alpha(t_0)$ is the minimal value of $alpha$, we know that $
  eval(dv(|alpha|, t))_(t=t_0)=(alpha'(t_0) dot alpha(t_0)) / (|alpha(t_0)|) alpha'(t_0) = 0.
  $ Since $alpha'(t_0) != 0$, we can figure out that $alpha'(t_0) dot alpha(t_0) = 0$, i.e. $alpha(t_0)$ is orthogonal to $alpha'(t_0)$.
]

#task[
  A parametrized curve $alpha(t)$ has the property that its second derivatie $a''(t)$ is identically zero. What can be said about $alpha$?
]

#sol[
  $alpha''(t) = (x''(t), y''(t), z''(t)) equiv 0$, so we can denote by calculus that $
  alpha(t) = (x_0 + x_1 t, y_0 + y_1 t, z_0 + z_1 t).
  $
]

#task[
  Let $alpha: I -> RR^3$ be a parametrized curve and let $v in RR^3$ be a fixed vector. Assume that $alpha'(t)$ is orthogonal to $v$ for all $t in I$ and that $alpha(0)$ is also orthogonal to $v$. Prove that $alpha(t)$ is orthogonal to $v$ for all $t in I$.
]

#prf[
  According to condition, $alpha'(t) dot v = 0$ holds for all $t in I$. Apply integral to both side and we have $alpha(t) dot v equiv C_0$, where $C_0$ is constant. Plug $alpha(0) = 0$ we can infer that $C_0 = 0$, thus $alpha(t) dot v equiv 0$.
]

#task[
  Let $alpha: I -> RR^3$ be a parametrized curve, with $alpha'(t) != 0$ for all $t in I$. Show that $|alpha(t)|$ is a nonzero constant if and only if $alpha(t)$ is orthogonal to $alpha'(t)$ for all $t in I$.
]

#prf[
  $==>$ Denote $|alpha(t)| = C$. Then we have $
  dv(|alpha|, t) = (alpha' dot alpha) / (|alpha|) alpha' = 0.
  $ Plug in that $alpha' != 0$ we know $alpha' dot alpha = 0$ for all $t in I$.

  $<==$ Since $alpha$ is orthogonal to $alpha'$, $alpha dot alpha' = 0$ always holds. Then $dv(|alpha|, t) = (alpha' dot alpha) / (|alpha|) alpha' = 0$ holds. That is $|alpha| = C$.
]

== Regular Curves; Arc Length

#task[
  Show that the tangent lines to the regular parameterized curve $alpha(t) = (3t, 3t^2, 2t^3)$ make a constant angle with the line $y = 0, z = x$.
]

#prf[
  The line $y = 0, z = x$ can be denoted as the direction of vector $v = (1, 0, 1)$. And we know that $alpha'(t) = (3, 6t, 6t^2)$. Thus we have $
  (alpha'(t) dot v) / (|alpha'(t)|) = (6t^2 + 3) / sqrt(36t^4 + 36t^2 + 9) = 1
  $ is a constant.
]

#task[
  A circular disk of radius $1$ in the plane $x y$ rolls without slipping along the $x$ axis. The figure described by a point of the circumference of the disk is called a cycloid.

  + Obtain a parametrized curve $alpha: RR -> RR^2$ the trace of which is the cycloid, and determine its singular points.
  + Compute the arc length of the cycloid correpoinding to a complete rotation of the disk.
]

#sol[
  For subtask 1, we consider $alpha(t) = (t-sin t, 1-cos t), quad t in RR$. $alpha'(t) = (1 - cos t, sin t)$. When $alpha'(t)=0$, we can find singular point $t = 2 k pi, k in ZZ$.

  For subtask 2, consider $t in [0, 2 pi]$. $
  s &= integral_0^(2 pi) |alpha'(t)| dd(t) = integral_0^(2 pi) sqrt(1 + 2 cos t + cos^2 t + sin^2 t) dd(t)\
  &= integral_0^(2 pi) sqrt(2 + 2 cos t) = 8.
  $
]

#task[
  Let $O A = 2 a$ be the diameter of a circle $S^1$ and $O y$ and $A V$ be the tangents to $S^1$ at $O$ and $A$, respectively. A half-line $r$ is drawn from $O$ which meets the circle $S^1$ at $C$ and line $A V$ at $B$. On $O B$ mark off the segment $O p = C B$. If we rotate $r$ about $O$, the point $p$ will describe a curve called the _cissoid of Diocles_. By taking $O A$ as the $x$ axis and $O Y$ as the $y$ axis, prove that
  
  + The trace of #h(1fr) $
  alpha(t) = ((2 a t^2) / (1 + t^2), (2 a t^3)/(1 + t^2)), quad t in RR,
  $ is the cissoid of Diocles ($t = tan theta$).

  + The origin $(0, 0)$ is a singular point of the cissoid.
  + As $t -> oo$, $alpha(t)$ approaches the line $x = 2 a$, and $alpha'(t) -> (0, 2a)$. Thus, as $t -> oo$, the curve and its tangent approach the line $x = 2a$; we say that $x = 2a$ is an _asymptote_ to the cissoid.
]

#prf[
  For subtask 1, let $t = tan theta$. Then $O C = O A cos theta = 2 a cos theta$, and $O B = 2 a sec theta$. Then $O p = C B = O B - O C = 2a(sec theta - cos theta)$. Thus, $
  alpha(t) = (O p cos theta, O p sin theta) = (2a sin ^2 theta, 2 a (tan theta - sin theta cos theta)) = ((2a t^2) / (1 + t^2), (2a t^3) / (1 + t^2)).
  $

  For subtask 2, we calculate the derivative of $alpha(t)$. $
  alpha'(t) = (- (2 t)/((1 + t^2)^2), - (2 t^2)/((1 + t^2)^2) + (2 a t^2)/(1+t^2)).
  $ It is obvious that $alpha(0) = (0, 0)$ and $alpha'(0) = 0$, i.e. the origin is a singular point.

  For subtask 3, we let $t -> oo$, and the statement is trivial.
]

#task[
  Let $alpha: (0, pi) -> RR^2$ be given by $
  alpha(t) = (sin t, cos t + log tan t/2),
  $ where $t$ is the angle that the $y$ axis make with the vector $alpha'(t)$. The trace of $alpha$ is called the _tractrix_. Show that

  + $alpha$ is a differentiable parametrized curve, regular except at $t = pi \/ 2$.
  + The length of the segment of the tangent of the tractrix between the point of tangency and the $y$ axis is constantly equal to $1$.
]

#prf[
  For subtask 1, we can simply differentiate the $alpha$. $
  alpha'(t) = (cos t, -sin t + csc t), quad t in (0, pi).
  $ Hence $t = pi \/ 2$ is the only point such taht $alpha'(t) = 0$.

  For subtask 2, we consider the geometry intuitive, and can infer that the length of that segment is equal to the $x$ value of $alpha(t)$ times $sec t$, i.e. $cos t dot sec t = 1$.
]

#task[
  Let $alpha: (-1, +oo) -> RR$ be given bt $
  alpha(t) = ((3 a t)/(1+t^3),(3a t^2)/(1+t^3)).
  $ Prove that:

  + For $t=0$, $alpha$ is tangent to the $x$ axis.
  + As $t->+oo, alpha(t)->(0,0)$ and $alpha'(t)->(0,0)$.
  + Take the curve with the opposite orientation. Now, as $t ->-1$, the curve and its tangent approach the line $x+y+a=0$.

  The figure obtained by completing the trace of $alpha$ in such a way that it becomes symmetric relative to the line $y=x$ is called the _folium of Descartes_.
]

#prf[
  For subtask 1, we first calculate $
  alpha'(t) = ((3a(-2t^3+1))/((1+t^3)^2),(3a t(-t^3+2))/((1+t^3)^2))
  $ and hence $alpha(0) = (0, 0)$, $alpha'(0) = (3a, 0)$.

  For subtask 2, let $t -> +oo$ and the statement is trivial.

  For subtask 3, now $
  alpha(t) &= (- (3a t)/(1 - t^3), (3 a t^2) / (1 - t^3)), quad t in (-oo, 1),\
  alpha'(t) &= ((3a(1-2t^3))/((1-t^3)^2), (3a t(t^3 + 2))/((1-t^3)^2)).
  $ As $t->1$, we have $
  x + y + a &= -(3a t)/(1+t+t^2)+a ->0,\ 
  y' / x' &= (t(t^3+2))/(1-2t^3) -> -1.
  $
]

#task[
  Let $alpha(t) = (a e^(b t) cos t, a e^(b t) sin t), t in RR$, $a$ and $b$ constants, $a > 0$, $b < 0$, be a parametrized curve.

  + Show that as $t -> +oo$, $alpha(t)$ approaches the origin $O$, spiraling around it (because of this, the trace of $alpha$ is called the _logarithmic spiral_).
  + Show that $alpha'(t) -> (0,0)$ as $t -> +oo$ and that $
  lim_(t->+oo) integral_(t_0)^t|alpha'(t)|dd(t)
  $ is finite; that is, $alpha$ has finite ar length in $[t_0, +oo)$.
]

#prf[
  For subtask 1, as $t -> +oo$, $|alpha(t)| &= a e^(b t) -> 0$.

  For subtask 2, $
  alpha'(t) = (a e^(b t)(b cos t - sin t), a e^(b t)(b sin t + cos t)).
  $ As $t -> +oo$, we can see that $alpha'(t) -> (0, 0)$. And we have $
  |alpha'(t)| = a(b^2+1)e^(b t),\
  integral_(t_0)^(+oo)|alpha'(t)|dd(t) = a(b^2+1)integral_(t_0)^(+oo)e^(b t)dd(t) = (a(b^2+1)e^(b t_0))/b < +oo.
  $
]

== The Vector Product in $bold(RR^3)$

#task[
  Check whether the following bases are positive:

  + The basis ${(1,3), (4,2)}$ in $RR^2$.
  + The bases ${(1,3,5), (2,3,7), (4,8,3)}$ in $RR^3$.
]

#sol[
  For subtask 1, $
  matrixdet(1,3;4,2) = -10 < 0.
  $
  For subtask 2, $
  matrixdet(1,3,5;2,3,7;4,8,3) = 39 > 0.
  $
]

#task[
  A plane $P$ contained in $RR^3$ is given by the equation $a x + b y + c z + d = 0$. Show that the vector $v = (a,b,c)$ is perpendicular to the plane and that $|d| \/ sqrt(a^2+b^2+c^2)$ measures the distance from the plane to the origin $(0,0,0)$.
]

#prf[
  Consider two points $(x_1, y_1, z_1), (x_2, y_2, z_2)$ on the plane. Then the vector in plane $u = (x_2 - x_1, y_2- y_1, z_2 - z_1)$ holds that $(a, b, c) dot u = v dot u = 0$, i.e. $v$ is perpendicular to any vector $u$ parallel to plane.

  Consider $w = k v$ is on the plane. That is, $k(a^2+b^2+c^2)+d=0$. Then we have $
  |w| = |k||v| = (|d|)/(a^2+b^2+c^2)dot sqrt(a^2+b^2+c^2) = (|d|) / sqrt(a^2+b^2+c^2).
  $
]

#task[
  Determine the angle of intersection of the two planes $5x + 3y + 2z - 4 = 0$ and $3x+4y-7z=0$.
]

#sol[
  $
  cos theta = (u dot v) / (|u||v|) = 13 / (2 sqrt(19)sqrt(39)).
  $
]

#task[
]

#task[]

#task[]

#task[]

#task[
  Prove that the distance $rho$ between the nonparrallel lines $
  x-x_0 &= u_1 t, quad y-y_0 &= u_2 t, quad z - z_0 &= u_3 t,\
  x-x_1 &= v_1 t, quad y-y_1 &= v_2 t, quad z - z_1 &= v_3 t
  $ is given by $
  rho = (|(u times v) dot r|) / (|u times v|),
  $ where $u = (u_1, u_2, u_3), v = (v_1, v_2, v_3), r = (x_0-x_1, y_0-y_1,z_0-z_1)$.
]

#prf[
  $u times v$ is perpendicular to $u$ and $v$. Span the plane that is perpendicular to $u times v$ from $(x_0, y_0, z_0)$ and $(x_1, y_1, z_1)$ respectively. Then what we need to calculate is the distance between two planes, and statement is trivial.
]

#task[]

#task[]

#task[]

#task[]

#task[]

#task[]

== The Local Theorey of Curves Parametrized by Arc Length
