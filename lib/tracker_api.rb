require 'tracker_api/version'

# dependencies
require 'virtus'
require 'faraday'
require 'faraday_middleware'

# stdlib
require 'addressable/uri'
require 'forwardable'
require 'logger'

module TrackerApi
  autoload :Error, 'tracker_api/error'
  autoload :Client, 'tracker_api/client'
  autoload :Logger, 'tracker_api/logger'

  module Errors
    class UnexpectedData < StandardError; end
  end

  module Endpoints
    autoload :Activities, 'tracker_api/endpoints/activities'
    autoload :Comments, 'tracker_api/endpoints/comments'
    autoload :Epic, 'tracker_api/endpoints/epic'
    autoload :Epics, 'tracker_api/endpoints/epics'
    autoload :Iterations, 'tracker_api/endpoints/iterations'
    autoload :Me, 'tracker_api/endpoints/me'
    autoload :Memberships, 'tracker_api/endpoints/memberships'
    autoload :Project, 'tracker_api/endpoints/project'
    autoload :Projects, 'tracker_api/endpoints/projects'
    autoload :Stories, 'tracker_api/endpoints/stories'
    autoload :Story, 'tracker_api/endpoints/story'
    autoload :Tasks, 'tracker_api/endpoints/tasks'
  end

  module Resources
    autoload :Account, 'tracker_api/resources/account'
    autoload :Activity, 'tracker_api/resources/activity'
    autoload :Comment, 'tracker_api/resources/comment'
    autoload :Epic, 'tracker_api/resources/epic'
    autoload :Iteration, 'tracker_api/resources/iteration'
    autoload :Me, 'tracker_api/resources/me'
    autoload :MembershipSummary, 'tracker_api/resources/membership_summary'
    autoload :Label, 'tracker_api/resources/label'
    autoload :Person, 'tracker_api/resources/person'
    autoload :Project, 'tracker_api/resources/project'
    autoload :ProjectMembership, 'tracker_api/resources/project_membership'
    autoload :Story, 'tracker_api/resources/story'
    autoload :Task, 'tracker_api/resources/task'
    autoload :TimeZone, 'tracker_api/resources/time_zone'
  end
end
