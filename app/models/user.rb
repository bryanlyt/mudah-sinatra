class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  has_many :products
  has_many :favourites

  def self.authenticate(email, password)
    @user = User.find_by(email: email, password: password)
  end

end
