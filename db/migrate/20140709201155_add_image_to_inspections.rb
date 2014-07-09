class AddImageToInspections < ActiveRecord::Migration
def self.up
	add_attachment :inspections, :image
end

def self.down
	remove_attachment :inspections, :image
end


end
