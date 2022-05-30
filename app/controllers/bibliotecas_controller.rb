class BibliotecasController < ApplicationController
  before_action :set_biblioteca, only: %i[ show edit update destroy ]

  # GET /bibliotecas or /bibliotecas.json
  def index
    
    if params[:search].present?
      @q = Biblioteca.where("estado =?", params[:search]).ransack(params[:q])
      @bibliotecas = @q.result(distinct: true)

    else
      @q = Biblioteca.all.ransack(params[:q])
      @bibliotecas = @q.result(distinct: true)
    end
  end

  # GET /bibliotecas/1 or /bibliotecas/1.json
  def show
  end

  # GET /bibliotecas/new
  def new
    @biblioteca = Biblioteca.new
  end

  # GET /bibliotecas/1/edit
  def edit
  end

  # POST /bibliotecas or /bibliotecas.json
  def create
    @biblioteca = Biblioteca.new(biblioteca_params)

    respond_to do |format|
      if @biblioteca.save
        format.html { redirect_to biblioteca_url(@biblioteca), notice: "Biblioteca was successfully created." }
        format.json { render :show, status: :created, location: @biblioteca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @biblioteca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliotecas/1 or /bibliotecas/1.json
  def update
    respond_to do |format|
      if @biblioteca.update(biblioteca_params)
        format.html { redirect_to biblioteca_url(@biblioteca), notice: "Biblioteca was successfully updated." }
        format.json { render :show, status: :ok, location: @biblioteca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @biblioteca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliotecas/1 or /bibliotecas/1.json
  def destroy
    @biblioteca.destroy

    respond_to do |format|
      format.html { redirect_to bibliotecas_url, notice: "Biblioteca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca
      @biblioteca = Biblioteca.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def biblioteca_params
      params.require(:biblioteca).permit(:libro, :titulo, :autor, :estado, :fechapres, :fechadev)
    end
end
