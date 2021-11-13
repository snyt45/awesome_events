require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test '#created_by? owner_id と 引数の#idが同じとき' do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.creaeted_by?(user))
    end
  end
  test '#created_by? owner_id と 引数の#idが異なるとき' do
    event = FactoryBot.create(:event)
    another_user = FactoryBot.create(:user)
    assert_equal(false, event.creaeted_by?(another_user))
  end
  test '#created_by? nil なとき' do
    event = FactoryBot.create(:event)
    assert_equal(false, event.creaeted_by?(nil))
  end
end
