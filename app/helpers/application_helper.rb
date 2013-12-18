module ApplicationHelper
  include SessionsHelper

  def create_password_reset_url(reset_token)
    url = Addressable::URI.new(
      :scheme => 'http',
      :host => 'localhost:3000',
      :path => "#{edit_password_reset_path}",
      :query_values => { :reset_token => "#{reset_token}" }
    ).to_s
  end
end
