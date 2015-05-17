class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json
  def tags
    render json: {
      "success" => true,
      "result" => [
        {
          "id" => 1,
          "name" => "Motor rallies"
        },
        {
          "id" => 2,
          "name" => "Motor"
        },
        {
          "id" => 3,
          "name" => "Volleyball"
        },
        {
          "id" => 4,
          "name" => "Horses"
        },
        {
          "id" => 5,
          "name" => "Dog Walking"
        }
      ],
      "params" => params
    }
    return
  end
end
