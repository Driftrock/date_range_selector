Rails.application.routes.draw do
  mount DateRangeSelector::Engine => "/date_range_selector"
  root to: 'dummy#index'
end
