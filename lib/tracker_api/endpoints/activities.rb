module TrackerApi
  module Endpoints
    class Activities
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, story_id, params={})
        data = client.paginate("/projects/#{project_id}/stories/#{story_id}/activity",params:  params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of activities expected' unless data.is_a? Array

        data.map { |activity| Resources::Activity.new({ client: client }.merge(activity)) }
      end

      def project_get(project_id, params={})
        data = client.paginate("/projects/#{project_id}/activity",params:  params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of activities expected' unless data.is_a? Array

        data.map { |activity| Resources::Activity.new({ client: client }.merge(activity)) }
      end

    end
  end
end
