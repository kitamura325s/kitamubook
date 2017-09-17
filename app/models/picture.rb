class Picture < ActiveRecord::Base
    belongs_to :user
    mount_uploader :image, AvatarUploader
    # CommentモデルのAssociationを設定
    has_many :comments, dependent: :destroy
 
    def picture_time
        created_at.strftime("%m/%d/%y at %l:%M %p")
    end
end
