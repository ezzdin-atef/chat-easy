class Message < ApplicationRecord
    belongs_to :chat
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

      after_commit on: [:create, :update] do
        __elasticsearch__.index_document
      end


      Message.__elasticsearch__.create_index!
end
