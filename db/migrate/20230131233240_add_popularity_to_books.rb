class AddPopularityToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :popularity, :string
  end
end
