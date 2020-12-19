# frozen_string_literal: true

# https://dev.to/nitinkatkam/building-a-desktop-gui-app-with-ruby-3b0m
require 'gtk3'
APP_NAME = 'Secret Santa'
GREETING = 'Happy Christmas'
PARTING = 'Christmas is over... :('
WINDOW_SIDE = 500
window = Gtk::Window.new(APP_NAME)
window.set_size_request(WINDOW_SIDE, WINDOW_SIDE)
window.signal_connect 'delete-event' do |_e|
  puts PARTING
  Gtk.main_quit
end

grid = Gtk::Grid.new
label = Gtk::Label.new(APP_NAME)
grid.attach label, 1, 0, 1, 1

button = Gtk::Button.new(label: "Say #{GREETING}")
button.signal_connect 'clicked' do |_e|
  puts "#{GREETING} !!!"
end
grid.attach button, 1, 1, 1, 1

window.add grid
window.show_all
Gtk.main
