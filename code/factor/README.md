# Factor

From [Factor's homepage]:

> The Factor programming language is a concatenative,
> stack-based programming language with high-level features including dynamic types,
> extensible syntax, macros, and garbage collection.
> On a practical side, Factor has a full-featured library,
> supports many different platforms, and has been extensively documented.
>
> The implementation is fully compiled for performance,
> while still supporting interactive development.
> Factor applications are portable between all common platforms.
> Factor can deploy stand-alone applications on all platforms.
> Full source code for the Factor project is available under a BSD license.

---

If Factor is already installed and its `factor` in your path,
`run` will use the fast, non-optimizing compiler to run `bbhw.factor`,
and `run-optimized` will use the slow, optimizing compiler to build `bbhw`
from `bbhw.factor` and run that.

If Factor is not found,
either of those scripts will first download and build Factor itself.

[Factor's homepage]: https://factorcode.org/
