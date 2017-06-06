require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "contact_me" do
    message = Message.new name:   'anna',
                          email:  'anna@example.com',
                          body:   'Hello! How are you doing?'

    email = MessageMailer.contact_me(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal "Message from Horse Show Connection", email.subject
    assert_equal ["nvoswork@gmail.com"], email.to
    assert_equal ["anna@example.com"], email.from
    assert_match /Hello! How are you doing?/, email.body.encoded
  end

end
