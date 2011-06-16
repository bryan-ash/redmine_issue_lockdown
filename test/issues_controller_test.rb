require File.dirname(__FILE__) + '/test_helper'
require 'issues_controller'

class IssuesControllerTest < ActionController::TestCase

  context "an open issue" do
    setup { Issue.any_instance.stubs(:closed?).returns(false) }

    getting(:show) { should_render_template :show }    
    getting(:edit) { should_render_template :edit }
  end

  context "a closed issue" do
    setup { Issue.any_instance.stubs(:closed?).returns(true) }

    getting(:show) { should_render_template :show }
    getting(:edit) { should_respond_with 403 }
  end

end
