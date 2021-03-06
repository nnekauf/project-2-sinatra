require './config/environment'

 
use Rack::MethodOverride
use UsersController
use OutfitsController

run ApplicationController
