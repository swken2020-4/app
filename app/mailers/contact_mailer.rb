class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to: 'web-site@example.com' , subject: '就活相談内容'
    end
    
end
