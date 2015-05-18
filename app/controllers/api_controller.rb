class ApiController < ApplicationController
  # protect_from_forgery with: :null_session
  # skip_before_filter :verify_authenticity_token

  # CORS
  skip_before_filter :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, content-type'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

  
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

  def match_mine
    render json: {
      "success" => true,
      "result" => [
        {
          "conversation_id" => 1,
          "last_message" => {
            "user_id" => 1,
            "message" => "Cya there bro",
            "time" => "2015-04-26T00:00:00Z",
            "unread" => true
          },
          "users" => [
            {
              "id" => 1,
              "name" => "Jake",
              "photo" => "http://placehold.it/100x100",
              "friend" => true,
            }
          ],
          "matched_for" => [
            {
              "id" => 1,
              "name" => "Hockey",
              "time" => "2015-04-22T01:11:21Z"
             }
           ],
        },
        {
          "conversation_id" => 2,
          "last_message" => nil,
          "users" => [
            {
              "id" => 1,
              "name" => "Jake",
              "photo" => "http://placehold.it/100x100",
              "friend" => true,
            },
            {
              "id" => 2,
              "name" => "Alex",
              "description" => "Scrim",
              "photo" => "http://placehold.it/100x100",
              "friend" => false,
            }
          ],
          "matched_for" => {
            "time" => "2015-04-25T02:15:31Z",
            "tags" => [
              {
                "id" => 1,
                "name" => "Hockey",
              }
            ]
          }
        }
      ]
    }
  end
end
