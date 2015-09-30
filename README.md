# SPF [![Build Status]][build-link] [![Hex Version]][version-link] ![License]

**Pre-alpha software.** Elixir implementation of Sender Policy Framework.

## Installation

Add spf to your list of dependencies in `mix.exs`:

```
def deps do
  [{:spf, "~> 0.0.1"}]
end
```

Ensure spf is started before your application:

```
def application do
  [applications: [:spf]]
end
```

 [Build Status]:https://api.travis-ci.org/hex-sh/spf.svg?branch=master
 [Hex Version]:https://img.shields.io/hexpm/v/spf.svg?label=hex%20version
 [License]:https://img.shields.io/hexpm/l/spf.svg
 [build-link]:https://travis-ci.org/hex-sh/spf
 [version-link]:https://hex.pm/packages/spf
