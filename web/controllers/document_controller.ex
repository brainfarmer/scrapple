defmodule Scrapple.DocumentController do
  use Phoenix.Controller
  alias Markdown.Renderer
  plug :action

  @moduledoc """
  **DocumentController** handles serving structured markdown documents.

  This controller will not list directory contents when a directory is
  specified.  Rather, it will look for `index.md` or a `scrapple.yml`
  file that specified the document `indexFile`.

  Methods in this controller will determine how to interpret relative links
  between markdown files and decorate the output accordingly.

  NOT YET IMPLEMENTED:

  - `scrapple.yml` file
  - relative link decoration

  """

  @doc """
  **index** will render the `indexFile` of a given document directory;
  it will either be specified in `scrapple.yml` file, or be named `index.md`.
  """
  def index(conn, params) do
    document = params
      |> index_file
      |> Renderer.render
    case document do
      {:error, _} -> error_file_not_found(conn)
      _           -> html(conn, html_for(document))
    end
  end


  def show(conn, params) do
    document = params
     |> requested_file
     |> Renderer.render
    case document do
      {:error, _} -> error_file_not_found(conn)
      _           -> html(conn, html_for(document))
    end
  end

  @doc """
  **index_file** currently scans the specified document directory
  (passed in via the `doc` parameter) for an `index.md` file.

  TODO: Update this method to look for `scrapple.yml` and
  load the `indexFile`, if specified.
  """
  defp index_file(params) do
    "#{base_dir}/#{params["doc"]}/index"
  end

  @doc """
  **requested_file** returns the path to the specified file.
  """
  defp requested_file(params) do
    "#{base_dir}/#{params["doc"]}/#{params["path"]}"
  end

  @doc """
  **base_dir** will look for a `DOCUMENTS_SERVER_DIR` environment
  variable.  If not found, it will return `default_base_dir` which
  points to `test`.
  """
  def base_dir do
    System.get_env("DOCUMENTS_SERVER_DIR") || default_base_dir
  end

  @doc """
  In the absence of an appropriate environment variable, `default_base_dir`
  will point to the `test` directory.
  """
  def default_base_dir do
    "./test/resources/md_files/"
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
    Not Found
    ===

    ![wtf](http://www.thinktraining.ca/portals/0/404_man.jpg)
    """ |> Renderer.render_string
    html(conn, 404, html_for(document))
  end
end
