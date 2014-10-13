defmodule Scrapple.MarkdownController do
  use Phoenix.Controller
  alias Markdown.Renderer

  def show(conn, _params) do
    document = Renderer.render_string("# Thiggy Jones\n\n![thiggy](https://avatars0.githubusercontent.com/u/7998116?v=2&s=460)")
    html(conn, html_for(document))
  end

  defp html_for(rendered_document) do
    """
    <html>
      <head>
        <title>#{rendered_document.title}</title>
      </head>
      <body>
        #{rendered_document.body}
      </body>
    </html>
    """
  end
end

