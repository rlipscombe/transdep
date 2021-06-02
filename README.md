# transdep

Demonstrate mix/hex/rebar transitive dependency bug.

See https://elixirforum.com/t/compiling-erlang-project-but-transitive-dependency-uses-mix-exs-with-wrong-language-option/27125/5

The bug was introduced in hex 0.17.2.

...and fixed in https://github.com/elixir-lang/elixir/pull/9625.

## Reproduction

Requires Elixir 1.9.4.

### Actual

Install hex 0.17.2:

```
wget https://repo.hex.pm/installs/1.5.0/hex-0.17.2.ez
mix archive.install hex-0.17.2.ez --force
```

Compile this project:

```
rm -rf _build deps mix.lock
mix do deps.get, compile
```

You can see it compiling `ssl_verify_fun` with mix:

```
==> ssl_verify_fun
Compiling 7 files (.erl)
Generated ssl_verify_fun app
```

Note that it's added a spurious dependency on `elixir`:

```
$ grep elixir _build/dev/lib/ssl_verify_fun/ebin/ssl_verify_fun.app
             [{applications,[kernel,stdlib,elixir]},
```

### Expected

Install hex 0.17.1:

```
wget https://repo.hex.pm/installs/1.5.0/hex-0.17.1.ez
mix archive.install hex-0.17.1.ez --force
```

Compile this project:

```
rm -rf _build deps mix.lock
mix do deps.get, compile
```

You can see it compiling `ssl_verify_fun` with rebar:

```
===> Compiling ssl_verify_fun
```

Note that it HAS NOT added a spurious dependency on `elixir`:

```
$ grep elixir _build/dev/lib/ssl_verify_fun/ebin/ssl_verify_fun.app
```

(... you should see no output)
