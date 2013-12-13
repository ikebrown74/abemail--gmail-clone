
class EmailProcessor < ActiveRecord::Base # to add the logger
  def self.process(email)
    puts "--------------------started from the bottom now we here!"

    abe_mail = email.to.class == Array ? email.to.first.strip : email.to.strip
 message = Message.new({
      body: email.raw_body,
      sender: email.from ,
      draft: false,
      subject: email.subject,
      recipient_emails: abe_mail
    })

    puts "--------------------we made it this far!"
    message.save
    puts "--------------------by now we might have an email!"
  end

end

# :body, :draft, :sender, :sender_id, :subject, :recipient_emails