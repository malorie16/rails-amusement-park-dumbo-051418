class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :name, :height, :happiness, :nausea, :tickets, presence: true

  validates :happiness, numericality: {greater_than: 0, less_than: 6 }
  validates :nausea, numericality: {greater_than: 0, less_than: 6 }

  def mood
    if self.nausea < self.happiness
      'happy'
    else
      'sad'
    end
  end


end
