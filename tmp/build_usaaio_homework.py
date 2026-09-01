import json
from copy import deepcopy
from pathlib import Path


SOURCE = Path(
    r"C:\Users\Apan\OneDrive - Eastside Preparatory School\self\usaaio\Session1_Notebook_Student.ipynb"
)
OUTPUT = Path(
    r"C:\Projects\junior_hub\output\notebooks\USAAIO_Session_1_Homework_Complete.ipynb"
)


def markdown(text):
    return {
        "cell_type": "markdown",
        "metadata": {},
        "source": text.strip().splitlines(keepends=True),
    }


def code(text):
    return {
        "cell_type": "code",
        "execution_count": None,
        "metadata": {},
        "outputs": [],
        "source": text.strip().splitlines(keepends=True),
    }


with SOURCE.open("r", encoding="utf-8") as stream:
    source_notebook = json.load(stream)

core_cells = deepcopy(source_notebook["cells"][:65])

completed_code = {
    3: """
y = A_action(x)
print("input :", x)
print("output:", y)
print("shapes:", x.shape, "->", y.shape)
""",
    5: """
p = np.array([1., 2., 3., 4.])
q = np.array([0., 3., 7., -3.])
left = A_action(p + q)
right = A_action(p) + A_action(q)
print(left)
print(right)
print("linear?", np.allclose(left, right))
""",
    7: """
zero = np.zeros(4)
print(A_action(zero))
""",
    10: """
basis4 = np.eye(4)
columns = [A_action(e_j) for e_j in basis4]
for column in columns:
    print(column)
""",
    12: """
A = np.column_stack(columns)
print(A)
print("shape:", A.shape)
""",
    14: """
print(A @ x)
print(A_action(x))
print("match?", np.allclose(A @ x, A_action(x)))
""",
    16: """
rng = np.random.default_rng(7)
tests = rng.normal(size=(6, 4))
print(all(np.allclose(A @ z, A_action(z)) for z in tests))
""",
    19: """
u0 = np.array([1., 0., 0.])
v0 = np.array([0., 0., 1., -1.])
term0 = np.outer(u0, v0)
print(term0)
print("rank:", np.linalg.matrix_rank(term0))
""",
    21: """
measurement = v0 @ x
spread = u0 * measurement
print(measurement)
print(spread)
print(term0 @ x)
""",
    23: """
u1 = np.array([0., 1., 0.])
v1 = np.array([0., 0., 0., 1.])
two_terms = term0 + np.outer(u1, v1)
print(np.linalg.matrix_rank(two_terms))
""",
    26: """
u2 = np.array([0., 0., 1.])
v2 = np.array([1., 2., 0., 0.])
A_decomposed = term0 + np.outer(u1, v1) + np.outer(u2, v2)
print(A_decomposed)
print("matches A?", np.allclose(A_decomposed, A))
""",
    28: """
rank_A = np.linalg.matrix_rank(A)
singular_values_A = np.linalg.svd(A, compute_uv=False)
print("rank(A) =", rank_A)
print(np.round(singular_values_A, 3))
""",
    30: """
U_A, s_A, Vt_A = np.linalg.svd(A, full_matrices=False)
A_rank2 = (U_A[:, :2] * s_A[:2]) @ Vt_A[:2, :]
print(round(np.linalg.norm(A - A_rank2, 2), 3))
print(round(np.linalg.norm(A - A, 2), 3))
print(round(np.linalg.norm(A - A_rank2, "fro"), 3))
""",
    33: """
rng = np.random.default_rng(5)
X_left = rng.normal(loc=(-2, -2), scale=0.2, size=(10, 2))
X_right = rng.normal(loc=(2, 2), scale=0.2, size=(10, 2))
X5 = np.vstack([X_left, X_right])
y5 = np.array([0] * 10 + [1] * 10)

class_centers = np.vstack([X5[y5 == k].mean(axis=0) for k in (0, 1)])
supervised_predictions = np.argmin(
    np.linalg.norm(X5[:, None, :] - class_centers[None, :, :], axis=2),
    axis=1,
)
print(np.mean(supervised_predictions == y5))
""",
    35: """
# Initialize in reverse order so the arbitrary cluster IDs illustrate the label trap.
centers = np.vstack([X5[-1], X5[0]])
for _ in range(10):
    cluster_ids = np.argmin(
        np.linalg.norm(X5[:, None, :] - centers[None, :, :], axis=2),
        axis=1,
    )
    centers = np.vstack([X5[cluster_ids == k].mean(axis=0) for k in (0, 1)])

print("cluster ids:", cluster_ids[:10])
print("true labels:", y5[:10])
""",
    37: """
raw_agreement = np.mean(cluster_ids == y5)
flipped_agreement = np.mean((1 - cluster_ids) == y5)
best_agreement = max(raw_agreement, flipped_agreement)
print(
    f"raw agreement {raw_agreement:.2f} | "
    f"flipped agreement {flipped_agreement:.2f} | "
    f"best {best_agreement:.2f}"
)
""",
    40: """
w_unregularized = np.array([-1.2, -0.3, 0.0, 0.4, 2.0])
lam = 0.5
w_ridge = w_unregularized / (1 + lam)
w_lasso = np.sign(w_unregularized) * np.maximum(
    np.abs(w_unregularized) - lam,
    0,
)
print("Ridge", np.round(w_ridge, 3))
print("Lasso", np.round(w_lasso, 3))
""",
    42: """
print("ridge:", np.count_nonzero(np.isclose(w_ridge, 0)))
print("lasso:", np.count_nonzero(np.isclose(w_lasso, 0)))
""",
    44: """
for current_lambda in (0.1, 0.5, 3.0):
    ridge_now = w_unregularized / (1 + current_lambda)
    lasso_now = np.sign(w_unregularized) * np.maximum(
        np.abs(w_unregularized) - current_lambda,
        0,
    )
    print(
        f"lambda={current_lambda:.1f} | "
        f"ridge zeros {np.count_nonzero(np.isclose(ridge_now, 0))} | "
        f"lasso zeros {np.count_nonzero(np.isclose(lasso_now, 0))}"
    )
""",
    46: r"""
import matplotlib.pyplot as plt

grid = np.linspace(-2, 2, 401)
ridge_map = grid / (1 + lam)
lasso_map = np.sign(grid) * np.maximum(np.abs(grid) - lam, 0)

plt.figure(figsize=(7, 4))
plt.plot(grid, ridge_map, label=r"$\ell_2$ shrinkage")
plt.plot(grid, lasso_map, label=r"$\ell_1$ soft thresholding")
plt.axhline(0, color="black", linewidth=0.7)
plt.axvline(0, color="black", linewidth=0.7)
plt.xlabel("Unregularized coefficient")
plt.ylabel("Regularized coefficient")
plt.title(r"Coefficient maps at $\lambda=0.5$")
plt.legend()
plt.grid(alpha=0.2)
plt.show()
""",
    49: """
np.random.seed(42)
first_draw = np.random.random(3)
np.random.seed(42)
second_draw = np.random.random(3)
print(np.round(first_draw, 4))
print(np.round(second_draw, 4))
print("identical?", np.allclose(first_draw, second_draw))
""",
    51: """
restart_checks = [
    A.shape == (3, 4),
    np.allclose(A @ x, A_action(x)),
    np.linalg.matrix_rank(A) == 3,
    np.count_nonzero(np.isclose(w_lasso, 0)) == 3,
]
for check in restart_checks:
    print(check)
""",
    54: """
weak = "I use three outer products, so the minimum value is three."
strong = (
    "Three outer products reproduce A, so I is at most three. Each outer "
    "product has rank at most one, so a sum of I such terms has rank at "
    "most I. Since A has three independent rows, its rank is three. "
    "Thus I is at least three, and both bounds prove the minimum is three."
)
print("weak ->", len(weak.split()), "words")
print("strong ->", len(strong.split()), "words")
""",
    57: """
def B_action(t):
    t0, t1, t2 = t
    return np.array([2*t0 + t2, t0 - t1, 0, 3*t1], dtype=float)

basis3 = np.eye(3)
B = np.column_stack([B_action(e_j) for e_j in basis3])
print(B)
print("shape:", B.shape)
""",
    59: """
t = np.array([1., 2., 3.])
print(B @ t)
print(B_action(t))
print("match?", np.allclose(B @ t, B_action(t)))
""",
    61: """
rank_B = np.linalg.matrix_rank(B)
singular_values_B = np.linalg.svd(B, compute_uv=False)
nonzero_rows_B = np.count_nonzero(np.any(~np.isclose(B, 0), axis=1))
print("rank(B) =", rank_B)
print(np.round(singular_values_B, 3))
print("nonzero rows:", nonzero_rows_B)
""",
    63: """
terms_B = []
for row_index, row in enumerate(B):
    if not np.allclose(row, 0):
        output_basis = np.eye(B.shape[0])[row_index]
        terms_B.append(np.outer(output_basis, row))

B_decomposed = sum(terms_B, np.zeros_like(B))
print("matches B?", np.allclose(B_decomposed, B))
print("terms used:", len(terms_B))
""",
}

