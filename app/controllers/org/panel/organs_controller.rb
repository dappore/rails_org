class Org::Panel::OrgansController < Org::Panel::BaseController
  before_action :set_organ, only: [:show, :edit, :update, :mock, :destroy]

  def show
  end

  def login
    member = current_user.members.find_by(organ_id: params[:organ_id])
    session[:organ_token] = member.get_organ_token
    redirect_to panel_organ_url
  end

  def edit
  end

  def update
    if @organ.update(organ_params)
      redirect_to panel_organs_url, notice: 'Organ was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @organ.destroy
    redirect_to panel_organs_url, notice: 'Organ was successfully destroyed.'
  end


  private
  def set_organ
    @organ = current_organ
  end

  def organ_params
    params.fetch(:organ, {}).permit(
      :name,
      :organ_uuid,
      :logo
    )
  end

end