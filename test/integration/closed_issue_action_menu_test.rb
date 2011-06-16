require File.dirname(__FILE__) + '/../test_helper'

class IssuesControllerTest < ActionController::TestCase

  context "an authorized user" do
    setup { @request.session[:user_id] = (authorized_user=1) }

    context "showing an open issue" do
      setup do
        Issue.any_instance.stubs(:closed?).returns(false)
        get :show, :id => 1
      end

      should "see an update link" do
        assert_select 'a.icon-edit'
      end

      should "see a move link" do
        assert_select 'a.icon-move'
      end
    end

    context "showing a closed issue" do
      setup do
        Issue.any_instance.stubs(:closed?).returns(true)
        get :show, :id => 1
      end

      should "not see an update link" do
        assert_select 'a.icon-edit', false
      end

      should "not see a move link" do
        assert_select 'a.icon-move', false
      end
    end
  end
  
end
