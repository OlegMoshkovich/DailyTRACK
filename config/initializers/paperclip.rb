Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_protocol] = 'http'
Paperclip::Attachment.default_options[:s3_credentials] =
  {
    :bucket => ENV['DailyTrack'],
    :access_key_id => ENV['AKIAITH4NMYJBWDZIGOA'],
    :secret_access_key => ENV['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']
  }


  