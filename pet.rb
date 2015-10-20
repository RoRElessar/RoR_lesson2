require 'colorize'
class Zombie

  attr_reader :satiety

  def initialize name
    @name = name.capitalize.blue
    @asleep = false
    @satiety = 10
    @walking = 0
    

    puts ('Beware! ').red + @name + (' has been raised from the dead!!!').red
    puts
  end

  def feed
    puts 'You feed ' + @name + ' with brains.'
    @satiety = 10
    passageOfTime 
  end

  def walk
    puts 'You bring ' + @name + ' for a walk.'
    @walking = 0
    passageOfTime
  end

  def kill
    puts ('You kill ').red + @name + (' by shooting in its head.').red
    exit
  end

  def close
    puts 'You\'re trying to close ' + @name + ' in the coffin.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' makes strange noises and continues to rot.'
      end
    end
      if @asleep
        @asleep = false
        puts @name + ' wakes up slowly.'
      end
  end

  def play
    puts 'You\'re playing with ' + @name + ', by putting your hand close to its mouth.'
    puts 'Its snaping and trying to bite you.'
    passageOfTime
  end

  def bang
    puts 'You strike ' + @name + '.'
    @asleep = true
    puts 'It quickly falls asleep...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes up, once you have stopped hitting it.'
    end
  end

  private

  def hungry?
    @satiety <= 2
  end

  def poopy?
    @walking >= 8
  end

  def passageOfTime
    if @satiety > 0
      @satiety = @satiety - 1
      @walking = @satiety + 1
    else
      if @asleep
        @asleep = false
        puts @name + ' suddenly wakes up!'
      end
      puts @name + ' is hungry! Taken to the extreme, it eats ' + ('YOU!').red
      exit
    end

    if @walking >= 10
      @walking = 0
      puts 'Oh! ' + @name + ' did something nasty...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'Its suddenly wakes up!'
      end
      puts @name + '\'s stomach rumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He suddenly wakes up!'
      end
      puts @name + ' makes strange noise, cause it wants to belch...'
    end
  end

end

puts ('Name your zombie:').yellow
name = gets.chomp
zombie = Zombie.new (name)

while zombie.satiety >= 0
  puts ('Choose an action:').green
  puts ('1 - feed yor zombie.').yellow
  puts '2 - walk with your zombie.'
  puts ('3 - close your zombie in a coffin.').green
  puts ('4 - play with your zombie.').red
  puts ('5 - hit your zombie.').blue
  puts ('6 - kill your zombie.').yellow
  puts

  action = gets.chomp.to_i
  puts

  case action
  when 0 then puts 'Choose another action.'
  when 1 then zombie.feed
  when 2 then zombie.walk
  when 3 then zombie.close
  when 4 then zombie.play
  when 5 then zombie.bang
  when 6 then zombie.kill
  end
end

