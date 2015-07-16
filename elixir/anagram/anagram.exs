defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    anagrams(base, candidates)
    |> List.flatten
  end

  def anagrams(base, []), do: []
  def anagrams(base, [candidate | candidates]) do
    cond do
      anagram(base, candidate) -> [candidate | match(base, candidates)]
      true -> [match(base, candidates)]
    end
  end

  def anagram(base, candidate) do
    base = base
    |> String.downcase

    candidate = candidate
    |> String.downcase

    sorted_base = fix(base)
    sorted_candidate = fix(candidate)

    cond do
      same? base, candidate -> false
      same?(sorted_base, sorted_candidate) -> true
      true -> false
    end
  end

  def same?(same, same), do: true
  def same?(_, _), do: false

  def fix word do
    word
    |> String.downcase
    |> String.split("", trim: true)
    |> Enum.sort()
    |> Enum.join("")
  end
end
