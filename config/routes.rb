TutorialSampleApp32FromStart::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  root to: 'static_pages#home'
end
