ActionController::Routing::Routes.draw do |map|
  map.resources :response_formats

  map.resources :uri_types

  map.resources :kingdoms

  map.resources :name_strings

  
  map.root :controller => 'data_sources'
  
  map.resources :access_rules

  map.resources :access_types, :has_many => :access_rules

  map.resources :data_sources, :has_many => [:data_providers, :access_rules]

  map.resources :participant_contacts

  map.resources :data_providers, :has_many => :data_provider_roles 

  map.resources :data_provider_roles

  map.resources :participants, :has_many => :participant_contacts, :has_one => :data_provider
  
  map.resources :participant_people, :has_many => :participant_contacts, :has_one => :data_provider
  
  map.resources :participant_organizations, :has_many => :participant_contacts, :has_one => :data_provider

  map.resources :organization_contacts

  map.resources :organizations, :has_many => [:participant_organizations, :organization_contacts]
     
  map.resources :people, :has_many => [:participant_people, :participant_contacts, :organization_contacts]

  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
