class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        # name, email, encrypted_password は空であってはいけない
  validates :name, :email, :encrypted_password, presence: true
  # email は一意である必要がある
  validates :email, uniqueness: true
  # profile, occupation, position は空であってはいけない
  validates :profile, :occupation, :position, presence: true
  

  has_many :prototypes
  has_many :comments
end
