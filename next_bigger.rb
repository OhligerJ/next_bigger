def next_bigger(n)
  digits = n.to_s.split("")

  # Determine whether this is the biggest number
  $biggest = true
  $i = digits.length - 1
  $bottom = 0
  while $i > $bottom do
    if ( (defined? digits[$i]) && (defined? digits[$i - 1]) && (digits[$i] > digits[$i - 1]))
      # puts $i.to_s + " digits[$i]: " + digits[$i] + " digits[$i-1]" + digits[$i - 1]
      $biggest = false
      break
    end
    $i -=1
  end

  if ($biggest == true)
    return -1
  end

  i = digits.length - 1
  $bottom = 0
  sub_digits = Array.new
  while i > $bottom do
    if ( (digits[i] > digits[i - 1]) )
      if (digits.length == 2)
        return (digits[1] + digits[0]).to_i
      end
      if (!sub_digits.include?(digits[i]))
        sub_digits.push(digits[i])
      end
      if (!sub_digits.include?(digits[i-1]))
        sub_digits.push(digits[i-1])
      end

      sub_digits.sort

      hold = digits[(i - 1)] #this value to be added later to array2
      hold2 = sub_digits[sub_digits.index(hold).to_i + 1] #next largest digit to right of hold

      array1 = digits[0..(i-1)]
      array2 = digits[i..(digits.length - 1)]

      array1.slice!(i-1)
      array1.push(hold2)

      array2.slice!(array2.index(hold2))
      array2.push(hold)

      array1.concat(array2.sort)
      return array1.join("").to_i
    else
      if (!sub_digits.include?(digits[i])) #create an array of digits that exist to the right of we're we end up stopping
        sub_digits.push(digits[i])
      end
    end
    i -=1
  end

end

puts next_bigger(513)
# 59884848483559
# 59884848459853