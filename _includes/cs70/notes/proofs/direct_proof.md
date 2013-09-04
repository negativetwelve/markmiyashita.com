* Table of Contents
{:toc}


#### Structure of a Direct Proof

<!--start-->
{% include math.html %}

A direct proof is a type of proof that you are probably most familiar with. The basic structure of a direct proof is a single implication as follows: $$P \Rightarrow Q$$ where P and Q are the hypothesis and conclusion, respectively. For a direct proof, you want to __assume P__ and through logic, __prove that Q is also true__. Starting with P, you form a series of implications that eventually ends up concluding that Q is true. Let's walk through an example.
<!--end-->

#### Examples

__Theorem:__ Every odd integer is the difference of two perfect squares.

This is equivalent to saying:

$$(\forall x \in \mathbb{Z})(\text{x is odd} \Rightarrow \exists a \exists b \in \mathbb{z} \text{ such that } a^2 - b^2 = x)$$

__Proof:__ By definition, if we let $$c = 2b + 1$$ where $$b$$ in an integer, then $$c$$ must be odd. We want to prove that $$c$$ can be made up of the difference between two perfect squares.

We note the following mathematical conclusion:

$$
\begin{align*}

(b + 1)^2 - b^2 &= b^2 + 2b + 1 - b^2
\\ &= 2b + 1
\\ &= c

\end{align*}
$$

As you can see from our work above, we made a chain of implications, (if this, then that) statements to eventually conclude that $$c = 2b + 1$$ which is what we assumed at the beginning. This is the basis of a direct proof.
