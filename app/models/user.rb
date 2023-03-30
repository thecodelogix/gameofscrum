class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.avatar_image_url = auth.info.image
      user.skip_confirmation!
    end
  end
end
