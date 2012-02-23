require_relative 'test_helper'

class TestPaperclipDefaults < MiniTest::Unit::TestCase
  def setup
    Rails.stubs(:application).returns(mock('application'))
    Rails.application.stubs(:config).returns(mock('config'))
    Rails.application.config.stubs(:paperclip_defaults).returns({})
  end

  def test_has_attached_file_sets_defaults
    Rails.application.config.stubs(:paperclip_defaults).returns({storage: :fog})
    model = Class.new(ActiveRecord::Base) do
      has_attached_file :image1, default_url: "/unknown.png"
    end

    expect = {validations: [], default_url: "/unknown.png", storage: :fog}
    assert_equal expect, model.attachment_definitions[:image1]
  end

  def test_defaults_will_not_overwrite_explicit_options
    Rails.application.config.stubs(:paperclip_defaults).returns({storage: :fog})
    model = Class.new(ActiveRecord::Base) do
      has_attached_file :image1, default_url: "/unknown.png", storage: :filesystem
    end

    expect = {validations: [], default_url: "/unknown.png", storage: :filesystem}
    assert_equal expect, model.attachment_definitions[:image1]
  end
end