for index, source in completed_code.items():
    core_cells[index]["source"] = source.strip().splitlines(keepends=True)
    core_cells[index]["execution_count"] = None
    core_cells[index]["outputs"] = []

part_32_cells = [
    markdown(
        r"""
# **Part 3.2**

We need the smallest integer $I$ for which

$$
A=\sum_{i=0}^{I-1}u^{(i)}v^{(i)\top},
\qquad
A=
\begin{pmatrix}
0&0&1&-1\\
0&0&0&1\\
1&2&0&0
\end{pmatrix}.
$$

**Achievability.** Three terms are enough. Choose

$$
u^{(0)}=\begin{pmatrix}1\\0\\0\end{pmatrix},\quad
v^{(0)}=\begin{pmatrix}0\\0\\1\\-1\end{pmatrix},\qquad
u^{(1)}=\begin{pmatrix}0\\1\\0\end{pmatrix},\quad
v^{(1)}=\begin{pmatrix}0\\0\\0\\1\end{pmatrix},
$$

$$
u^{(2)}=\begin{pmatrix}0\\0\\1\end{pmatrix},\qquad
v^{(2)}=\begin{pmatrix}1\\2\\0\\0\end{pmatrix}.
$$

Then each $u^{(i)}v^{(i)\top}$ places the row $v^{(i)\top}$ into the corresponding row of the matrix, so

$$
A=u^{(0)}v^{(0)\top}+u^{(1)}v^{(1)\top}+u^{(2)}v^{(2)\top}.
$$

Therefore $I\leq 3$.

**Minimality.** Every outer product $u^{(i)}v^{(i)\top}$ has rank at most $1$. By subadditivity of rank,

$$
\operatorname{rank}\!\left(\sum_{i=0}^{I-1}u^{(i)}v^{(i)\top}\right)\leq I.
$$

The three rows of $A$ are linearly independent. In a relation among the first two rows, the third coordinate first forces the coefficient of row $1$ to be zero, and the fourth coordinate then forces the coefficient of row $2$ to be zero. Row $3$ is independent of those two because it has support in the first two columns while they have support in the last two columns. Hence $\operatorname{rank}(A)=3$, so any valid decomposition must satisfy $I\geq 3$.

Combining $I\leq 3$ and $I\geq 3$, the smallest possible value is

$$
\boxed{I=3}.
$$
"""
    ),
    code(
        """
# Verify both halves of the Part 3.2 argument computationally.
part_32_terms = [
    np.outer(np.array([1., 0., 0.]), np.array([0., 0., 1., -1.])),
    np.outer(np.array([0., 1., 0.]), np.array([0., 0., 0., 1.])),
    np.outer(np.array([0., 0., 1.]), np.array([1., 2., 0., 0.])),
]
part_32_sum = sum(part_32_terms, np.zeros_like(A))
print("decomposition matches A:", np.allclose(part_32_sum, A))
print("rank(A):", np.linalg.matrix_rank(A))
print("number of terms:", len(part_32_terms))
"""
    ),
    markdown(
        r"""
# **Required LaTeX Expressions**

$$A\in\mathbb{R}^{3\times 4}$$

$$u^{(i)}v^{(i)\top}$$

$$\hat{e}=\frac{1}{\sqrt{a}}v$$

$$\operatorname{rank}(A)=3$$

$$\sum_{i=0}^{I-1}$$
"""
    ),
]

