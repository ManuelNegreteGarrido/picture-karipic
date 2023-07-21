class PublicationsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin, only: [:create, :update, :edit, :destroy]
  before_action :set_publication, only: [ :show, :edit, :update, :destroy ]

  # GET /publications or /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    @comments = @publication.comments
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  #def 
  #edit

  #end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user
    @publication.images.attach(params[:publication][:images])

    respond_to do |format|
      if @publication.save
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    if current_user.admin? && current_user.email == "admin@correo.cl"
      # Simplemente redirige a la lista de publicaciones sin eliminar la publicación
      redirect_to publications_url, notice: "Publication was successfully removed from the page."
    else
      redirect_to @publication, alert: "You are not authorized to delete this publication."
    end
  end

  # otras acciones...

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end
end
    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:description, :user_id, :images)
    end

    def authorize_admin
      unless current_user.admin?
        redirect_to home_index_path, notice: "No estás autorizado para hacer esta acción"
      end
    end
