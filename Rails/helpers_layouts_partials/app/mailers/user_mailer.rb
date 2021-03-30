class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user
        @url = 'example.com/login'
        mail(to: user.username, subject: 'Welcome to the website')
    end
end
