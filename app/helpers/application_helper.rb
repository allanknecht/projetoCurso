module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded-circle")
  end
end
