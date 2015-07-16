defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(a,b) when length(a) > length(b), do: false
  defp sublist?(a=[_|a_tail], b=[_ | b_tail]) do
    cond do
      is_sublist_in_a_row?(a,b) -> true
      sublist?(a, b_tail) -> true
      true -> false
    end
  end

  defp is_sublist_in_a_row?([], _), do: true
  defp is_sublist_in_a_row? [a|a_tail], [a|b_tail] do
    is_sublist_in_a_row? a_tail, b_tail
  end
  defp is_sublist_in_a_row?(_, _), do: false
end
