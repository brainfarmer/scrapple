defmodule Integration.DocumentsTest do
  use IntegrationTest.Case

  test "renders an index of available files" do
    body = get("/docs/sampledoc")
    assert Regex.match?(~r/Sample/, body)
  end
end
