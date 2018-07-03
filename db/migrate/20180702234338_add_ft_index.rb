class AddFtIndex < ActiveRecord::Migration[5.1]
  def change
  	execute "
    create index on works using gin(to_tsvector('english', aka));
    create index on works using gin(to_tsvector('english', name));
    create index on works using gin(to_tsvector('english', wikipedia_text));"
  end
end
