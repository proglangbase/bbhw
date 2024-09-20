defmodule BBHW do

  defp badArg(v), do: (IO.puts("Invalid countdown \"#{v}\", try again..."); main())
  
  def main() do
    case IO.gets("countdown: ") |> String.trim() do
      ""   -> main()
      line -> main(line)
    end
  end

  def main(""), do: main()

  def main(a) when is_atom(a),              do: badArg(a)
  def main(f) when is_float(f),             do: badArg(f)
  def main(i) when is_integer(i) and i < 0, do: badArg(i)
  def main(l) when is_list(l),              do: main(Enum.join(l, " "))

  def main(s) when is_binary(s) do
    case Integer.parse(s) do
      {i, ""} -> main(i);
      _       -> badArg(s)
    end
  end

  def main(count) when is_integer(count) and count >= 0 do
    loop = fn (0, _) -> :ok; (i, f) ->
      IO.write("#{i}...")
      Process.sleep(1000) 
      f.(i-1, f)
    end
    IO.write("World, Hello...")
    loop.(count, loop)
    IO.puts("Bye Bye.")
  end

  def main(Unk), do: badArg(Unk)
end

