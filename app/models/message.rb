class Message < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
        mappings dynamic: 'false' do
          indexes :content, type: 'text'
          indexes :chat_id, type: 'integer'
        end
      end

      def as_indexed_json(options = {})
        self.as_json(only: [:content, :chat_id])
      end

    belongs_to :chat
end
