defmodule BBHW do

  def main(),   do: run()
  def main([]), do: run()
  def main(arg) when is_atom(arg), do: isBadArg(arg)
  def main(arg) when is_list(arg), do: main(hd(arg))

  def main(arg) when is_integer(arg) do
    case isItGood(arg) do
      true  -> run(arg)
      false -> isBadArg(arg)
    end
  end

  def main(arg) do
    case getCountdown arg do
      :error -> run()
      count  -> run(count)
    end
  end

  defp getCountdown(s) do
    case Integer.parse(s) do
      {i, ""} -> case isItGood i do
        true -> i
        _   -> isNotGood(i)
      end
      _ -> isNotGood(s)
    end
  end

  defp isBadArg(arg) do
    isNotGood(arg)
    run()
  end

  defp isItGood(i), do: i >= 0

  defp isNotGood(a) when is_atom(a),   do: isNotGood(to_string(a))
  defp isNotGood(s) when is_binary(s), do: isNotGood("\"#{s}\"", :print)
  defp isNotGood(i), do: isNotGood(i, :print)
  defp isNotGood(v, :print) do
    IO.puts("Invalid countdown #{v}, try again...")
    :error
  end

  defp readInput() do
    case IO.gets("countdown: ") |> String.trim() do
      ""   -> readInput()
      line -> case getCountdown(line) do
        :error -> readInput()
        i      -> i
      end
    end
  end

  defp run(), do: run(readInput())   
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

