class Hash
  def compress_chains
    inject({}) do |memo, (k,v) |
      if v.is_a? Hash
        v = v.compress_chains
        if v.size == 1
          v=v.values[0]
        end
      end
      memo[k]=v
      memo
    end
  end
end
