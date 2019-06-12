# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  post_id    :integer
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :sub_id, presence: true 

  belongs_to :post, 
  class_name: :Post, 
  primary_key: :id, 
  foreign_key: :post_id 

  belongs_to :sub, 
  class_name: :Sub, 
  primary_key: :id, 
  foreign_key: :sub_id  
end
