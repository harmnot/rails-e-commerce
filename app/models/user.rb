class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  before_create :to_upper_case
  enum role: [:admin, :client]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def to_upper_case
    self.name = name.upcase
  end
end
