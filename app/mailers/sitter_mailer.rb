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

  def scheduled_rental(sitter)
    @sitter = sitter
    mail(to: @sitter.email, subject: 'Pending Pup Rental Request')
  end

  def rental_approved(sitter, owner, rental)
    @sitter = sitter
    @owner = owner
    @rental = rental
    mail(to: @sitter.email, subject: 'Rental Approved')
  end

  def declined_rental(sitter, rental)
    @sitter = sitter
    @rental = rental
    mail(to: @sitter.email, subject: 'Not this time!')
  end



end
