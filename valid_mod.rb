module ValidateModule
  def only_number?(str)
    (str =~ /^\d+$/) ? true : false
  end

  def in_range?(min,max,input)
    num = input.to_i
    (min <= num && num <= max) ? true : false
  end

  def empty_string?(str)
    if str == nil
      return false
    else
      return (str.length == 0)? true : false
    end
  end
end
