defmodule Scrapple.MarkdownController do
  use Phoenix.Controller
  alias Markdown.Renderer

  def show(conn, _params) do
    document = Renderer.render_string("# This was markdown!\n\nIt's actually working!!!")
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

