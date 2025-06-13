### 详细解答

#### 问题1：显式解的构造

考虑方程：
$$
u_t - \Delta u + c u = f \quad \text{在 } \mathbb{R}^n \times (0, \infty),
$$
初值条件：
$$
u = g \quad \text{在 } \mathbb{R}^n \times \{ t = 0 \}.
$$

**步骤1：齐次方程的解**  
首先考虑齐次方程 $ u_t - \Delta u + c u = 0 $。通过分离变量或指数调整法，设解的形式为：
$$
u(x,t) = e^{-c t} v(x,t),
$$
代入方程得：
$$
e^{-c t} (v_t - \Delta v) = 0 \implies v_t - \Delta v = 0.
$$
因此，$v(x,t)$ 满足标准热方程，其解为：
$$
v(x,t) = \int_{\mathbb{R}^n} \Phi(x - y, t) g(y) dy,
$$
其中热核 $\Phi(x,t) = \frac{1}{(4\pi t)^{n/2}} e^{-\frac{|x|^2}{4t}}$。于是齐次方程的解为：
$$
u_{\text{齐次}}(x,t) = e^{-c t} \int_{\mathbb{R}^n} \Phi(x - y, t) g(y) dy.
$$

**步骤2：非齐次项的处理**  
对于非齐次方程，利用 Duhamel 原理，解可表示为：
$$
u(x,t) = u_{\text{齐次}} + \int_0^t \int_{\mathbb{R}^n} e^{-c (t-s)} \Phi(x - y, t-s) f(y,s) dy ds.
$$
最终显式解为：
$$
u(x,t) = e^{-c t} \int_{\mathbb{R}^n} \Phi(x - y, t) g(y) dy + \int_0^t \int_{\mathbb{R}^n} e^{-c (t-s)} \Phi(x - y, t-s) f(y,s) dy ds.
$$

---

#### 问题2：热传导方程的对称性

**(a) 缩放不变性**  
设 $ u_\lambda(x,t) = u(\lambda x, \lambda^2 t) $，需验证 $ \partial_t u_\lambda = \Delta u_\lambda $。

**计算偏导数**：
- 时间导数：
$$
\frac{\partial u_\lambda}{\partial t} = \frac{\partial u}{\partial t}(\lambda x, \lambda^2 t) \cdot \lambda^2.
$$
- 空间导数（以分量形式）：
$$
\frac{\partial u_\lambda}{\partial x_i} = \frac{\partial u}{\partial x_i}(\lambda x, \lambda^2 t) \cdot \lambda,
$$
$$
\frac{\partial^2 u_\lambda}{\partial x_i^2} = \frac{\partial^2 u}{\partial x_i^2}(\lambda x, \lambda^2 t) \cdot \lambda^2.
$$
因此，拉普拉斯算子：
$$
\Delta u_\lambda = \sum_{i=1}^n \frac{\partial^2 u_\lambda}{\partial x_i^2} = \lambda^2 \Delta u(\lambda x, \lambda^2 t).
$$

**代入方程**：
由于原方程满足 $ \partial_t u = \Delta u $，代入后：
$$
\partial_t u_\lambda = \lambda^2 \partial_t u = \lambda^2 \Delta u = \Delta u_\lambda.
$$
故 $ u_\lambda $ 是热方程的解。

**(b) 生成对称性解**  
定义 $ v(x,t) = x \cdot \nabla u(x,t) + 2t \partial_t u(x,t) $。

**计算 $ v_t - \Delta v $**：
- 时间导数：
$$
v_t = \nabla u \cdot \nabla u + x \cdot \nabla u_t + 2 \partial_t u + 2t \partial_{tt} u.
$$
- 空间导数：
$$
\Delta v = \Delta(x \cdot \nabla u) + 2t \Delta \partial_t u.
$$
利用热方程 $ \partial_t u = \Delta u $，逐项化简后可验证 $ v_t - \Delta v = 0 $。

---

#### 问题3：相似解与基本解

**(a) 相似变量的引入**  
设 $ u(x,t) = v(z) $，其中 $ z = \frac{x}{\sqrt{t}} $。

**计算偏导数**：
- 时间导数：
$$
u_t = v'(z) \cdot \left( -\frac{x}{2t^{3/2}} \right) = -\frac{z}{2t} v'(z).
$$
- 空间导数：
$$
u_{xx} = \frac{1}{t} v''(z).
$$

**代入方程 $ u_t = u_{xx} $**：
$$
-\frac{z}{2t} v'(z) = \frac{1}{t} v''(z) \implies v''(z) + \frac{z}{2} v'(z) = 0.
$$

**求解ODE**：  
令 $ w = v' $，方程变为：
$$
w' + \frac{z}{2} w = 0 \implies w(z) = c e^{-z^2/4}.
$$
积分得通解：
$$
v(z) = c \int_0^z e^{-s^2/4} ds + d.
$$

**(b) 基本解的构造**  
对 $ u(x,t) = v(z) $ 关于 $ x $ 求导：
$$
\frac{\partial u}{\partial x} = \frac{1}{\sqrt{t}} v'(z) = \frac{c}{\sqrt{t}} e^{-x^2/(4t)}.
$$
为满足初始条件 $ u(x,0) = \delta(x) $，选取 $ c = \frac{1}{\sqrt{4\pi}} $，得基本解：
$$
\Phi(x,t) = \frac{1}{\sqrt{4\pi t}} e^{-x^2/(4t)}.
$$
**解释**：当 $ t \to 0^+ $，$ \Phi(x,t) $ 趋近于 Dirac $\delta$ 函数，因此满足初始条件。
