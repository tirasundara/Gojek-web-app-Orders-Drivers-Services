class UserGopayTopupConsumer < Racecar::Consumer
  subscribes_to "gopay-topup"

  def process(message)
    puts "Received message: #{message.value}"
    user_attributes = JSON.parse(message.value)
    user = User.find(user_attributes["id"])
    user.update_attributes(user_attributes)
  end
end
