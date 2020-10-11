class ApplicationController < ActionController::Base
  before_action :footer_sections

  private

  def footer_sections
    @footer_sections = [
      { title: 'The Basics', items: ['About TMDb', 'Contact Us', 'Support Forums', 'API', 'System Status'] },
      { title: 'Get Involved', items: ['Contibution Bible', '3rd Party Applications', 'Add New Movie', 'Add New TV Show'] },
      { title: 'Community', items: ['Guidelines', 'Discussions', 'Leaderboard', 'Twitter'] },
      { title: 'Legal', items: ['Terms of Use', 'API Terms of Use', 'Privacy Policy'] }
    ]
  end
end
