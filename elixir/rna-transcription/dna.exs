defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([h]) do
    convert(h)
  end
  def to_rna([h|t]) do
    convert(h) ++ to_rna(t)
  end

  defp convert(?G), do: 'C'
  defp convert(?C), do: 'G'
  defp convert(?T), do: 'A'
  defp convert(?A), do: 'U'
end
