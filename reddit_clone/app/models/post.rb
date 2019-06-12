# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :url, :content, presence: true
  validates :sub_id, :author_id, presence: true  

  belongs_to :author, 
  class_name: :User, 
  primary_key: :id, 
  foreign_key: :author_id 

  belongs_to :sub, 
  class_name: :Sub, 
  primary_key: :id, 
  foreign_key: :sub_id 

  has_many :post_subs, 
  class_name: :PostSub, 
  primary_key: :id, 
  foreign_key: :post_id 

  has_many :subs, 
  through: :post_subs, 
  source: :sub 
end
