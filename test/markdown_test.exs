defmodule MarkdownTest do
  use ExUnit.Case

  test "renders markdown documents from strings" do
    html_doc = Markdown.Renderer.render_string("This doc has no title.")
    expected_body = "<p>This doc has no title.</p>\n"
    expected_title = "Untitled Document"
    assert %Markdown.RenderedDocument{ title: expected_title, body: expected_body } == html_doc
  end

  test "extracts titles from markdown documents" do
    html_doc = Markdown.Renderer.render_string("# This is a title\n\nThis doc has a title.")
    expected_body = "<h1>This is a title</h1>\n<p>This doc has a title.</p>\n"
    expected_title = "This is a title"
    assert %Markdown.RenderedDocument{ title: expected_title, body: expected_body } == html_doc
  end
end
