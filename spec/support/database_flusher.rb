RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :suite do
    if File.exists?('.~lock')
      puts 'Unclean shutdown, cleaning the whole database...'
      DatabaseFlusher[:active_record].clean_with(:deletion)
    else
      File.open('.~lock', 'a') {}
    end

    DatabaseFlusher[:active_record].strategy = :transaction
  end

  config.after :suite do
    File.unlink('.~lock')
  end

  config.before :each do
    DatabaseFlusher[:active_record].strategy = :transaction
  end

  config.before :each, type: :feature do
    if Capybara.current_driver != :rack_test
      DatabaseFlusher[:active_record].strategy = :deletion
    end
  end

  config.before :each do
    DatabaseFlusher.start
  end

  config.append_after :each do
    DatabaseFlusher.clean
  end
end
