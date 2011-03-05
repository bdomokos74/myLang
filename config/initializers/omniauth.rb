Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '137958536270378', '376cfbf2e0269739376293516078e242'
end
