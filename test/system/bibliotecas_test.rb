require "application_system_test_case"

class BibliotecasTest < ApplicationSystemTestCase
  setup do
    @biblioteca = bibliotecas(:one)
  end

  test "visiting the index" do
    visit bibliotecas_url
    assert_selector "h1", text: "Bibliotecas"
  end

  test "should create biblioteca" do
    visit bibliotecas_url
    click_on "New biblioteca"

    fill_in "Autor", with: @biblioteca.autor
    fill_in "Estado", with: @biblioteca.estado
    fill_in "Fechadev", with: @biblioteca.fechadev
    fill_in "Fechapres", with: @biblioteca.fechapres
    fill_in "Libro", with: @biblioteca.libro
    fill_in "Titulo", with: @biblioteca.titulo
    click_on "Create Biblioteca"

    assert_text "Biblioteca was successfully created"
    click_on "Back"
  end

  test "should update Biblioteca" do
    visit biblioteca_url(@biblioteca)
    click_on "Edit this biblioteca", match: :first

    fill_in "Autor", with: @biblioteca.autor
    fill_in "Estado", with: @biblioteca.estado
    fill_in "Fechadev", with: @biblioteca.fechadev
    fill_in "Fechapres", with: @biblioteca.fechapres
    fill_in "Libro", with: @biblioteca.libro
    fill_in "Titulo", with: @biblioteca.titulo
    click_on "Update Biblioteca"

    assert_text "Biblioteca was successfully updated"
    click_on "Back"
  end

  test "should destroy Biblioteca" do
    visit biblioteca_url(@biblioteca)
    click_on "Destroy this biblioteca", match: :first

    assert_text "Biblioteca was successfully destroyed"
  end
end
