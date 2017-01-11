class SitterMailer < ApplicationMailer
  default from: 'notifications@pupshare.com'

  def welcome_email(sitter)
    @sitter = sitter
    @url  = 'http://example.com/login'
    mail(to: @sitter.email, subject: 'Welcome to Pup Share')
  end

  def new_dog(sitter)
    @sitter = sitter
    mail(to: @sitter.email, subject: 'Pup Created')
  end

  def pending_rental(sitter)
    @sitter = sitter
    mail(to: @sitter.sitter, subject: 'Pending Pup Rental Request')
  end
end
