Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :questions
      resources :answers
    end
  end
end
