defmodule BBHW do

  def isBadArg(v), do: IO.puts("Invalid countdown \"#{v}\", try again...")
  
  def main() do
    case IO.gets("countdown: ") |> String.trim() do
      ""   -> main()
      line -> main(line)
    end
  end

  def main(a) when is_atom(a),  do: (isBadArg(a); main())
  def main(f) when is_float(f), do: (isBadArg(f); main())
  def main(l) when is_list(l),  do: main(hd(l ++ [""]))

  def main(s) when is_binary(s) do
    case String.length(s) > 0 do
      true -> 
        case Integer.parse(s) do
          {i, ""} -> main(i)
          _       -> isBadArg(s); main()
        end
      false -> main()
    end
  end
  
  def main(i) when is_integer(i) do
    case i >= 0 do
      true  -> run(i)
      false -> isBadArg(i); main()
    end
  end

  defp run(count) do
    IO.write("World, Hello...")
    rundown(count)
    IO.puts("Bye Bye.")
  end
    
  defp rundown(0), do: :ok
  defp rundown(count) do
    IO.write("#{count}...")
    Process.sleep(1000) 
    rundown(count-1)
  end
end

