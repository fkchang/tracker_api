module TrackerApi
  module Resources
    class Story
      include Virtus.model

      attribute :client

      attribute :activities, Array[TrackerApi::Resources::Activity]
      attribute :accepted_at, DateTime
      attribute :comment_ids, Array[Integer]
      attribute :comments, Array[TrackerApi::Resources::Comment]
      attribute :created_at, DateTime
      attribute :current_state, String # (accepted, delivered, finished, started, rejected, planned, unstarted, unscheduled)
      attribute :deadline, DateTime
      attribute :description, String
      attribute :estimate, Float
      attribute :external_id, String
      attribute :follower_ids, Array[Integer]
      attribute :id, Integer
      attribute :integration_id, Integer
      attribute :kind, String
      attribute :label_ids, Array[Integer]
      attribute :labels, Array[TrackerApi::Resources::Label]
      attribute :name, String
      attribute :owned_by_id, Integer # deprecated!
      attribute :owner_ids, Array[Integer]
      attribute :owners, Array[TrackerApi::Resources::Person]
      attribute :planned_iteration_number, Integer
      attribute :project_id, Integer
      attribute :requested_by_id, Integer
      attribute :story_type, String # (feature, bug, chore, release)
      attribute :task_ids, Array[Integer]
      attribute :tasks, Array[TrackerApi::Resources::Task]
      attribute :updated_at, DateTime
      attribute :url, String

      # @return [String] Comma separated list of labels.
      def label_list
        @label_list ||= labels.collect(&:name).join(',')
      end

      def tasks(params = {})
        if @tasks.any?
          @tasks
        else
          @tasks = Endpoints::Tasks.new(client).get(project_id, id, params)
        end
      end

      def comments(params = {})
        if @comments.any?
          @comments
        else
          @comments = Endpoints::Comments.new(client).get(project_id, id, params)
        end
      end

      # coz above will refetch any 0 length comments
      def cached_comments
        @comments
      end

      def activities(params = {})
        if @activities.any?
          @activities
        else
          @activities = Endpoints::Activities.new(client).get(project_id, id, params)
        end
      end

    end
  end
end
