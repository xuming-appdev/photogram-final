# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#
class Like < ApplicationRecord
  belongs_to(:photo, { :required => true, :class_name => "Photo", :foreign_key => "photo_id", :counter_cache => true })
  belongs_to(:fan, { :required => true, :class_name => "User", :foreign_key => "fan_id", :counter_cache => true })

  def fan
    my_fan_id = self.fan_id

    matching_users = User.where({ :id => my_fan_id })

    the_user = matching_users.at(0)

    return the_user
  end

  def photo
    my_photo_id = self.photo_id

    matching_photos = Photo.where({ :id => my_photo_id })

    the_photo = matching_photos.at(0)

    return the_photo
  end




end
