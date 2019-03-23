OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '634821683625371', '7950d03a04638e05c890a70066837194'
end 