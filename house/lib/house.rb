class House
  attr_reader :data, :intro

  ACTORS = [
    'the horse and the hound and the horn',
    'the farmer sowing his corn',
    'the rooster that crowed in the morn',
    'the priest all shaven and shorn',
    'the man all tattered and torn',
    'the maiden all forlorn',
    'the cow with the crumpled horn',
    'the dog',
    'the cat',
    'the rat',
    'the malt',
    'the house'
  ]

  ACTIONS = [
    'that belonged to',
    'that kept',
    'that woke',
    'that married',
    'that kissed',
    'that milked',
    'that tossed',
    'that worried',
    'that killed',
    'that ate',
    'that lay in',
    'that Jack built'
  ]

  def initialize(orderer: NormalOrder.new, intro: NormalIntroduction.new)
    @data = orderer.order(standard_data)
    @intro = intro.content
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "#{intro} #{phrase(num)}.\n"
  end

  def phrase(num)
    data.last(num).join(' ')
  end

  def standard_data
    ACTORS.zip(ACTIONS).map{|phrase| phrase.join(" ")}
  end
end

class NormalOrder
  def order(data)
    data
  end
end

class RandomOrder
  def order(data)
    data.shuffle
  end
end

class RandomExceptLastItemOrder
  def order(data)
    data[0..-2].shuffle << data[-1]
  end
end

class NormalIntroduction
  def content
    "This is"
  end
end

class PirateIntroduction
  def content
    "Arrrrrr here be"
  end
end

# puts House.new(orderer: RandomOrder.new).line(12)
# puts House.new(intro: PirateIntroduction.new).line(12)
# puts House.new(orderer: RandomOrder.new, intro: PirateIntroduction.new).line(12)

# random but "the house that jack built" is always at the end - totally random vs sort of random.
# do this without introducing a new argument.
puts House.new(orderer: RandomExceptLastItemOrder.new).line(12)

# be able to mix actors and actions, eg "the dog" "that worried" with "the priest all shaven and shorn" "that married" to
# "the dog that married" and "the priest all shaven and shorn that worried"
