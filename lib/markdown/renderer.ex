defmodule Markdown.RenderedDocument do
  defstruct body: nil, title: "Untitled Document"
end

defmodule Markdown.Renderer do
  def render(path) do
    file = path <> ".md"
    {:ok, string} = File.read(file)
    string |> render_string
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
