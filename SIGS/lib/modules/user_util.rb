  def verifyCoordinator
    if params[:type] == 'coordinator'
      params[:user].permit(:id, :name, :email, :password, :registration,
                           :cpf, :active, :image,
                           coordinator_attributes: [:course_id, :user_id])
   else
     params[:user].permit(:id, :name, :email, :password, :registration,
                          :cpf, :active, :image)
    end
  end
