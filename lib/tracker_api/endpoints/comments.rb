module TrackerApi
  module Endpoints
    class Comments
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, story_id, params={})
        data = client.paginate("/projects/#{project_id}/stories/#{story_id}/comments",params:  params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of comments expected' unless data.is_a? Array

        data.map { |comment| Resources::Comment.new({ client: client }.merge(comment)) }
      end


    end
  end
end
