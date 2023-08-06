require 'rails_helper'

RSpec.describe Candidate, type: :model do
  before do
    @candidate = FactoryBot.build(:candidate)
  end

  describe 'スケジュール投稿' do
    context 'スケジュールが投稿できる場合' do
      it 'titleとstart_timeが存在していれば保存できる' do
        expect(@candidate).to be_valid
      end
      it 'bodyが空でも保存できる' do
        @candidate.body = ''
        expect(@candidate).to be_valid
      end
    end
    context 'スケジュールが投稿できない場合' do
      it 'titleが空では保存できない' do
        @candidate.title = ''
        @candidate.valid?
        expect(@candidate.errors.full_messages).to include("Title can't be blank")
      end
      it 'start_timeが空では保存できない' do
        @candidate.start_time = ''
        @candidate.valid?
        expect(@candidate.errors.full_messages).to include("Start time can't be blank")
      end
      it 'end_timeが空では保存できない' do
        @candidate.end_time = ''
        @candidate.valid?
        expect(@candidate.errors.full_messages).to include("End time can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @candidate.room = nil
        @candidate.valid?
        expect(@candidate.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @candidate.user = nil
        @candidate.valid?
        expect(@candidate.errors.full_messages).to include('User must exist')
      end
    end
  end
end
