Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'doctor_list', to: 'users#doctor_list'
  get 'doctor_available_on_date', to: 'users#doctor_available_on_date'
  get 'book_appointment', to: 'appointments#create'
end
