class TextMessage < ActiveRecord::Base
	validates :number, presence: true
	validates :number, length: { in: 10..10 }
	validates :number, numericality: true
	validates :body, presence: true

  def send_text_message
	twilio_sid = "AC5bde5caa5c1c9d2c541f0874cb1259a8"
	twilio_token = "db6f19ca55212e2decde1a31323f0322"

	@client = Twilio::REST::Client.new twilio_sid, twilio_token
	message = @client.account.messages.create(:body => body,
	    :to => "+1" + number,
	    :from => "+18575760576")
  end



end

# def send_text
# 	twilio_sid = "AC3245607d9409fbe380f477149201fa9e"
# 	twilio_token = "8b39db05f7c9fe4032308b649e5d14ae"

# 	@client = Twilio::REST::Client.new twilio_sid, twilio_token
# 	message = @client.account.messages.create(:body => "Hello from Ruby",
# 	    :to => "+17868770469",
# 	    :from => "+17862570662")

# 	puts message.sid
# end
# send_text