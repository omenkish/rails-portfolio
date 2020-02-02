module ApplicationHelper
  def login_helper
    return link_to 'Logout', destroy_user_session_path, method: :delete unless current_user.is_a?(GuestUser)

    (link_to 'Register', new_user_registration_path) +
      '<br>'.html_safe +
      (link_to 'Login', new_user_session_path)
  end

  def source_helper(layout_name)
    return unless session[:source]

    greeting = "Thanks for visiting me from #{session[:source]} and you are on #{layout_name}"
    content_tag(:p, greeting, class: 'source-greeting')
  end

  def copyright_generator
    OmenkishViewTool::Renderer.copyright 'Eneojo Omede', 'All rights reserved'
  end
end
