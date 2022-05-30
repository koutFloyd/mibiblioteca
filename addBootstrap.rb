# Configurador de Bootstrap para proyecto rails 7
# Version de ruby ~> 2.6
# Autor: Patricio Pino AKA GReenDucK_cl
# Obviamente hay mejores formas de hacerlo, pero...
File.open("./Gemfile","a") do | f | f.write("\n# GReenDucK_cl: requisitos para activar bootstrap\ngem \"bootstrap\"\ngem \"sassc-rails\"") end
# renombrar archivo applications.css a *.scss y agregar bootstrap ¿?

File.delete "./app/assets/stylesheets/application.css"

File.open( "./app/assets/stylesheets/application.scss", "a" ) do | f | f.write( "\n@import \"bootstrap\";") end
# agregar popper y bootstrap a importmap.rb
File.open("./config/importmap.rb","a") do | f | f.write("\npin \"popper\", to: \"popper.js\", preload: true\npin \"bootstrap\", to: \"bootstrap.min.js\", preload: true" ) end
# agregar popper y bootstrap a javascript/applications.js
File.open("./app/javascript/application.js","a") do | f | f.write("\nimport \"popper\"\nimport \"bootstrap\"\n" ) end
# Agregar assets a /config/initializers/assets.rb
File.open("./config/initializers/assets.rb","a") do | f | f.write("\nRails.application.config.assets.precompile += %w( application.scss popper.js bootstrap.min.js )\n" ) end