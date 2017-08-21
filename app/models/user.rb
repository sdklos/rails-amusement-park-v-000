class User < ActiveRecord::Base
  has_secure_password

  validates :password_digest, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        'happy'
      else
        'sad'
      end
    else
      nil
    end
  end
end
