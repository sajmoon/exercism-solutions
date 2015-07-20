defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming(strand1, strand2)
  end
  
  defp hamming(strand1, strand2) when length(strand1) != length(strand2), do: nil
  defp hamming('', ''), do: 0
  defp hamming([ first | strand1], [ second | strand2]) do
    cond do
      first != second -> 1 + hamming(strand1, strand2)
      true -> hamming(strand1, strand2)
    end
  end
end
