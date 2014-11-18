defmodule Integration.ViewLocalDocuments do
  use ConnHelper
  use IntegrationTest.Case
  alias Scrapple.Router

  # View Document Index
  test "view document index when index exists" do
    conn = call(Router, :get, "/docs/sampledoc")
    assert conn.status == 200
    assert conn.resp_body =~ ~r/Sample/
  end

  test "index doesn't exist" do
    conn = call(Router, :get, "/docs/no_index_doc")
    assert conn.status == 404
  end

  # Follow local hyperlinks
  @tag :pending
  test "follow local hyperlinks - relative path" do
    IO.puts "PENDING: follow local hyperlinks - relative path"
  end

  @tag :pending
  test "follow local hyperlinks - quoted path" do
    IO.puts "PENDING: follow local hyperlinks - quoted path"
  end

  @tag :pending
  test "follow local hyperlinks - non-existent path" do
    IO.puts "PENDING: follow local hyperlinks - non-existent path"
  end
end
