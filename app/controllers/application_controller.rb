class ApplicationController < ActionController::Base
  def current_user
    session[:current_user]
  end

  def pass_current_user(login_user)
    session[:current_user] = login_user
  end

  def car_object(car)
    @object = {
      name: car.name,
      description: car.description,
      model_info: car.model_info,
      reservation_fee: car.reservation_fee,
      user_id: car.user_id,
      image: Cloudinary::Utils.cloudinary_url(car.image.key)
    }
  end
end
