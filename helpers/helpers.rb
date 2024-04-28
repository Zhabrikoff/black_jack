module Helpers
  def take_answer
    gets.chomp
  end

  def incorrect_choice
    'Incorrect menu item selected, select the correct menu item!'
  end

  def exit_program
    Kernel.exit
  end

  def delimiter
    puts '===================================='
  end
end
