require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }
  subject do
    Like.create(author_id: 1, post_id: 1)
  end
  before { subject.save }

  it 'like should have user' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'like should have a post' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
