defmodule CurrencyConverterApi do
  use Tesla
  require Logger
  alias CurrencyConverterApi.Cache

  plug Tesla.Middleware.BaseUrl, "https://free.currencyconverterapi.com"
  plug Tesla.Middleware.Headers, [{"content-type", "application/json"}]
  plug Tesla.Middleware.JSON

  @ttl 3600

  def convert(from, to, apiKey) do
    case Cache.get({:convert, from, to}) do
      nil ->
        data = convert_call(from, to, apiKey)
        Cache.set({:convert, from, to}, data, on_conflict: :replace, ttl: @ttl)
      data ->
        data
    end
  end

  def convert_call(from, to, apiKey) do
    case get("/api/v6/convert", query: [q: "#{from}_#{to}", compact: "y", apiKey: apiKey]) do
      {:ok, resp} ->
        Logger.debug "resp (ok) => #{inspect resp.body}"
        resp.body["#{from}_#{to}"]["val"]
      {:error, _} = error -> error
    end
  end
end
