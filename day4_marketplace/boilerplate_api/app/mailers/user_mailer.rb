class UserMailer < Devise::Mailer
 default from: "youremail@test.com"
 before_action :add_inline_attachments!

 def reset_password_instructions(record, token, opts={})
   super
 end

 private
 def add_inline_attachments!
   attachments.inline['logo.jpg'] = File.read(Rails.root.join('app/assets/images/logo.jpg'))
 end
end
