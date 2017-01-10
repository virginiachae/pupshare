class OwnerMailer < ApplicationMailer
  default from: 'notifications@pupshare.com'

  def welcome_email(owner)
    @owner = owner
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: 'Welcome to My Awesome Site')
  end

  def new_dog(owner)
    @owner = owner
    mail(to: @owner.email, subject: 'Pup Created')
  end

end
