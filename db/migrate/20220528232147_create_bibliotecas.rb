class CreateBibliotecas < ActiveRecord::Migration[7.0]
  def change
    create_table :bibliotecas do |t|
      t.string :libro
      t.string :titulo
      t.string :autor
      t.string :estado
      t.string :fechapres
      t.string :fechadev

      t.timestamps
    end
  end
end
