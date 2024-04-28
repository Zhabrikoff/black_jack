module Menu
  MAIN_MENU = [
    { id: '1', title: 'New game', action: :new_game },
    { id: '2', title: 'Show my money', action: :show_my_money },
    { id: '0', title: 'Exit', action: :exit_program }
  ].freeze

  USER_MENU = [
    { id: '1', title: 'Take card', action: :user_move },
    { id: '2', title: 'Skip', action: :dealer_move },
    { id: '3', title: 'Open cards', action: :end_game }
  ].freeze

  def show_menu(menu)
    delimiter

    menu.each { |menu_item| puts "#{menu_item[:id]}. #{menu_item[:title]}" }

    choice = take_answer
    menu_processing(menu, choice)
  end

  def menu_processing(menu, choice)
    selected_menu_item = menu.find { |menu_item| menu_item[:id] == choice }
    if selected_menu_item
      send(selected_menu_item[:action])
    else
      puts incorrect_choice
      show_menu(menu)
    end
  end
end
