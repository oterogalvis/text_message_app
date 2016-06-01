class TextMessage < ActiveRecord::Base
	validates :number, presence: true
	validates :number, length: { in: 10..10 }
	validates :number, numericality: true
	validates :body, presence: true

  def send_text_message
	twilio_sid = "AC0faee7994cf6272b7e456ab864d5ed55"
	twilio_token = "d903f5b92df634756b83dbf3cc6620f0"

	@client = Twilio::REST::Client.new twilio_sid, twilio_token
	message = @client.account.messages.create(:body => body,
	    :to => "+1" + number,
	    :from => "+12015911423")
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