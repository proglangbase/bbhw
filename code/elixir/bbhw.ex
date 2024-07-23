defmodule BBHW do

  defp isBadArg(v), do: (IO.puts("Invalid countdown \"#{v}\", try again..."); main())
  
  def main() do
    case IO.gets("countdown: ") |> String.trim() do
      ""   -> main()
      line -> main(line)
    end
  end

  def main(""), do: main()

  def main(a) when is_atom(a),               do: isBadArg(a)
  def main(f) when is_float(f),              do: isBadArg(f)
  def main(l) when is_list(l),               do: main(Enum.join(l, " "))
  def main(i) when is_integer(i) and i <  0, do: isBadArg(i)
  def main(i) when is_integer(i) and i >= 0, do: run(i)

  def main(s) when is_binary(s) do
    case Integer.parse(s) do
      {i, ""} -> main(i);
      _       -> isBadArg(s)
    end
  end

  def main(Unk), do: isBadArg(Unk)
  
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

