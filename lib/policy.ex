defmodule SPF.Policy do
  @doc """
  Lookup the SPF Policy for a `domain`.
  """
  def lookup(domain) do
    [res] = :inet_res.lookup(domain |> to_char_list, :in, :txt, edns: 0)
    res
    |> Enum.join
    |> to_string
  end
end
