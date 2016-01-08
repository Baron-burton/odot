class PostmarkMailer < ActionMailer::Base
	default from: "odotsupport@postmark.com"
	default_url_options[:host] = "localhost:3000"

  # def message
  #   mail(
  #     :subject => 'Hello from Postmark',
  #     :to  => 'brandon.anthony.burton@gmail.co.uk',
  #     :from => 'odotsupport@postmark.com',
  #     :html_body => '<strong>Hello</strong> dear Postmark user.',
  #     :track_opens => 'true')
  # end

   def password_reset(user)
  	@user = user
  	mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
  			 subject: "Reset Your Password")
  end

  #  def welcome_email(user)
  #   @user = user
  #   mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>", 
  #   		 subject: 'Welcome to Odot')
  # end
end