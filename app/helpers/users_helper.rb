module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    email_hash = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{email_hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "rounded-full shadow w-#{size} h-#{size}")
  end
end
