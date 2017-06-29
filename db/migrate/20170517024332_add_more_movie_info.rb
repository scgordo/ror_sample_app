class AddMoreMovieInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :year_released, :integer
    add_column :movies, :info_url, :string
  end
end
