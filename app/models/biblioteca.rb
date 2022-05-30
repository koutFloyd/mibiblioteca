class Biblioteca < ApplicationRecord
    validates :titulo, :autor, :fechadev, :fechapres, presence: {message: "Debe ingresar datos"}

end
