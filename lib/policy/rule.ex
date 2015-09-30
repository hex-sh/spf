defmodule SPF.Policy.Rule do
  defstruct mechanism: :all, qualifier: :pass, filter: nil

  @doc """
  Parse an SPF rule into a %Rule{} struct.

      iex> SPF.Policy.Rule.parse("ip4:192.0.2.0/24")
      %SPF.Policy.Rule{mechanism: :ip4, qualifier: :pass, filter: "192.0.2.0/24"}
  """
  def parse("+" <> rule_rest) do
    parse(:pass, rule_rest)
  end
  def parse("?" <> rule_rest) do
    parse(:neutral, rule_rest)
  end
  def parse("~" <> rule_rest) do
    parse(:softfail, rule_rest)
  end
  def parse("-" <> rule_rest) do
    parse(:fail, rule_rest)
  end
  # A rule without a plus on the front can be interpreted as positive.
  def parse(rule_rest) do
    parse("+" <> rule_rest)
  end

  defp parse(qualifier, "a") do
    parse(qualifier, :a, nil)
  end
  defp parse(qualifier, "a:" <> filter) do
    parse(qualifier, :a, filter)
  end
  defp parse(qualifier, "mx") do
    parse(qualifier, :mx, nil)
  end
  defp parse(qualifier, "all") do
    parse(qualifier, :all, nil)
  end
  defp parse(qualifier, "mx") do
    parse(qualifier, :mx, nil)
  end
  defp parse(qualifier, "ip4:" <> filter) do
    parse(qualifier, :ip4, filter)
  end
  defp parse(qualifier, "ip6:" <> filter) do
    parse(qualifier, :ip4, filter)
  end

  # Catch all version that constructs the final struct.
  defp parse(qualifier, mechanism, filter) do
    %__MODULE__{mechanism: mechanism, qualifier: qualifier, filter: filter}
  end
end
