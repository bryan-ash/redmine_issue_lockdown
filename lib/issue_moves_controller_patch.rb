require_dependency 'issue_moves_controller'

class IssueMovesController
  before_filter :lockdown_any_closed_issue

  private

  def lockdown_any_closed_issue
    render_403 if @issues.any? { |issue| issue.closed? }
  end
end
