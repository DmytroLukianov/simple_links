class LinksController < ApplicationController
  before_action :set_link, only: %i[edit update destroy]

  def index

    @tags = Tag.all
    @links =
      if params[:tag_id].present?
        Tag.find_by(id: params[:tag_id]).try(:links)
      else
        Link.includes(:tags)
      end
    @links = @links.page(params[:page]).per(params[:per])
  end

  def new
    @link = Link.new
  end

  def create
    # TODO: Add user for link (owner)
    @link = Link.new(link_params)
    Link::BuildTags.call(@link)
    if @link.save
      flash[:success] = I18n.t('links.successfully_created')
      redirect_to root_path
    else
      flash.now[:error] = I18n.t('links.creation_error')
      render action: :new
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      flash[:success] = I18n.t('links.successfully_updated')
      redirect_to link_path(@link)
    else
      flash.now[:error] = I18n.t('links.updation_error')
      render action: :edit
    end
  end

  def destroy
    if @link.destroy
      flash[:success] = I18n.t('links.successfully_destroyed')
      redirect_to root_path
    else
      flash[:error] = I18n.t('links.can_not_destroy_because',
        message: @link.errors.full_messages.join(', '))
      redirect_to link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :description, :tmp_tags)
  end

  def set_link
    @link = Link.find_by id: params[:id]
    if @link.blank?
      flash[:error] = I18n.t('messages.errors.not_found')
      redirect_to root_path
    end
  end
end
