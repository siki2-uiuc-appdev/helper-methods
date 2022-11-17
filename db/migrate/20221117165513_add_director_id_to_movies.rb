class AddDirectorIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_colummn :movies, :director_id, :integer
  end
end
