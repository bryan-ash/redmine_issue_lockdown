require File.dirname(__FILE__) + '/test_helper'
require 'issue_moves_controller'

class IssueMovesControllerTest < ActionController::TestCase

  context "an authorized user moving" do
    setup { @request.session[:user_id] = (authorized_user=2) }

    context "an open issue" do
      setup { Issue.any_instance.stubs(:closed?).returns(false) }

      getting(:new) { should_render_template 'issue_moves/new' }
    end

    context "a closed issue" do
      setup { Issue.any_instance.stubs(:closed?).returns(true) }

      getting(:new) { should_respond_with 403 }
    end
  end

end

