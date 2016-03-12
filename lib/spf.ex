defmodule SPF do
  alias SPF.Policy

  @doc """
  Look up the SPF policy for `domain`.
  """
  def lookup(domain) do
    Policy.lookup(domain)
  end

  @doc """
  Check whether `server_ip` is allowed to send for `email`.
  """
  def check(email, server_ip) do
    policy = email
    |> domain_part
    |> lookup
  end

  defp domain_part(email) do
    email
    |> String.split("@")
    |> Enum.at(1)
  end
end