# Place Part 3.2 immediately after Section 4, where a grader will expect it.
core_cells = core_cells[:32] + part_32_cells + core_cells[32:]

your_turn_cells = [
    markdown(
        r"""
---
# **Your Turn A**

The input $t$ has three coordinates and $Bt$ has four coordinates, so $B\in\mathbb{R}^{4\times 3}$. Reading the coefficient of each input coordinate from the rule gives

$$
B=
\begin{pmatrix}
2&0&1\\
1&-1&0\\
0&0&0\\
0&3&0
\end{pmatrix}.
$$

For $t=(1,2,3)\top$,

$$
Bt=
\begin{pmatrix}
2(1)+3\\
1-2\\
0\\
3(2)
\end{pmatrix}
=
\begin{pmatrix}5\\-1\\0\\6\end{pmatrix},
$$

which agrees with the original rule.

For a minimal outer-product decomposition, let

$$
u^{(0)}=\begin{pmatrix}1\\0\\0\\0\end{pmatrix},\quad
v^{(0)}=\begin{pmatrix}2\\0\\1\end{pmatrix},\qquad
u^{(1)}=\begin{pmatrix}0\\1\\0\\0\end{pmatrix},\quad
v^{(1)}=\begin{pmatrix}1\\-1\\0\end{pmatrix},
$$

$$
u^{(2)}=\begin{pmatrix}0\\0\\0\\1\end{pmatrix},\qquad
v^{(2)}=\begin{pmatrix}0\\3\\0\end{pmatrix}.
$$

These three terms reproduce $B$, so $I\leq 3$. The $3\times 3$ submatrix formed by rows $1$, $2$, and $4$ has determinant $3\neq 0$, so $\operatorname{rank}(B)=3$. Since a sum of $I$ rank-one matrices has rank at most $I$, we also have $I\geq 3$. Therefore

$$\boxed{I=3}.$$
"""
    ),
    code(
        """
t_check = np.array([1., 2., 3.])
print("B @ t:", B @ t_check)
print("rule:", B_action(t_check))
print("rank(B):", np.linalg.matrix_rank(B))
print("decomposition matches B:", np.allclose(B_decomposed, B))
"""
    ),
    markdown(
        r"""
# **Your Turn B**

Let $v=(1,-1,3)\top$ and $x=(2,5,-1)\top$. Since

$$\lVert v\rVert=\sqrt{1^2+(-1)^2+3^2}=\sqrt{11},$$

the unit vector is

$$
\hat e=\frac{1}{\sqrt{11}}\begin{pmatrix}1\\-1\\3\end{pmatrix}.
$$

Thus $a+b+c+d=11+1-1+3=\boxed{14}$.

The signed scalar projection is

$$
x\cdot\hat e
=\frac{2-5-3}{\sqrt{11}}
=\frac{-6}{\sqrt{11}},
$$

so $a+b=11-6=\boxed{5}$.

The residual after removing the component parallel to $\hat e$ is

$$
r=x-(x\cdot\hat e)\hat e
=x+\frac{6}{11}v
=\frac{1}{11}\begin{pmatrix}28\\49\\7\end{pmatrix}.
$$

Therefore $a+b+c+d=11+28+49+7=\boxed{95}$. Finally,

$$
r\cdot\hat e
=\frac{28-49+21}{11\sqrt{11}}
=0,
$$

so $r\perp\hat e$. This must be true because subtracting the full projection removes every component of $x$ in the $\hat e$ direction.
"""
    ),
    code(
        """
v = np.array([1., -1., 3.])
x_projection = np.array([2., 5., -1.])
e_hat = v / np.linalg.norm(v)
scalar_projection = x_projection @ e_hat
residual = x_projection - scalar_projection * e_hat
print("e_hat:", e_hat)
print("scalar projection:", scalar_projection)
print("residual:", residual)
print("residual dot e_hat:", residual @ e_hat)
"""
    ),
    markdown(
        r"""
# **Your Turn C**

The answer is **B: training an autoencoder to reconstruct its own input images**.

An autoencoder does have something it tries to match, but that target is generated from the input itself rather than supplied as a separate human-labeled class or value. It learns the structure of unlabeled data, so it is treated as unsupervised or self-supervised learning in the usual sense.
"""
    ),
    code(
        """
options = {
    "A": "temperature prediction from paired historical readings",
    "B": "autoencoder reconstruction from unlabeled images",
    "C": "pixel classification from object labels",
    "D": "essay scoring from teacher scores",
    "E": "drug-response prediction from labeled outcomes",
}
answer = "B"
print(answer, "-", options[answer])
"""
    ),
    markdown(
        r"""
# **Your Turn D**

Under an orthonormal design, the $\ell_1$ solution applies soft thresholding:

$$
\widehat w_j^{(\ell_1)}
=\operatorname{sign}(w_j)\max\{|w_j|-\lambda,0\}.
$$

The coefficient magnitudes are

$$0.15,\ 0.4,\ 0.8,\ 1.9,\ 2.5.$$

At $\lambda=1.0$, exactly the coefficients with magnitudes $0.15$, $0.4$, and $0.8$ become zero. Therefore the answer to part (a) is **C**, and exactly three coefficients are zero whenever

$$
\boxed{0.8\leq\lambda<1.9}.
$$

For $\ell_2$ regularization under the same orthonormal design,

$$
\widehat w_j^{(\ell_2)}=\frac{w_j}{1+\lambda}.
$$

None of the original coefficients is zero, and division by a finite positive number cannot make a nonzero value exactly zero. Therefore $\ell_2$ gives zero exact zeros at each listed value $\lambda\in\{0.1,0.5,1.0,2.0,3.0\}$.
"""
    ),
    code(
        """
w_turn_d = np.array([-2.5, 0.8, -0.4, 1.9, 0.15])
listed_lambdas = [0.1, 0.5, 1.0, 2.0, 3.0]

for current_lambda in listed_lambdas:
    l1_solution = np.sign(w_turn_d) * np.maximum(
        np.abs(w_turn_d) - current_lambda,
        0,
    )
    l2_solution = w_turn_d / (1 + current_lambda)
    print(
        f"lambda={current_lambda:.1f}: "
        f"l1 zeros={np.count_nonzero(np.isclose(l1_solution, 0))}, "
        f"l2 zeros={np.count_nonzero(np.isclose(l2_solution, 0))}"
    )
"""
    ),
    markdown(
        """
---
## Submission check

- Core notebook completed through Section 8
- Part 3.2 includes both achievability and minimality
- All five required expressions are typeset in LaTeX
- Your Turns A, B, C, and D are typed and supported by code
"""
    ),
]

intro = markdown(
    """
# USAAIO AI Olympiads 1 - Session 1 Homework

This single Colab notebook combines the Session 1 coding notebook, the required LaTeX practice, and typed solutions for the Day 1 extra problems.
"""
)

notebook = {
    "cells": [intro] + core_cells + your_turn_cells,
    "metadata": deepcopy(source_notebook.get("metadata", {})),
    "nbformat": 4,
    "nbformat_minor": 5,
}

OUTPUT.parent.mkdir(parents=True, exist_ok=True)
with OUTPUT.open("w", encoding="utf-8") as stream:
    json.dump(notebook, stream, ensure_ascii=False, indent=1)
    stream.write("\n")

print(OUTPUT)
print(f"cells={len(notebook['cells'])}")
