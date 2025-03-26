module ApplicationHelper
  include Pagy::Frontend

  def provider_icon_path(provider)
    case provider
      when "google_oauth2"
        "google.png"
      when "github"
        "github-icon-black.svg"
      when "developer"
        "developer.svg"
    end
  end
end
