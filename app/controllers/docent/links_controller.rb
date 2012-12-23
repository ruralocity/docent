require_dependency "docent/application_controller"

module Docent
  class LinksController < ApplicationController

    def index
      @links = Link.all
    end

    def new
      @link = Link.new
    end

    def edit
      @link = Link.find(params[:id])
    end

    def create
      @link = Link.new(params[:link])

      if @link.save
        redirect_to links_url, notice: 'Successfully created link.'
      else
        render action: "new"
      end
    end

    def update
      @link = Link.find(params[:id])

      if @link.update_attributes(params[:link])
        redirect_to links_url, notice: 'Successfully updated link.'
      else
        render action: "edit"
      end
    end

    def destroy
      @link = Link.find(params[:id])
      @link.destroy

      redirect_to links_url, notice: 'Successfully deleted link.'
    end
  end
end
