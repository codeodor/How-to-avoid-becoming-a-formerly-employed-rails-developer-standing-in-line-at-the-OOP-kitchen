class Enumeration
  def Enumeration.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def Enumeration.const_missing(key)
    @hash[key]
  end   

  def Enumeration.each
    @hash.each {|key,value| yield(key,value)}
  end

  def Enumeration.values
    @hash.values || []
  end

  def Enumeration.keys
    @hash.keys || []
  end

  def Enumeration.name_select
    @hash.values.sort{|a,b| a[:id] <=> b[:id]}.collect{|v| [v[:name], v[:id]]}
  end

  def Enumeration.key_select
    @hash.keys.sort{|a,b| a.to_s <=> b.to_s}.collect{|k| [k.to_s, @hash[k][:id]]}
  end

  def Enumeration.[](key)
    v = @hash[key]
    if v.nil?
      v = @hash.values.find{|val| val[:id] == key}
      v = v[:name] if v
    end
    v
  end
end

