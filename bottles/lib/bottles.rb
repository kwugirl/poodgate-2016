class Bottles
  def song
    verses(99,0)
  end

  def verses(start, stop)
    phrases = start.downto(stop).map {|n| verse(n)}
    phrases.join("\n")
  end

  def verse(num)
    case num
    when 0
      "#{stringified_quantity(num).capitalize} #{matching_noun(num)} of beer on the wall, " +
      "#{stringified_quantity(num)} #{matching_noun(num)} of beer.\n" +
      "Go to the store and buy some more, " +
      "#{stringified_quantity(num-1)} #{matching_noun(num-1)} of beer on the wall.\n"
    else
      "#{stringified_quantity(num).capitalize} #{matching_noun(num)} of beer on the wall, " +
      "#{stringified_quantity(num)} #{matching_noun(num)} of beer.\n" +
      "Take #{thing_to_take(num)} down and pass it around, " +
      "#{stringified_quantity(num-1)} #{matching_noun(num-1)} of beer on the wall.\n"
    end
  end

  def matching_noun(num)
    if num == 1
      "bottle"
    else
      "bottles"
    end
  end

  def thing_to_take(num)
    if num == 1
      "it"
    else
      "one"
    end
  end

  def stringified_quantity(num)
    if num == 0
      "no more"
    elsif num == -1
      99
    else
      num.to_s
    end
  end
end
