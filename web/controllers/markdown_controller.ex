defmodule Scrapple.MarkdownController do
  use Phoenix.Controller
  alias Markdown.Renderer

  def show(conn, params) do
    document = params
     |> requested_file
     |> Renderer.render
    case document do
      {:error, _} ->
        error_file_not_found(conn)
      _ ->
        html(conn, html_for(document))
    end
  end

  defp requested_file(params) do
    "./test/resources/md_files/#{params["page"]}"
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

  defp error_file_not_found(conn) do
    document = """
    # Not Found

    ![wtf](http://static.giantbomb.com/uploads/original/1/10099/516535-87665dude_wtf_posters1z.jpg)

    (Sorry, we couldn't find the file you specified)
    """ |> Renderer.render_string
    html(conn, 404, html_for(document))
  end

end

