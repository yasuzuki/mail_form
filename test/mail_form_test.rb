require 'test_helper'
require 'fixtures/sample_mail'

class MailFormTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MailForm
  end

  test 'sample mail has name and email as attributes' do
    sample = SampleMail.new
    sample.name = "User"
    assert_equal "User", sample.name
    sample.email = "user@example.com"
    assert_equal = "user@example.com", sample.email
    sample.clear_name
    sample.clear_email
    assert_nil sample.name
    assert_nil sample.email
  end

  test 'sample mail can ask if an attribute is present or not' do
    sample = SampleMail.new
    assert !sample.name?

    sample.name = "User"
    assert sample.name?

    sample.email = "Email"
    assert sample.email?
  end

  test "can retrieve all attributes values" do
    sample = SampleMail.new
    sample.name = "John Doe"
    sample.email = "john.doe@example.com"
    assert_equal "John Doe", sample.attributes["name"]
    assert_equal "john.doe@example.com", sample.attributes["email"]
  end
end
