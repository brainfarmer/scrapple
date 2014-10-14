defmodule MarkdownTest do
  use ExUnit.Case, async: true

  test "render markdown from filesystem" do
    html_doc = Markdown.Renderer.render("./test/resources/md_files/simple")
    expected_body = "<p>Simple markdown.</p>\n"
    expected_title = "Untitled Document"
    assert %Markdown.RenderedDocument{ title: expected_title, body: expected_body } == html_doc
  end

  test "render markdown documents from strings" do
    html_doc = Markdown.Renderer.render_string("This doc has no title.")
    expected_body = "<p>This doc has no title.</p>\n"
    expected_title = "Untitled Document"
    assert %Markdown.RenderedDocument{ title: expected_title, body: expected_body } == html_doc
  end

  test "extract titles from markdown documents" do
    html_doc = Markdown.Renderer.render_string("# This is a title\n\nThis doc has a title.")
    expected_body = "<h1>This is a title</h1>\n<p>This doc has a title.</p>\n"
    expected_title = "This is a title"
    assert %Markdown.RenderedDocument{ title: expected_title, body: expected_body } == html_doc
  end

  test "file not found throws 404 error" do
    conn = Markdown.Renderer.render("./text/resources/md_files/foobarbaz")
    assert conn.status == 404
  end
end
