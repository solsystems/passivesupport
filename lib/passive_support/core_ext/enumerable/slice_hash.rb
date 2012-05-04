class Enumerable
  # Parse an array of [key, value, another_key, another_value] into a Hash.
  #
  # Example
  # %w{foo bar baz bif}.slice_hash # =>  {'foo' => 'bar', 'baz' => 'bif'}
  #
  # Returns a Hash
  def slice_hash
    hash = {}
    each_slice(2) { |k,v| hash[k]=v }
    hash
  end
end
