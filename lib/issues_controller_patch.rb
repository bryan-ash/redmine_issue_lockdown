require_dependency 'issues_controller'

class IssuesController
  before_filter :lockdown_closed_issue, :only => [:edit]

  private

  def lockdown_closed_issue
    render_403 if @issue.closed?
  end
end
