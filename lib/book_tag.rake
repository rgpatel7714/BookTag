namespace :book_tag do
  task send_mail: :environment do
    #do somthing
    BookTagMailsMailer.send_mail.deliver_now
  end
end
  
  