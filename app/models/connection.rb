class Connection < ActiveRecord::Base
  belongs_to :connector, class_name: "User", foreign_key: "connector_id"
  belongs_to :connectee, class_name: "User", foreign_key: "connectee_id"
end
