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

    key :title
    key :content
    key :submitted_at, Time

    one :author
    many :comments

    plugin KeyAttributes
  end

  before do
    @hash = {
      'title' => 'lorem',
      'content' => "ipsum",
      'submitted_at' => Time.parse('2011-10-25'),

      'author' => Author.new(:name => 'Joe'),
      'comments' => [Comment.new(:content => 'good'), Comment.new(:content => 'bad')]
    }
    @doc = Post.new(@hash)
  end

  it "should return all keys defined" do
    test = @doc.key_attributes
    test.keys.sort.must_equal %w{title content submitted_at}.sort
    %w{title content submitted_at}.each do |attr|
      test[attr].must_equal @hash[attr]
    end
  end

  it "should not include the '_id' key by default" do
    @doc.key_attributes.keys.wont_include '_id'
  end

  it "should not include associations" do
    @doc.key_attributes.keys.wont_include('author')
    @doc.key_attributes.keys.wont_include('comments')
  end

  describe "options" do
    describe ":only" do
      it "should return only specified attributes" do
        @doc.key_attributes(only: [:title, :content]).keys.sort.must_equal %w{title content}.sort
      end

      it "should accept both strings and symbols" do
        @doc.key_attributes(only: ['title', :content]).keys.sort.must_equal %w{title content}.sort
      end

      it "should accept single value" do
        @doc.key_attributes(only: 'content').keys.must_equal %w{content}
      end
    end

    describe ":except" do
      it "should return attributes except specified" do
        @doc.key_attributes(except: ['title', :submitted_at]).keys.sort.must_equal %w{_id content}.sort
      end

      it "should accept single value" do
        @doc.key_attributes(except: :_id).keys.sort.must_equal %w{title content submitted_at}.sort
      end
    end

  end

end
