class CreateFrequencyTypes < ActiveRecord::Migration
  def self.up
    create_table :frequency_types do |t|
      t.string :frequency, :limit => 16	  
    end
	new_frequency_type = FrequencyType.new
	new_frequency_type.frequency = "Monthly"
	new_frequency_type.save
	new_frequency_type = FrequencyType.new
	new_frequency_type.frequency = "Annually"
	new_frequency_type.save
	new_frequency_type = FrequencyType.new
	new_frequency_type.frequency = "Once"
	new_frequency_type.save
  end

  def self.down
    drop_table :frequency_types
  end
end
