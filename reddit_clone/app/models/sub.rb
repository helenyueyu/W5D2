# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true 
  validates :moderator_id, presence: true 

  belongs_to :moderator, 
  class_name: :User, 
  primary_key: :id, 
  foreign_key: :moderator_id 

  has_many :posts, 
  class_name: :Post, 
  primary_key: :id, 
  foreign_key: :sub_id  

  has_many :post_subs, 
  class_name: :PostSub, 
  primary_key: :id,
  foreign_key: :sub_id 
end
