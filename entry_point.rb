class EntryPoint
  def main
    app = App.new

    loop do
      app.display_menu
      option = gets.chomp.to_i
      process_option(app, option)
      puts "\n"
    end
  end

  private

  def process_option(app, option)
    option_actions = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :exit_app
    }

    if option_actions.key?(option)
      app.send(option_actions[option])
    else
      puts 'Invalid option'
    end
  end

  def exit_app
    puts 'Exiting the app...'
    exit
  end
end
