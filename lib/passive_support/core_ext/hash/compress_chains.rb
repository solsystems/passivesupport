class Hash
  # Compress chains of Hashes when they are in a chain of single values
  #
  # Examples:
  #
  #  { :key => :value }.compress_chains
  #  # => { :key => :value }
  #
  #  { :key => { :subkey => :value } }.compress_chains
  #  # => { :key => :value }
  #
  #  { :key => { :subkey => :value, :other_thing => :other_value } }.compress_chains
  #  # => { :key => { :subkey => :value, :other_thing => :other_value } }
  #
  #   {
  #     :oogle => ["foogle", "boogle" ],
  #     :zork => { "gork" => "bork" },
  #     :foo => "bar",
  #   }.compress_chains
  #   # => { :oogle => ["foogle", "boogle"], :zork => "bork", :foo => "bar" }
  #
  # Returns the compressed Hash
  def compress_chains
    inject({}) do |result, (key, value) |
      # Recurse for Hash values
      if value.is_a? Hash
        value = value.compress_chains
        # Remove intermediate keys if there is only one value
        # i.e., `{ :foo => { :bar => :bat } }` becomes `{ :foo => :bat }`
        if value.size == 1
          value = value.values[0]
        end
      end

      result[key] = value
      result
    end
  end
end
