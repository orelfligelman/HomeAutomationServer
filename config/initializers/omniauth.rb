OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2,'1004490162122-5rd2tj5us1feb4f5kngq8cpslm6j943l.apps.googleusercontent.com','9caXQhlu1o7nTT8Agn5Ntas4', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end