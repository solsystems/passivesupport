require 'active_support/core_ext/object/blank'

class Hash
  # Search the leaf nodes of a Hash and get back Hash with the original structure
  # containing only the branches which match `pattern`.
  #
  # pattern - What you are searching for. Will be converted to Regexp, so you can
  #           pass, for example, 1, /\s{2,}/, or "string" as convenient.
  #
  # Examples
  #
  #   {
  #     :oogle => ["foogle", "boogle" ],
  #     :zork => ["gork", "bork"],
  #     :foo => "bar",
  #   }.grep_leaves /g/
  #   # => { :oogle => ["foogle", "boogle"], :zork => ["gork"] }
  #
  # Returns a Hash with the leaves which do not match `pattern` removed and empty
  # branches pruned.
  def grep_leaves(pattern)
    # Must be able to match `pattern` to things, so make it a Regexp if neccessary.
    pattern = /#{ pattern }/ unless pattern.is_a? Regexp

    inject({}) do |result, (key,value) |
      value = case value
      # Recurse for Hash
      when Hash
        value.grep_hash(pattern, &block)
      # Defer to grep on arrays
      when Array
        value.grep(pattern)
      end

      # Save the key into the result Hash if anything matched.
      result[key] = value unless value.blank?
      result
    end
  end
end
