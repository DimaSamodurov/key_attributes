require_relative 'test_helper'

describe "key_attributes" do

  class Author
    include MongoMapper::EmbeddedDocument
    key :name
  end

  class Comment
    include MongoMapper::EmbeddedDocument
    key :content
  end

  class Post
    include MongoMapper::Document
    key :content
    key :submitted_at, Time

    one :author
    many :comments

    plugin KeyAttributes
  end

  before do
    @hash = {
      'content' => "lorem ipsum",
      'submitted_at' => Time.parse('2011-10-25'),
      'author' => Author.new(:name => 'Joe'),
      'comments' => [Comment.new(:content => 'good'), Comment.new(:content => 'bad')]
    }
    @doc = Post.new(@hash)
  end

  it "should return all keys defined" do
    @doc.key_attributes.must_include 'content'
    @doc.key_attributes.must_include 'submitted_at'
  end

  it "should include the '_id' key" do
    @doc.key_attributes.keys.must_include('_id')
  end

  it "should not include associations" do
    @doc.key_attributes.keys.wont_include('author')
    @doc.key_attributes.keys.wont_include('comments')
  end

end
