# typed: true
# selective-apply-code-action: quickfix
# keep-apply-all-quickfix: true

class A::Foo
  B::Foo.new
# ^^^^^^ error: `B::Foo` resolves but its package is not imported
# ^^^^^^ apply-code-action: [A] Import `B` in package `A`
# ^^^^^^ apply-code-action: [B] Apply all Sorbet fixes for file
  B::Foo.new
# ^^^^^^ error: `B::Foo` resolves but its package is not imported
# ^^^^^^ apply-code-action: [C] Import `B` in package `A`
# ^^^^^^ apply-code-action: [D] Apply all Sorbet fixes for file
  C::Foo.new
# ^^^^^^ error: `C::Foo` resolves but its package is not imported
# ^^^^^^ apply-code-action: [I] Import `C` in package `A`
# ^^^^^^ apply-code-action: [J] Apply all Sorbet fixes for file
  D::Foo.new
# ^^^^^^ error: `D::Foo` resolves but is not exported from `D`
  D::Foo.new
# ^^^^^^ error: `D::Foo` resolves but is not exported from `D`
end
