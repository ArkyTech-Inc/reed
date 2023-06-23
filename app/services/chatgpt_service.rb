require 'httparty'

class ChatGPTService
  include HTTParty
  base_uri 'https://api.openai.com/v1/chat/completions'

  def initialize(api_key)
    @headers = {
      'Authorization' => "Bearer #{}",
      'Content-Type' => 'application/json'
    }
  end

  def send_message(message)
    options = {
      headers: @headers,
      body: {
        'messages' => [
          { 'role' => 'system', 'content' => 'You are a helpful assistant.' },
          { 'role' => 'user', 'content' => message }
        ]
      }.to_json
    }

    response = self.class.post('', options)
    response.parsed_response['choices'].first['message']['content'] if response.success?
  end
end

class ChatGPTService
  def self.send_message(message)
    # ...
    
    response = RestClient.post(
      endpoint,
      {
        messages: [{ role: "system", content: "You are a helpful assistant." }, { role: "user", content: message }]
      }.to_json,
      headers
    )

    # Log the response to the console
    Rails.logger.info("ChatGPT API Response: #{response}")

    # ...

    return parsed_response["choices"][0]["message"]["content"]
  end
end
