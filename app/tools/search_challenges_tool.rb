class SearchChallengesTool < RubyLLM::Tool
  description "Searches challenges by keyword in name, module, or content."
  param :query, desc: "The keyword to search for"

  def execute(query:)
    challenges = Challenge.all
    query.split.each do |word|
      challenges = challenges.where("name ILIKE :q OR content ILIKE :q OR module ILIKE :q", q: "%#{word}%")
    end
    return "No challenges found for '#{query}'" if challenges.empty?

    challenges.map { |challenge| { id: challenge.id, name: challenge.name, module: challenge.module, description: challenge.content.truncate(200) } }
  end
end
