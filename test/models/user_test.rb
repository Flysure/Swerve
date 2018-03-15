require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example", last_name: "User", born_on:"1997/06/18",
       username: "Flyman13", password_digest:(BCrypt::Password.create('testpassword')),
       email: "user@example.com", )
  end

  test "should be valid" do
    assert @user.valid?
  end
end
