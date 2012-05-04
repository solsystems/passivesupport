module Enumerable
  # Map an Enumerable into a Hash
  #
  # block - Block which returns `[key, value]` or `nil` (in which case no entry
  #         will be created) Default: {|k,v| [k,v]}
  #
  #
  # Examples:
  #
  #   [1, 2, 3, 4].map_hash{|num| [num, num] }
  #   # => {1 => 1, 2 => 2, 3 => 3, 4 => 4}
  #
  #   [[1,2,3,4], [11,12,13,14], [21,22,23,24]].map_hash{|a,b,c,d| [a,c]}
  #   # => {1 => 3, 11 => 13, 21 => 23}
  #
  #   { foo: 1, bar: 2}.map_hash{|k,v| [k, v*v]}
  #   # => {:foo => 1, :bar => 4}
  #
  #   [ ["chocolate", "awesome"], ['broccoli', 'not so much'] ].map_hash
  #   # => { "chocolate" => "awesome", "broccoli" => "not so much" }
  #
  # Returns a Hash.
  def map_to_hash(&block)
    block ||= proc{ |k,v| [k,v] }
    inject({}) do |new_hash, *args|
      block_result = block.call(*args)

      # Store the key, value set in the new Hash
      unless block_result.nil?
        key, value = block_result
        new_hash[key] = value
      end

      new_hash
    end
  end
end
