require './config/environment'

require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/users_controller' 
require_relative 'app/controllers/outfits_controller' 
use Rack::MethodOverride
 use UsersController
 use OutfitsController

run ApplicationController
