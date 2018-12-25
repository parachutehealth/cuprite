# frozen_string_literal: true

require "capybara"

Thread.abort_on_exception = true
Thread.report_on_exception = true

module Capybara::Cuprite
  require "cuprite/driver"
  require "cuprite/browser"
  require "cuprite/node"
  require "cuprite/errors"
  require "cuprite/cookie"

  class << self
    def windows?
      RbConfig::CONFIG["host_os"] =~ /mingw|mswin|cygwin/
    end

    def mri?
      defined?(RUBY_ENGINE) && RUBY_ENGINE == "ruby"
    end
  end
end

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app)
end
