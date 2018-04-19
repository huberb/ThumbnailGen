defmodule Thumb do

  def start do
    create_thumbs("./videos/")
  end

  def create_thumbs(path) do
    File.ls!(path) |> Enum.each(fn(file_name) -> 
      full_path = Path.join(path, file_name)
      cond do
        File.dir?(full_path) -> 
          create_thumbs(full_path)

        is_video(full_path) ->
          file_name = Path.absname(full_path)
          thumb_name = Path.rootname(full_path) <> ".thumb.jpg"
          Thumbnex.create_thumbnail(
            file_name, thumb_name, max_width: 200, max_height: 200
          )
          IO.puts "written " <> Path.basename(thumb_name)

        true -> 
          nil
      end
    end)
  end

  defp is_video(file) do
    String.ends_with?(file, [".mkv", ".mp4"])
  end

end
