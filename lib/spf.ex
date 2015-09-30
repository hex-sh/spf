defmodule SPF do
  alias SPF.Policy

  def lookup(domain) do
    Policy.lookup(domain)
  end
end
