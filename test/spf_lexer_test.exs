defmodule SpfLexerTest do
  use ExUnit.Case, async: true

  test "tokenizer: all mechanism" do
    assert :spf.string('v=spf1 mx -all') == {:ok, [{:version, 1, 'v=spf1'},
      {:mechanism, 1, :mx}, {:qualifier, 1, :-}, {:mechanism, 1, :all}], 1}

    assert :spf.string('v=spf1 -all') == {:ok, [{:version, 1, 'v=spf1'},
      {:qualifier, 1, :-}, {:mechanism, 1, :all}], 1}

    assert :spf.string('v=spf1 +all') == {:ok, [{:version, 1, 'v=spf1'},
      {:qualifier, 1, :+}, {:mechanism, 1, :all}], 1}
  end

  test "tokenizer: ip4 mechanism" do
    assert :spf.string('v=spf1 ip4:192.168.0.1/16 -all') == {:ok,
      [{:version, 1, 'v=spf1'}, {:mechanism, 1, :ip4}, {:ip4, 1,
          '192.168.0.1/16'}, {:qualifier, 1, :-}, {:mechanism, 1, :all}], 1}
  end

  test "tokenizer: ip6 mechanism" do
    assert :spf.string('v=spf1 ip6:1080::8:800:200C:417A/96 -all') == {:ok, []}
  end
end
