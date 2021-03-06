module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayfied = CodeRayify.new(filter_html: true, hard_wrap: true, prettify: true)

    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      lax_spacing: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayfied, options)
    markdown_to_html.render(text).html_safe
  end

  def blog_status_color blog
    return fa_icon('toggle-off') if blog.published?

    fa_icon('toggle-on')
  end
end
