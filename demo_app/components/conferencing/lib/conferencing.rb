include XMPP

initialization do

  TropoREST.tokens = COMPONENTS.conferencing[:tokens]
  TropoREST::Troplets.base_uri 'https://api.tropo.com'

  Connection.subscription :request? do |s|
    Connection.write_to_stream s.approve!
  end

end

methods_for :rpc do
  def originate(participant_ids)
    participant_ids.each do |pid|
      participant = Contact.find pid
      ahn_log.debug "inviting participant #{participant.inspect}"
      filters = [:body, from: /#{participant.jid}/]
      Connection.message *filters do |m|
        begin
          if m.body =~ /yes|sure|ok/i
            ahn_log.debug "Sending #{m.from} into the conference"
            Connection.say m.from, "Ok, I'll call you now!"
            if participant.number =~ /SIP/
              Adhearsion::VoIP::Asterisk.manager_interface.send_action 'Originate', channel:participant.number, async: true, application: "AGI", data: "agi://localhost:4573/redirect", variables: {participant_id: pid}
            else
              TropoREST.originate destination: participant.number, participants: participant_ids
            end
          else
            ahn_log.debug "#{m.from} cannot attend the conference: #{m.body}"
            Connection.say m.from, "Ok, I'll let everyone know!"
            (participant_ids - [pid]).each do |pid|
              Connection.say Contact.find(pid).jid, "Sorry, #{participant.name} cannot make it to the conference because: #{m.body}"
            end
            TropoREST::Troplets.originate apology: m.body
          end
          Connection.client.clear_handlers :message, *filters
        rescue => e
          ahn_log.error e.message
        end
      end
      Connection.say participant.jid, "You have been invited to join a conference call. Are you able to participate?"
    end
  end
end
