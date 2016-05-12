Rails.application.routes.draw do

  root 'welcome#index'
  get 'clinics' => 'welcome#clinics'
  get 'geolocate' => 'welcome#geolocate'
end
