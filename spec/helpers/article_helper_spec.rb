require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ArticleHelper. For example:
#
# describe ArticleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticleHelper, type: :helper do
  let(:user1) { 
    User.create(first_name: 'John', last_name: "Doe", email: "a@b.co", password: 'password')
  }
  let(:user2) { 
    User.create(first_name: 'Jane', last_name: "Doe", email: "b@c.do", password: 'password')
  }
  let(:article) {
    Article.create(external_id: 1, by: "Jane Doe", time: Time.at(1), title: "Test Article", url: 'https://www.example.com', kind: 'story', data: { foo: :bar })
  }

  describe "#star_classes" do
    it "should return 'article__star' if there is no join between current_user and the article" do
      expect(helper.star_classes(article, user1)).to eq('article__star')
    end
    it "should return 'article__star article__star--selected' if there is a join" do
      UsersArticle.create(user: user1, article: article)
      expect(helper.star_classes(article, user1)).to eq('article__star article__star--selected')
    end
  end
  describe "#article_liked_by" do
    it "should return a blank string if there is no join" do
      expect(helper.article_liked_by(article)).to eq('')
    end
    it "should return a joined user names if there are joins" do
      UsersArticle.create(user: user1, article: article)
      UsersArticle.create(user: user2, article: article)
      expect(helper.article_liked_by(article)).to eq("John Doe and Jane Doe")
    end
  end
end

# module ArticleHelper
#   def star_classes(article, current_user)
#     if article.users.include? current_user
#       'article__star article__star--selected'
#     else
#       'article__star'
#     end
#   end
#   def article_liked_by(article)
#     article.users.map(&:full_name).to_sentence
#   end
# end

