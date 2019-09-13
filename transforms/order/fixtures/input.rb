class Account < ActiveRecord::Base
  has_many :solution_folders, :order => "solution_folders.parent_id", :class_name =>'Solution::Folder'
end
