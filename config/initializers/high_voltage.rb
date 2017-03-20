HighVoltage.configure do |config|
  # Sets '/views/pages/home' as root directory
  config.home_page = 'home'
  config.route_drawer = HighVoltage::RouteDrawers::Root
end
