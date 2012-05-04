class Hash
  def grep_hash(pattern = nil, &block)
    throw 'must provide pattern or block' unless pattern or block
    inject({}) do |memo, (k,v) |
      v = case v
      when Hash
        v.grep_hash(pattern, &block)
      when Array
        if block
          v.select(&block)
        else
          v.grep(pattern)
        end
      end
      memo[k] = v unless v.empty?
      memo
    end
  end
end

