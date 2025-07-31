module UsersHelper
  def dashboard_greeting(user)
    if user.confirmed?
      "Welcome back #{user.username}, nice to see you around!"
    else
      "Please confirm your account before going further."
    end
  end

  def avatar_for(user)
    content_tag :div, class: "w-12 h-12 rounded-full overflow-hidden" do
      image_tag url_for(user.avatar), class: "w-full h-full object-cover"
    end
  end
end
