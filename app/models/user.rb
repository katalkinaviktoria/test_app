class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, confirmation: true,
              if: Proc.new { |u| u.new_record? or !u.password.blank? }, allow_blank: true


  def self.edit_user_by?(u, cu)
    u == cu || cu.try(:admin?)
  end
end
