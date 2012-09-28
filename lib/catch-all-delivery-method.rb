class CatchAllDeliveryMethod < ::Mail::SMTP

    # new options:
    #  :recipient_email -> catch-all email
    #  :whitelist -> array off allowed emails
    def initialize(values)
      super(values)
      self.settings[:whitelist]||=[]
      raise 'Setup :recipient_email in config.action_mailer.catch_all_settings !' if settings[:recipient_email].blank?
    end
    
    # Send the message via SMTP, changing all destinations emails to catch-all recipient_email
    # optional setting: whitelist -> array off allowed emails
    def deliver!(mail)
      allowed_emails=Proc.new {|a| settings[:whitelist].include?(a) }
      mail.to=mail.to_addrs.select(&allowed_emails)<<settings[:recipient_email]
      mail.bcc=mail.bcc_addrs.select(&allowed_emails)
      mail.cc=mail.cc_addrs.select(&allowed_emails)
      super(mail)
    end
end

ActionMailer::Base.add_delivery_method :catch_all, CatchAllDeliveryMethod