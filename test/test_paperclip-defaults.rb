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

  def test_default_asset_url_will_use_action_controller_view_context_to_decide_default_url
    ActionController::Base.stubs(:new).returns(mock('new_action_controller'))
    ActionController::Base.new.stubs(:view_context).returns(mock('view_context'))
    ActionController::Base.new.view_context.stubs(:asset_path).returns('http://www.example.com/unknown.png')

    model = Class.new(ActiveRecord::Base) do
      has_attached_file :image1, default_asset_url: "unknown.png"
    end

    expect = {validations: [], default_url: "http://www.example.com/unknown.png"}
    assert_equal [], model.attachment_definitions[:image1][:validations]
    assert_equal Proc, model.attachment_definitions[:image1][:default_url].class
    assert_equal "http://www.example.com/unknown.png", model.attachment_definitions[:image1][:default_url].call(nil)
  end

  def test_default_asset_url_with_proc_will_make_use_of_it_each_time
    ActionController::Base.stubs(:new).returns(mock('new_action_controller'))
    ActionController::Base.new.stubs(:view_context).returns(mock('view_context'))
    ActionController::Base.new.view_context.stubs(:asset_path).returns('http://www.example.com/unknown.png')

    model = Class.new(ActiveRecord::Base) do
      has_attached_file :image1, default_asset_url: ->(attachment){ "UNKNOWN.PNG".downcase }
    end

    expect = {validations: [], default_url: "http://www.example.com/unknown.png"}
    assert_equal [], model.attachment_definitions[:image1][:validations]
    assert_equal Proc, model.attachment_definitions[:image1][:default_url].class
    assert_equal "http://www.example.com/unknown.png", model.attachment_definitions[:image1][:default_url].call(nil)
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
