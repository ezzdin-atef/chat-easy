class CreateElasticsearchIndexForMessages < ActiveRecord::Migration[7.1]
  def change
    Message.__elasticsearch__.create_index! unless Message.__elasticsearch__.index_exists?
  end
end
