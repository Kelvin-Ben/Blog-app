require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create(id: 1, title: 'This is the title of the post')
  end

  before { subject.save }

  describe 'validate' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  it 'title should not be too short' do
    subject.title = 'a'
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 250
    expect(subject).to_not be_valid
  end

  it 'recent_comments should return five lastest comments' do
    4.times { Comment.create(text: 'Text', post_id: subject.id) }
    expect(subject.recent_comments.count) == 5
  end

  it 'update_comments_counter method should update comments' do
    4.times { Comment.create(text: 'Text', post_id: subject.id) }
    expect(subject.update_comments_counter) == 0
  end

  it 'update_likes_counter method should update likes' do
    4.times { Like.create(author_id: subject.id, post_id: subject.id) }
    expect(subject.update_likes_counter) == 0
  end
end
