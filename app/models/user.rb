class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :city
  has_many :groups, through: :user_groups
  has_many :user_groups
  has_many :cohorts, through: :user_cohorts
  has_many :user_cohorts

  def name
    "#{first_name} #{last_name}"
  end
end
