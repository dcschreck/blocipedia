class CollaboratorsController < ApplicationController

    def create
        wiki = Wiki.find(params[:wiki_id])
        collaborator = wiki.collaborators.build(user_id: params[:collab_user])

        if collaborator.save
            flash[:notice] = "Collaborator has been added to Wiki."
        else
            flash[:alert] = "Adding collaborator has failed."
        end

        redirect_to wiki
    end

    def destroy
        wiki = Wiki.find(params[:wiki_id])
        collaborator = Collaborator.find(params[:id])

        if collaborator.destroy
            flash[:notice] = "Collaborator has been removed."
        else
            flash[:alert] = "Removal failed."
        end

        redirect_to wiki
    end
end
