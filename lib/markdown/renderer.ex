defmodule Markdown.RenderedDocument do
  defstruct body: nil, title: "Untitled Document"
end

defmodule Markdown.Renderer do
  def render(path) do
    file = path <> ".md"
    case File.read(file) do
      {:ok, string} -> string |> render_string
      {:error, :enoent} -> {:error, :enoent}  # return the error
    end
  end

  def render_string(string) do
    body = string |> Earmark.to_html
    %Markdown.RenderedDocument{ body: body, title: title_for(body) }
  end

  defp title_for(body) do
    case Regex.named_captures(title_matcher, body) do
      %{"title" => title } -> title
      nil -> "Untitled Document"
    end
  end

  defp title_matcher do
    ~r/<h1>(?<title>.*)<\/h1>/
  end
end
