tropo_agi {
  if execute('ask', { prompt: 'Do you want to play the simon game?', :choices => 'yes' }.to_json)
    simon_game
  else
    result = execute 'ask', { prompt: "what's your favourite colour?", :choices => 'red,blue,green' }.to_json
    if result
      response = JSON.parse result[11..-1] # Get rid of the '200 result =' and then parse the JSON
      play "You said your favourite colour was #{response['interpretation']}. Goodbye."
    else
      play "You chose an invalid colour, dumbass"
    end
  end
  hangup
}
