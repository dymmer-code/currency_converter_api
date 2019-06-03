defmodule CurrencyConverterApi.Cache do
  use Nebulex.Cache, otp_app: :currency_converter_api,
                     adapter: Application.get_env(:currency_converter_api,
                                                  __MODULE__,
                                                  [adapter: Nebulex.Adapters.Local])[:adapter]
end
