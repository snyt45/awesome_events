require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: { args: ["headless", "disable-gpu", "no-sandbox", "disable-dev-shm-usage"] }
  include SignInHelper
end
