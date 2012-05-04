require 'passive_support/core_ext/object/try_send'

class Hash
  # Attempt to convert the keys `depth` levels deep to symbols.
  #
  # Examples:
  #
  #   { "foo" => "bar" }.symbolify
  #   # => { :foo => "bar" }
  #
  #   { "foo" => { "bar" => "bat" } }.symbolify(2)
  #   # => { :foo => { :bar => "bat" } }
  #
  #   { 1 => "car" }.symbolify
  #   # => { 1 => "car" }
  #
  # Returns the symbolified Hash.
  def symbolify(depth=1)
    inject({}) do |memo, (k,v) |
      # Recurse `depth` times.
      memo[k.try_send(:to_sym)] = if depth > 1 and v.is_a? Hash
        v.symbolify(depth-1)
      else
        v
      end
      memo
    end
  end
end
