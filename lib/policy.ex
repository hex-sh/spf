defmodule SPF.Policy do
  alias SPF.Rule

  defstruct rules: [], domain: nil

  @doc """
  Lookup the SPF Policy for a `domain`.
  """
  def lookup(domain) do
    [res] = :inet_res.lookup(domain |> to_char_list, :in, :txt, edns: 0)
    res
    |> Enum.join
    |> to_string
    |> parse(domain)
  end

  defp parse("v=spf1" <> policy, domain) do
    rules = policy
    |> String.split
    |> Enum.map(&Rule.parse/1)

    %__MODULE__{rules: rules, domain: domain}
  end

  defp parse(policy) do
    {:error, "Policy does not start with SPF version."}
  end
end
