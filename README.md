# CurrencyConvertApi

Implementation for the API available in this site: https://free.currencyconverterapi.com

This uses [Tesla]() library to make easier the access to the endpoint and [Nebulex]() for the cache and avoid to perform so many queries to the service.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `currency_convert_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:currency_convert_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/currency_convert_api](https://hexdocs.pm/currency_convert_api).

## Usage

```elixir
CurrencyConverterApi.convert_call "USD", "EUR"
# 0.876545
```

Enjoy!
