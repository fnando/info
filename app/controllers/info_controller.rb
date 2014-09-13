class InfoController < ActionController::Base
  if respond_to?(:before_action, true)
    before_action :authorize
  else
    before_filter :authorize
  end

  def show
    if Info.configuration.enabled
      render json: Info.collect
    else
      render nothing: true
    end
  end

  private

  def authorize
    authorizer = Info.configuration.authorizer
    return unless authorizer

    arity = authorizer.arity

    authenticate_or_request_with_http_basic(&authorizer) if arity == 2
    authenticate_or_request_with_http_token(&authorizer) if arity == 1
  end
end
