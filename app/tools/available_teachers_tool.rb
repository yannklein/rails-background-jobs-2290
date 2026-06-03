require 'open-uri'

class AvailableTeachersTool < RubyLLM::Tool
  description "Gets available teachers for a batch."

  def initialize(batch_number:)
    @batch_number = batch_number
  end

  def execute
    url = "https://kitt.lewagon.com/api/v1/camps/#{@batch_number}/todays_teachers"

    JSON.parse(URI.parse(url).read)
  rescue => e # If the API fails, return an error the LLM can explain
    { error: e.message }
  end
end
