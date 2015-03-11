module DateRangeSelector
  class Engine < ::Rails::Engine
    isolate_namespace DateRangeSelector

    initializer 'date_range_selector.assets.precompile' do |app|
      app.config.assets.precompile += ['vendor/*.js', 'vendor/*.css']
    end
  end
end
