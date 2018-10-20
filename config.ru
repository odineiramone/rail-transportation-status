require './config/environment'

run ApplicationController
run API::V1::ApiController

use StatusController
use API::V1::StatusController
