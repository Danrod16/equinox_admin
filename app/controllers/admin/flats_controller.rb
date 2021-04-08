module Admin
  class FlatsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   foo = Foo.find(params[:id])
    #   foo.update(params[:foo])
    #   send_foo_updated_email
    # end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #  if current_user.super_admin?
    #    resource_class
    #  else
    #    resource_class.with_less_stuff
    #  end
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def update
      if resource_params[:landlord_id].empty?
        flash.now[:alert] = "Ha ocurrido un error por favor vuelve a intentarlo"
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }, status: :unprocessable_entity
      else
        requested_resource.update(resource_params)
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      end
    end
  end
end
