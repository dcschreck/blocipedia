class WikisController < ApplicationController
    def index
        @wikis = Wiki.all
    end

    def show
        @wiki = Wiki.find(params[:id])
    end

    def new
        authorize @wiki
        @wiki = Wiki.new
    end

    def edit
        authorize @wiki
        @wiki = Wiki.find(params[:id])
    end

    def update
        authorize @wiki
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)

        if @wiki.save
            flash[:notice] = "Wiki was updated."
            redirect_to [@wiki]
        else
            flash.now[:alert] = "There was an error saving the Wiki. Please try again."
            render :edit
        end
    end

    def create
        authorize @wiki
        @wiki = Wiki.new(wiki_params)
        @wiki.user = current_user

        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the Wiki. Please try again."
            render :new
        end
    end

    def destroy
        @wiki = Wiki.find(params[:id])
        authorize @wiki

        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted sucessfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the Wiki."
            render :show
        end
    end

    private
    def wiki_params
        params.require(:wiki).permit(:title, :body)
    end
end
