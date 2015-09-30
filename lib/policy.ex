defmodule SPF.Policy do
  alias SPF.Policy.Rule

  defstruct rules: []

  @doc """
  Prepend a `rule` to the `rules` of the policy.
  """
  def prepend(rule, %SPF.Policy{rules: rules}) do
    %SPF.Policy{rules: [rule | rules]}
  end

  @doc """
  Append a `rule` to the `rules` of the policy.
  """
  def append(rule, %SPF.Policy{rules: rules}) do
    %SPF.Policy{rules: rules ++ [rule]}
  end

  @doc """
  Lookup the SPF Policy for a `domain`.
  """
  def lookup(domain) do
    [res] = :inet_res.lookup(domain |> to_char_list, :in, :txt, edns: 0)
    res
    |> Enum.join
    |> to_string
    |> parse
  end

  defp parse("v=spf1" <> policy) do
    rules = policy
    |> String.split

    IO.puts(inspect(rules))
    rules = Enum.map(rules, &Rule.parse/1)

    %__MODULE__{rules: rules}
  end

  defp parse(policy) do
    {:error, "Policy does not start with SPF version."}
  end
end
