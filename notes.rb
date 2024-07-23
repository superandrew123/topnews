=begin
get and store articles from hackernews
- use cache to see if there are new stories to be retreived
- set-up a task to get new stories

Should have looked into the hacker news response earlier, it only returns article ids
Will need to iterate across these to get additonal items
=end

ids = HackerNews::Api::GetRecentArticles.()
HackerNews::Api::GetRecentArticles.().each do |id|
  api_response = HackerNews::Api::GetArticle.(id)
  HackerNews::Articles::Store.(api_response)
end
