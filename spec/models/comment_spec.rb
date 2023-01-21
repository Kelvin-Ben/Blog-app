require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.create(id: 1, text: 'This is a text', author_id: 1, post_id: 1)
  end

  before { subject.save }

  describe 'validations' do
    it 'should have a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  it 'comment should have a user' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'comment should have a post' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
