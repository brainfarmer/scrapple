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
end
