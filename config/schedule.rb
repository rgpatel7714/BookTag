every :monday, at: '9am' do
    #command "rm '#{path}/log/job.log'"
    #runner "User.new.call_from_cron"
    rake "book_tag:send_mail"
end
  
  