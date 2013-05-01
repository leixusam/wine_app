module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def profile_photo_for(user)
    fb_profile_url = "http://graph.facebook.com/#{user.username}/picture"
    image_tag(fb_profile_url, alt: user.name)
  end
end