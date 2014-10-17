Code.require_file("conn_helper.exs", __DIR__)

Scrapple.Router.start
ExUnit.start

defmodule IntegrationTest.Case do
  defmacro __using__(_options) do
    quote do
      use ExUnit.Case, async: true
    end
  end
end
