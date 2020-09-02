require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
<<<<<<< HEAD
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |driver_option|
    driver_option.add_argument '--no-sandbox'
  end
=======
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
>>>>>>> upstream/master
end
