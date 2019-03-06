class PartnerCountersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "partner_counter_#{params[:counter_partner_id]}"
  end
end
