defmodule UrlParser do
  def test_url() do
    "https://elixir-lang.org/section/subsection/page.html?a=42&b=1000&c=500"
  end

  def parser(url) do
    [protocol, rest] = String.split(url, "://")
    [domain , rest] = String.split(rest, "/", parts: 2)
    [path , rest] = String.split(rest, "?")

    %{
      protocol: protocol,
      domain: domain,
      path: path,
      params: parse_params(rest),
      # params: parse_params(rest),
    }
  end

  def parse_params(rest) do
    params = String.split(rest, "&")
    Enum.map(params, fn p -> parse_param(p) end)
  end

  def parse_param(param) do
    dbg(param)
    [key, value] = String.split(param, "=")
    %{key: key, value: value }
    # %{key => value }
  end
end


ExUnit.start()

defmodule UrlParserTest do
  use ExUnit.Case
  import UrlParser

  test "test parser" do

    assert parser(test_url()) == %{
      protocol: "https",
      domain: "elixir-lang.org",
      params: [%{value: "42", key: "a"}, %{value: "1000", key: "b"}, %{value: "500", key: "c"}],
      path: "section/subsection/page.html"
    }
  end
end
