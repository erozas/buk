class AppNameTool < ApplicationTool
  description "Get the name of the app"

  def call
    "The name of the app is #{Rails.application.class.module_parent_name}"
  end
end