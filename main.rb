require 'terminal-table'
require 'alphavantagerb'
require 'io/console' # this module allow us to read user input char by char. 
require_relative 'lib/Functions' 
require_relative 'lib/Forex'
require_relative 'lib/Menus'


Menus.main_menu
