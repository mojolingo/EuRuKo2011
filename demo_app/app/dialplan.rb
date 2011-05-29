tropo_agi {
  participant_id = call.variables['participant_id'] || 1
  participant = Contact.find participant_id
  play "I'm going to drop you in to the conference call now."
  join 'conference'
}

redirect {
  dial "SIP/prism/tropo-agitate.rb"
}
