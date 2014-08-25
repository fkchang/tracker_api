module TrackerApi
  module Resources
    class Activity
      include Virtus.model

      attribute :client
      attribute :kind, String
      attribute :guid, String
      attribute :project_version, Integer
      attribute :message, String
      attribute :highlight, String
      attribute :changes, Array[Hash]
      attribute :primary_resources, Array[Hash]
      attribute :project_id, Integer
      attribute :performed_by_id, Integer
      attribute :occurred_at, DateTime
    end
  end
end
