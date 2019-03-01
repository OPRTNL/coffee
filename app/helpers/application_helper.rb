module ApplicationHelper
  def photo_for(partner)
    if partner.photo.present?
      cl_image_tag partner.photo, height: 300, width: 900, crop: :fill
    else
      cl_image_tag "https://res.cloudinary.com/dojywbs2z/image/upload/v1551449644/Coffee/sospenso-partners-defaultpic.jpg", height: 600, width: 900, crop: :fill
    end
  end
end
