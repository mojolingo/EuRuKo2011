include XMPP

initialization do

  Connection.message body: /please call/ do |m|
    number_to_call = m.body.match(/please call ([\w\d]+)/)
    Connection.say m.from, "Calling: #{number_to_call[1]}"
  end

  Connection.message :body do |m|
    Connection.say m.from, "You said: #{m.body}"
  end

  Connection.subscription :request? do |s|
    Connection.write_to_stream s.approve!
  end

end
