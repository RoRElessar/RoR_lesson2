require 'colorize'
class Ball

  def shake
    @answer =
    ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes - definitely',
    'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good',
    'Signs point to yes', 'Yes', 'Reply hazy, try again', 'Ask again later',
    'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again',
    'Don\'t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good',
    'Very doubtful']
    
    @i_answer = rand(@answer.length)
    @prophecy = @answer[@i_answer]
    
      if @i_answer < 5
       @prophecy.blue
      elsif @i_answer < 10
       @prophecy.green
      elsif @i_answer < 15
       @prophecy.yellow
      else
       @prophecy.red
      end
    end 
end


puts ('Ask a Magic Ball ').blue + ('anything you ').green + ('want to know:').yellow
ask = gets.chomp
ball = Ball.new
puts ball.shake
