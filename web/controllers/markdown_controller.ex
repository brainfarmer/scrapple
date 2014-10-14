defmodule Scrapple.MarkdownController do
  use Phoenix.Controller
  alias Markdown.Renderer

  def show(conn, params) do
    document = params
      |> requested_file
      |> Renderer.render
    html(conn, html_for(document))
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

  # Override call/2 to trap file not found errors
  def call(conn, opts) do
    try do
      super(conn, opts)
    rescue
      #e -> conn |> put_status(404) |> render "user_404"
      :error -> call(Router, :get, "/404")
    end
  end
end

