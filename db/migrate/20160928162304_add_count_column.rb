class AddCountColumn < ActiveRecord::Migration
	def change
		add_column :urls, :url_count, :integer, :default => 0 
	end
end
