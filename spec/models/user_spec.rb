require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(id: 1, name: 'Tom', photo: 'Here should be a photo', bio: 'I love the article')
  end

  before { subject.save }

  describe 'validate' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  it 'recent_post method should return three lastest post' do
    4.times { Post.create(title: 'Title', text: 'Text', author_id: subject.id) }
    expect(subject.recent_posts.count) == 3
  end
  it 'update_post_count method should update posts' do
    4.times { Post.create(title: 'Title', text: 'Text', author_id: subject.id) }
    expect(subject.update_posts_counter) == 4
  end
end
